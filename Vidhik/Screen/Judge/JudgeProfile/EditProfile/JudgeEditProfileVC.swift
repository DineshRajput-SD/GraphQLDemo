//
//  JudgeEditProfileVC.swift
//  Vidhik
//
//  Created by NumeroEins on 08/04/24.
//

import UIKit

class JudgeEditProfileVC: UIViewController {
    //MARK: =============================== IBOutlets Properties ===============================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnChange: UIButton!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var btnStateDropDown: UIButton!
    @IBOutlet weak var stateDropDownView: CustomDropDownView!
    @IBOutlet weak var stateDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var txtDistrict: UITextField!
    @IBOutlet weak var btnDistrictDropDown: UIButton!
    @IBOutlet weak var districtDropDownView: CustomDropDownView!
    @IBOutlet weak var districtDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var txtCourtType: UITextField!
    @IBOutlet weak var btnCourtTypeDropDown: UIButton!
    @IBOutlet weak var courtTypeDropDownView: CustomDropDownView!
    @IBOutlet weak var courtTypeDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var txtCourtName: UITextField!
    @IBOutlet weak var btnCourtNameDropDown: UIButton!
    @IBOutlet weak var courtNameDropDownView: CustomDropDownView!
    @IBOutlet weak var courtNameDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var txtMobileNo: UITextField!
    @IBOutlet weak var btnSendMobileOTP: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnSendEmailOTP: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    //MARK: =============================== Instance Properties ===============================
    let judgeEditProfileVM = JudgeEditProfileVM()
    var emailVerifyPopUp: EmailVerificationPopUp?
    var arrData = ["Andhra Pradesh","Arunachal Pradesh","Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur"]
    
    private lazy var imagePicker: ImagePicker = {
        let imagePicker = ImagePicker()
        imagePicker.delegate = self
        return imagePicker
    }()
    
    //MARK: =============================== View Controoler Life Cycle Method ===============================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setUpNaviagtionBar()
    }
    
    //MARK: =============================== Private Methods SetUI NavigationBar Title ===============================
    private func setupUI() {
        self.imgProfile.layer.cornerRadius = 40
        self.stateDropDownView.isHidden = true
        self.districtDropDownView.isHidden = true
        self.courtNameDropDownView.isHidden = true
        self.courtTypeDropDownView.isHidden = true
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Edit profile"
        self.navigationView.btnNotification.isHidden = true
        self.navigationView.btnSearch.isHidden =  true
        self.navigationView.btnProfile.isHidden = true
    }
    
    private func editJugdeProfileTextFieldValidation() {
        guard judgeEditProfileVM.judgeEditProfileValidation(judgeName: txtName.text ?? "" , judgeCurrentState: txtState.text ?? "", judgeCurrentDistrict: txtDistrict.text ?? "", judgeCourtType: txtCourtType.text ?? "", judgeCourtName: txtCourtName.text ?? "", judgePhoneNumber: txtMobileNo.text ?? "", judgeEmail: txtEmail.text ?? "") else {
            return
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    private func showDropDown(dropDownHeight: NSLayoutConstraint, dropDownView: CustomDropDownView, text: UITextField, data: [String]) {
        dropDownHeight.constant = 300
        dropDownView.tableData = data
        dropDownView.dropDownTable.reloadData()
        dropDownView.isHidden = false
        
        dropDownView.closerForbackVC = { sttr in
            text.text = dropDownView.selectedItemText
            dropDownView.isHidden = true
        }
    }
    
    //MARK: =============================== IBAction Methods ===============================
    @IBAction func btnChangeAction(_ sender: UIButton) {
        imagePicker.photoGalleryAsscessRequest()
    }
    
    @IBAction func btnSelectStateDropDownAction(_ sender: UIButton) {
        self.showDropDown(dropDownHeight: stateDropDownViewHeight, dropDownView: stateDropDownView, text: txtState, data: arrData)
    }
    
    @IBAction func btnSelectDistrictDropDownAction(_ sender: UIButton) {
        self.showDropDown(dropDownHeight: districtDropDownViewHeight, dropDownView: districtDropDownView, text: txtDistrict, data: arrData)
    }
    
    @IBAction func btnSelectCourtNameDropDownAction(_ sender: UIButton) {
        self.showDropDown(dropDownHeight: courtNameDropDownViewHeight, dropDownView: courtNameDropDownView, text: txtCourtName, data: arrData)
    }
    
    @IBAction func btnSelectCourtTypeDropDownAction(_ sender: UIButton) {
        self.showDropDown(dropDownHeight: courtTypeDropDownViewHeight, dropDownView: courtTypeDropDownView, text: txtCourtType, data: arrData)
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
        editJugdeProfileTextFieldValidation()
    }
    
    @IBAction func btnCancelAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: ===============================  Extension UINavigationBar Delegate Methods ===============================
extension JudgeEditProfileVC: NavigationBarViewDelegate {
    func navigationBackAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func navigationNotificationAction() { }
    
    func navigationSearchAction() { }
    
    func naviagtionProfileAction() { }
}

// MARK: =============================== ImagePicker Delegate Methods ===============================
extension JudgeEditProfileVC: ImagePickerDelegate {
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

// MARK: =============================== UITextField Delegate Methods ===============================
extension JudgeEditProfileVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let tfTextCount = textField.text?.count ?? 0
        let totalTextCount = string.isEmpty ? tfTextCount : tfTextCount + 1
        return totalTextCount <= 10
    }
}
