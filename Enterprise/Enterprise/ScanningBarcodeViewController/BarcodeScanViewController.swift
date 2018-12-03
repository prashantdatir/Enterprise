//
//  BarcodeScanViewController.swift
//  Enterprise
//
//  Created by admin on 26/10/18.
//  Copyright © 2018 admin. All rights reserved.
//


import UIKit
import AVFoundation
import CoreData

protocol QRProtocol {
    func receiveValue(QRData: String)
}


class BarcodeScanViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {



    
    @IBOutlet weak var scanView: UIView?
    @IBOutlet weak var resultLabel: UILabel?



    var delegate = QRProtocol.self

    var output = AVCaptureMetadataOutput()
    var previewLayer: AVCaptureVideoPreviewLayer!

    fileprivate var captureSession = AVCaptureSession()
    var isReading: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        if !self.isReading
        {
                if !self.captureSession.isRunning
                {
                    self.captureSession.startRunning()
                }
            setupCamera()
        }
        else
        {
            DispatchQueue.global(qos: .background).async
            {
                if self.captureSession.isRunning
                {
                    self.captureSession.stopRunning()
                }
            }
        }
        isReading = !isReading
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    fileprivate func setupCamera() {
        guard let device = AVCaptureDevice.default(for: .video),
            let input = try? AVCaptureDeviceInput(device: device) else {
                return
        }

        DispatchQueue.global(qos: .background).async {
            if self.captureSession.canAddInput(input) {
                self.captureSession.addInput(input)
            }

            let metadataOutput = AVCaptureMetadataOutput()

            if self.captureSession.canAddOutput(metadataOutput) {
                self.captureSession.addOutput(metadataOutput)

                metadataOutput.setMetadataObjectsDelegate(self, queue: .global(qos: .background))

                if Set([.qr, .ean13, .code128]).isSubset(of: metadataOutput.availableMetadataObjectTypes) {
                    metadataOutput.metadataObjectTypes = [.qr, .ean13, .code128]
                }
            } else {
                print("Could not add metadata output")
                self.failed()
            }

           self.previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
            self.previewLayer.videoGravity = .resizeAspectFill

            DispatchQueue.main.async {
                self.previewLayer.frame = self.view.bounds
                self.view.layer.addSublayer(self.previewLayer)
            }
        }

    }
    var QRString = String()
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        for metadata in metadataObjects
        {
            let metaData = metadata
            print(metaData.description)
            let transformed = previewLayer?.transformedMetadataObject(for: metaData) as? AVMetadataMachineReadableCodeObject
            if let unwraped = transformed
            {
                print(unwraped.stringValue!)
                QRString = unwraped.stringValue!
                isReading = false

            }
            if #available(iOS 10.0, *) {
                //working line to save barcode in database
                self.coder(codeScanned: self.QRString)
                
            } else {
                // Fallback on earlier versions
            }
            
            self.performSelector(onMainThread: #selector(stopReadingBarcode), with: nil, waitUntilDone: false)

        }
    }
    func failed()
    {
        
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        //captureSession = nil
    }
    @available(iOS 10.0, *)
    func coder(codeScanned : String)
    {
        //set container
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //set context from container
        let context = appDelegate.persistentContainer.viewContext
        //setting entity
        let entity  =   NSEntityDescription.entity(forEntityName: "BarcodeEntry", in: context)
        //insert in MO
        let insertValue =   NSManagedObject(entity: entity!, insertInto: context)
        insertValue.setValue(codeScanned, forKey: "scannedData")
        do {
            try context.save()
        }
        catch{
            print("Coudnt save")
        }
    }
    @objc func stopReadingBarcode()
    {
        //self.delegate.receiveValue(QRData: self.QRString)

        
        let alertController = UIAlertController(title: "Barcode Scanned", message: QRString, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler:
        { (UIAlertAction) in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
}
