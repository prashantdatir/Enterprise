//
//  ENBarcodeScannerViewController.swift
//  Enterprise
//
//  Created by user on 11/1/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import AVFoundation
class ENBarcodeScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    
    
    @IBOutlet weak var scanView: UIView!
    @IBOutlet weak var resultLabel: UILabel!





    fileprivate var isScanning: Bool?
    fileprivate var isFirstApplyOrientation: Bool?
    fileprivate var captureSizeTransform: CGAffineTransform?


    // MARK: Life Circles

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

}


