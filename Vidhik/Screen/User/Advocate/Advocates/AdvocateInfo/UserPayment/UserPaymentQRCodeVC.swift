//
//  UserPaymentQRCodeVC.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 19/03/24.
//

import UIKit
import AVFoundation

enum PaymentSeletion {
    case first
    case second
    case third
}

// MARK: - Constants

enum ConstantsQRCodeScaner {
    static let alertTitle = "Scanning is not supported"
    static let alertMessage = "Your device does not support scanning a code from an item. Please use a device with a camera."
    static let alertButtonTitle = "OK"
}

class UserPaymentQRCodeVC: UIViewController {
    // MARK: ================================ IBOutlets Properties ================================
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var hoursStackView: UIStackView!
    @IBOutlet weak var checkButtonFirst: UIButton!
    @IBOutlet weak var profileImageFirst: UIImageView!
    @IBOutlet weak var rateFirstLabel: UILabel!
    @IBOutlet weak var timeFirstLabel: UILabel!
    @IBOutlet weak var checkButtonSecond: UIButton!
    @IBOutlet weak var profileImageSecond: UIImageView!
    @IBOutlet weak var rateSecondLabel: UILabel!
    @IBOutlet weak var timeSecondLabel: UILabel!
    @IBOutlet weak var checkButtonThird: UIButton!
    @IBOutlet weak var profileImageThird: UIImageView!
    @IBOutlet weak var rateThirdLabel: UILabel!
    @IBOutlet weak var timeThirdLabel: UILabel!
    @IBOutlet weak var qrCodeView: UIView!
    @IBOutlet weak var stcakViewHightConstraint: NSLayoutConstraint!
    
    // MARK: ================================ Instance Properties ================================
    var isFirstTimePayment: Bool?
    let session = AVCaptureSession()
    
    // MARK: ================================ View Controller Life Cycle Method ================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stcakViewHightConstraint.constant = 0
        firstLabel.text = isFirstTimePayment == true ?  "Schedule a meeting with the lawyer upon succesful payment." : "All the details of the lawyer upon successful payment."
        secondLabel.text = isFirstTimePayment == true ? "For this you will be charged INR 500." : "For this you will be charged INR 500."
        didSelectPayment(isPayment: .first)
    }
    
    // MARK: ================================ Setup Camera Method ================================
    private func setupCamera() {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            let output = AVCaptureMetadataOutput()
            output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            session.addInput(input)
            session.addOutput(output)
            output.metadataObjectTypes = [.qr]
            let previewLayer = AVCaptureVideoPreviewLayer(session: session)
            previewLayer.videoGravity = .resizeAspectFill
            previewLayer.frame = view.bounds
            qrCodeView.layer.addSublayer(previewLayer)
            session.startRunning()
        } catch {
            showAlert()
            print(error)
        }
    }
    
    // MARK: ================================ Alert ================================
    private func showAlert() {
        let alert = UIAlertController(title: ConstantsQRCodeScaner.alertTitle, message: ConstantsQRCodeScaner.alertMessage, preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: ConstantsQRCodeScaner.alertButtonTitle, style: .default))
        present(alert, animated: true)
    }
    
    // MARK: ================================ Private Method Payment Selection ================================
    private func didSelectPayment(isPayment: PaymentSeletion) {
        // Reset state
        [checkButtonFirst, checkButtonSecond, checkButtonThird].forEach { button in
            button?.setImage(UIImage(named:  "UncheckCircle"), for: .normal)
        }
   
        switch isPayment {
        case .first:
            checkButtonFirst.setImage(UIImage(named:  "checkCircle"), for: .normal)
        case .second:
            checkButtonSecond.setImage(UIImage(named:  "checkCircle"), for: .normal)
        case .third:
            checkButtonThird.setImage(UIImage(named:  "checkCircle"), for: .normal)
        }
    }
    
    // MARK: ================================ IBAction Methods ================================
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func scanQrCodeButtonAction(_ sender: UIButton) {
        //setupCamera()
        let paymentSuccessFulVC = storyboard?.instantiateViewController(identifier: "PaymentSuccessFulVC") as! PaymentSuccessFulVC
        self.navigationController?.pushViewController(paymentSuccessFulVC, animated: true)
    }
    
    @IBAction func firstButtonAction(_ sender: UIButton) {
        didSelectPayment(isPayment: .first)
    }
    
    @IBAction func secondButtonAction(_ sender: UIButton) {
        didSelectPayment(isPayment: .second)
    }
    
    @IBAction func thirdButtonAction(_ sender: UIButton) {
        didSelectPayment(isPayment: .third)
    }
}


// MARK: ================================ AVCaptureMetadataOutputObjectsDelegate ================================
extension UserPaymentQRCodeVC: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
              metadataObject.type == .qr,
              let stringValue = metadataObject.stringValue else { return }
        print(stringValue)
    }
}
