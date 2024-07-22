//
//  UserEditProfileVC.swift
//  Vidhik
//
//  Created by NumeroEins on 15/03/24.
//

import UIKit

class UserEditProfileVC: UIViewController {
    //MARK: ================================ IBOutlet ================================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnChange: UIButton!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLocation: UITextField!
    @IBOutlet weak var btnLocationDropDown: UIButton!
    @IBOutlet weak var locationDropDownView: CustomDropDownView!
    @IBOutlet weak var locationDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var txtMobileNo: UITextField!
    @IBOutlet weak var btnSendMobileOTP: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnSendEmailOTP: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    var emailVerifyPopUp: EmailVerificationPopUp?
    let userEditProfileVM = UserEditProfileVM()
    var arrData = ["Andhra Pradesh","Arunachal Pradesh","Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur"]
    
    private lazy var imagePicker: ImagePicker = {
        let imagePicker = ImagePicker()
        imagePicker.delegate = self
        return imagePicker
    }()
    
    // MARK: ================================ View Controller Life Cycle Methods ================================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setUpNaviagtionBar()
        setUserData()
    }
    
    private func setUserData() {
        txtName.text = UserKeychainManager.shared.getFullname()?.capitalized
        txtMobileNo.text = UserKeychainManager.shared.getPrimaryNumber()
        txtEmail.text = UserKeychainManager.shared.getEmail()
        txtLocation.text = UserKeychainManager.shared.getAddress()
        print(UserKeychainManager.shared.getToken() ?? "")
    }
    
    // MARK: ================================ Private Methods Setup NavigationBar Title ================================
    private func setupUI() {
        self.imgProfile.layer.cornerRadius = 40
        self.locationDropDownView.isHidden = true
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Edit profile"
        self.navigationView.btnNotification.isHidden = true
        self.navigationView.btnSearch.isHidden =  true
        self.navigationView.btnProfile.isHidden = true
    }
    
    // MARK: ================================  Private TextField Validation Methods ================================
    private func editUserProfileTextFieldValidation() {
        guard userEditProfileVM.userEditProfileValidation(userName: txtName.text ?? "", userLocation: txtLocation.text ?? "", userPhoneNumber: txtMobileNo.text ?? "", userEmail: txtEmail.text ?? "") else {
            return
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: ================================ IBAction Methods ================================
    @IBAction func btnChangeAction(_ sender: UIButton) {
        imagePicker.photoGalleryAsscessRequest()
    }
    
    @IBAction func btnLocationDropDownAction(_ sender: UIButton) {
        locationDropDownViewHeight.constant = 300
        locationDropDownView.tableData = arrData
        locationDropDownView.dropDownTable.reloadData()
        locationDropDownView.isHidden = false
        
        self.locationDropDownView.closerForbackVC = { sttr in
            self.txtLocation.text = self.locationDropDownView.selectedItemText
            self.locationDropDownView.isHidden = true
            
        }
    }
    
    @IBAction func btnMobileOTPAction(_ sender: UIButton) {
        self.emailVerifyPopUp = EmailVerificationPopUp(frame: self.view.frame)
        
        emailVerifyPopUp?.callbackForResendOtp = {
            
        }
        
        emailVerifyPopUp?.emailVerifyPopUp.isHidden = false
        emailVerifyPopUp?.accountResgistrationPopup.isHidden = true
        emailVerifyPopUp?.isfrom = "1"
        self.view.addSubview(emailVerifyPopUp ?? UIView())
    }
    
    @IBAction func btnEmailOTP(_ sender: UIButton) {
        self.emailVerifyPopUp = EmailVerificationPopUp(frame: self.view.frame)
        
        emailVerifyPopUp?.callbackForResendOtp = {
            
        }
        
        emailVerifyPopUp?.emailVerifyPopUp.isHidden = false
        emailVerifyPopUp?.accountResgistrationPopup.isHidden = true
        emailVerifyPopUp?.isfrom = "2"
        self.view.addSubview(emailVerifyPopUp ?? UIView())
    }
    
    @IBAction func btnSaveAction(_ sender: UIButton) {
        editUserProfileTextFieldValidation()
    }
    
    @IBAction func btnCancelAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: ================================  NavigationBar Delegate Methods ================================
extension UserEditProfileVC: NavigationBarViewDelegate {
    func navigationBackAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func navigationNotificationAction() {
        let vc = UIStoryboard(name: "Notification", bundle: nil).instantiateViewController(withIdentifier: "NotificationVC")as!NotificationVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigationSearchAction() {
        let vc = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "SearchVC")as! SearchVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func naviagtionProfileAction() {
        let vc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC")as! ProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: ================================ ImagePickerDelegate Methods ================================
extension UserEditProfileVC: ImagePickerDelegate {
    func cancelButtonDidClick(on imageView: ImagePicker) {
        imagePicker.dismiss()
    }
    
    func imagePicker(_ imagePicker: ImagePicker, didSelect image: UIImage) {
        imgProfile.image = image
        imagePicker.dismiss()
    }
    
    func imagePicker(_ imagePicker: ImagePicker, grantedAccess: Bool, to sourceType: UIImagePickerController.SourceType) {
        guard grantedAccess else { return }
        imagePicker.present(parent: self, sourceType: sourceType)
    }
}

// MARK: ================================  UITextField Delegate Method ================================
extension UserEditProfileVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let tfTextCount = textField.text?.count ?? 0
        let totalTextCount = string.isEmpty ? tfTextCount : tfTextCount + 1
        return totalTextCount <= 10
    }
}
