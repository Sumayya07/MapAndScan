//
//  ScannerViewController.swift
//  MapAndScan
//
//  Created by Sumayya Siddiqui on 21/08/23.
//

import UIKit
import BarcodeScanner

class ScannerViewController: UIViewController, BarcodeScannerCodeDelegate, BarcodeScannerErrorDelegate, BarcodeScannerDismissalDelegate {
    
    @IBOutlet var btnScanBarcode: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnScanBarcode.layer.cornerRadius = btnScanBarcode.frame.size.height/2

        
    }
    
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        print("Barcode Data: \(code)")
        print("Symbology Type: \(type)")
        controller.dismiss(animated: true, completion: nil)
    }

    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        print(error)
    }

    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func btnScanBarcodePressed(_ sender: UIButton) {
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self
        viewController.errorDelegate = self
        viewController.dismissalDelegate = self

        present(viewController, animated: true, completion: nil)
    }

    
    
}
