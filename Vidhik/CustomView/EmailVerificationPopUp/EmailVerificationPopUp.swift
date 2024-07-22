//
//  EmailVerificationPopUp.swift
//  Vidhik
//
//  Created by NumeroEins on 16/01/24.
//

import UIKit

class EmailVerificationPopUp: UIView {
    //MARK: =================== IBOutlets Properties ===================
    @IBOutlet weak var emailVerifyPopUp: UIView!
    @IBOutlet weak var accountResgistrationPopup: UIView!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnOtpCancel: UIButton!
    @IBOutlet weak var btnOK: UIButton!
    @IBOutlet weak var btnCancelPopup: UIButton!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var txtOtpNo1: UITextField!
    @IBOutlet weak var txtOtpNo2: UITextField!
    @IBOutlet weak var txtOtpNo3: UITextField!
    @IBOutlet weak var txtOtpNo4: UITextField!
    @IBOutlet weak var txtOtpNo5: UITextField!
    @IBOutlet weak var txtOtpNo6: UITextField!
    @IBOutlet weak var btnResendNewCode: UIButton!
    
    
    var view: UIView!
    var isfrom = ""
    var strOTP = ""
    var strEmail = ""
    let createAccountVM = CreateAccountVM()
    var callbackForResendOtp: (() -> ())?
    var callbackForOK: (() -> ())?
    var callBackForEmailVerification: (() -> ())?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetUp(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        self.addShadow(view: emailVerifyPopUp)
        self.txtOtpNo1.delegate = self
        self.txtOtpNo2.delegate = self
        self.txtOtpNo3.delegate = self
        self.txtOtpNo4.delegate = self
        self.txtOtpNo5.delegate = self
        self.txtOtpNo6.delegate = self
        self.addShadow(view: accountResgistrationPopup)
    }
    
    private func xibSetUp(frame: CGRect) {
        self.view = loadNibView()
        view.frame = frame
        addSubview(view)
    }
    
    private func loadNibView() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "EmailVerificationPopUp", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    private func addShadow(view: UIView) {
        view.layer.shadowColor = UIColor(red: 5/255, green: 59/255, blue: 255/255, alpha: 0.4).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 5
    }
    
    // MARK: =============================================== Email Verify API  Method ===============================================
   private func verifyEmailOTP() {
        let otpTextFields = [txtOtpNo1.text ?? "", txtOtpNo2.text ?? "",
                             txtOtpNo3.text ?? "", txtOtpNo4.text ?? "",
                             txtOtpNo5.text ?? "", txtOtpNo6.text ?? ""]
   
        otpTextFields.forEach {
            strOTP += $0
            print("strOTP====================\(strOTP)")
        }
       
        Loader.show()
        createAccountVM.emailVerifyOtpQuery(email: email.text ?? "", otp: strOTP) { [weak self] response, message in
            
            Loader.hide()
            switch response {
            case .success:
                AlertView.show(title: "", message: message, okTitle: "Ok", cancelTitle: "") { index in
                    if index == 1 {
                        self?.callBackForEmailVerification?()
                        self?.removeFromSuperview()
                    }
                }
            default:
                AlertView.show(title: "", message: message)
            }
        }
    }
    
    //MARK: ====================================== IBAction Methods ======================================
    @IBAction func btnOTPCancelAction(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    
    @IBAction func btnResendNewCodeAction(_ sender: UIButton) {
        self.txtOtpNo1.text = ""
        self.txtOtpNo2.text = ""
        self.txtOtpNo3.text = ""
        self.txtOtpNo4.text = ""
        self.txtOtpNo5.text = ""
        self.txtOtpNo6.text = ""
        callbackForResendOtp?()
    }
    
    @IBAction func btnCancelAction(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    
    @IBAction func btnOKAction(_ sender: UIButton) {
        callbackForOK?()
    }
    
    @IBAction func btCancelPopUpAction(_ sender: UIButton) {
        self.removeFromSuperview()
    }
}

//MARK: ====================================== Extension UITextField Delegate Methods ======================================
extension EmailVerificationPopUp: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if (textField.text?.count)! < 1 && string.count > 0 {
            if textField == txtOtpNo1 {
                txtOtpNo2.becomeFirstResponder()
            }
            if textField == txtOtpNo2 {
                txtOtpNo3.becomeFirstResponder()
            }
            if textField == txtOtpNo3 {
                txtOtpNo4.becomeFirstResponder()
            }
            if textField == txtOtpNo4 {
                txtOtpNo5.becomeFirstResponder()
            }
            if textField == txtOtpNo5 {
                txtOtpNo6.becomeFirstResponder()
            }
            if textField == txtOtpNo6 {
                print("text field is filled")
                txtOtpNo6.resignFirstResponder()
                textField.text = string
                verifyEmailOTP()
            }
            textField.text = string
            return false
            
        } else if (textField.text?.count)! >= 1 && string.count == 0 {
            if textField == txtOtpNo2 {
                txtOtpNo1.becomeFirstResponder()
            }
            if (textField == txtOtpNo3) {
                txtOtpNo2.becomeFirstResponder()
            }
            if (textField == txtOtpNo4) {
                txtOtpNo3.becomeFirstResponder()
            }
            if (textField == txtOtpNo5) {
                txtOtpNo4.becomeFirstResponder()
            }
            if (textField == txtOtpNo6) {
                txtOtpNo5.becomeFirstResponder()
            }
            if (textField == txtOtpNo1) {
                print("All text field is empty")
                txtOtpNo1.resignFirstResponder()
            }
            textField.text = string
            return false
        } else if (textField.text?.count)! >= 1 {
            textField.text = string
            return false
        }
        return true
    }
}

