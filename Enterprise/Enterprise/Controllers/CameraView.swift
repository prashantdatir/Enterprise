//
//  CameraView.swift
//  Enterprise
//
//  Created by user on 10/31/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import AVFoundation
class CameraView: UIView {

    override class var layerClass: AnyClass {
        get {
            return AVCaptureVideoPreviewLayer.self
        }
    }
    override var layer: AVCaptureVideoPreviewLayer {
        get {
            return super.layer as! AVCaptureVideoPreviewLayer
        }
    }
}
