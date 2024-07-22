//
//  CreateAccountController.swift
//  Vidhik
//
//  Created by NumeroEins on 15/01/24.
//

import UIKit
import DropDown

class CreateAccountController: UIViewController, UINavigationControllerDelegate {
    //MARK: =============================== IBOutlets Properties ===============================
    @IBOutlet weak var lblCreateAnAccount: UILabel!
    @IBOutlet weak var imgProfilePhoto: UIImageView!
    @IBOutlet weak var btnAddPhoto: UIButton!
    @IBOutlet weak var txtOrganizationName: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtFatherName: UITextField!
    @IBOutlet weak var txtCompentency: UITextView!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var btnDisplayAddress: UIButton!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var btnSelectState: UIButton!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var btnSelectCity: UIButton!
    @IBOutlet weak var txtPhoneNo: UITextField!
    @IBOutlet weak var btnDisplayPhoneNo: UIButton!
    @IBOutlet weak var btnIsWhatsAppNo: UIButton!
    @IBOutlet weak var txtSecondPhoneNo: UITextField!
    @IBOutlet weak var btnDisplaySecondPhoneNo: UIButton!
    @IBOutlet weak var btnIsWhatsAppSecondNo: UIButton!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var btnVerify: UIButton!
    @IBOutlet weak var btnDisplayEmail: UIButton!
    @IBOutlet weak var txtStateBar: UITextField!
    @IBOutlet weak var txtNamePracticingCourt: UITextField!
    @IBOutlet weak var txtpracticeYear: UITextField!
    @IBOutlet weak var txtbarLicense: UITextField!
    @IBOutlet weak var fieldPracticingView: UIView!
    @IBOutlet weak var txtfieldPracticing: UITextField!
    @IBOutlet weak var btnfieldPracticing: UIButton!
    @IBOutlet weak var selectedFieldView: UIView!
    @IBOutlet weak var fieldCollectionView: UICollectionView!
    @IBOutlet weak var securityView1: CustomView!
    @IBOutlet weak var txtSecurityQuestion1: UITextField!
    @IBOutlet weak var btnSelectQuestion1: UIButton!
    @IBOutlet weak var answer1View: CustomView!
    @IBOutlet weak var txtSecurityAnswer1: UITextField!
    @IBOutlet weak var securityView2: CustomView!
    @IBOutlet weak var txtSecurityQuestion2: UITextField!
    @IBOutlet weak var btnSelectQuestion2: UIButton!
    @IBOutlet weak var answer2View: CustomView!
    @IBOutlet weak var txtSecurityAnswer2: UITextField!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var stateDropDownView: CustomDropDownView!
    @IBOutlet weak var stateDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var cityDropDownView: CustomDropDownView!
    @IBOutlet weak var cityDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var que1DropDownView: CustomDropDownView!
    @IBOutlet weak var que1DropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var que2DropDownView: CustomDropDownView!
    @IBOutlet weak var que2DropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var organizationNameView: CustomView!
    @IBOutlet weak var fatherNameView: CustomView!
    @IBOutlet weak var userBusinessAddressView: CustomView!
    @IBOutlet weak var displayOnPhoneNumberView: UIView!
    @IBOutlet weak var displayOnProfileSecondaryView: UIView!
    @IBOutlet weak var practicingFieldDropDownView: DropDownWithCheckBox!
    @IBOutlet weak var practicingFieldDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var diplayAdvocateProfileView: UIView!
    @IBOutlet weak var nameOfStateBarView: CustomView!
    @IBOutlet weak var nameOfPractingCourtView: CustomView!
    @IBOutlet weak var yearOfPracticeView: CustomView!
    @IBOutlet weak var practicingFieldView: CustomView!
    @IBOutlet weak var displayOnProfileAdvocateStack: UIStackView!
    @IBOutlet weak var barLicenceView: CustomView!
    @IBOutlet weak var enterPasswordShowHideButton: UIButton!
    @IBOutlet weak var bussinesAddressTextField: UITextField!
    @IBOutlet weak var enterConfirmPasswordShowHideButton: UIButton!
    @IBOutlet weak var enterPasswordTextField: UITextField!
    @IBOutlet weak var enterConfirmPasswordTextField: UITextField!
    @IBOutlet weak var describeWordView: UIView!
    @IBOutlet weak var comptencyView: CustomView!
    @IBOutlet weak var barAddressView: CustomView!
    @IBOutlet weak var judgeCurrentStateView: CustomView!
    @IBOutlet weak var txtCurrentState: UITextField!
    @IBOutlet weak var judgeCurrentStateDropDownView: CustomDropDownView!
    @IBOutlet weak var judgeCurrentStateDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var judgeCurrentDistrictView: CustomView!
    @IBOutlet weak var txtCurrentDistrict: UITextField!
    @IBOutlet weak var judgeCurrentDistrictDropDownView: CustomDropDownView!
    @IBOutlet weak var judgeCurrentDistrictDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var courtTypeView: CustomView!
    @IBOutlet weak var txtCourtType: UITextField!
    @IBOutlet weak var courtNameView: CustomView!
    @IBOutlet weak var txtCourtName: UITextField!
    @IBOutlet weak var registrationNoView: CustomView!
    @IBOutlet weak var txtRegistrationNo: UITextField!
    // MARK: ===============================  IBOutlets Properties on User Selection Button ===============================
    @IBOutlet weak var lawyerButton: UIButton!
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var sellerButton: UIButton!
    @IBOutlet weak var judgeButton: UIButton!
    
    let checkUserType = ApplicationPreference.getcheckUserType()
    let createAccountVM = CreateAccountVM()
    var iconClick = true
    var emailVerifyPopUp: EmailVerificationPopUp?
    var selectedPracticeField: [String]?
    var completeProfile: Bool?
    let dropDown = DropDown()
    var placeHolderColor = UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
    var practicingFieldArray: [String]?
    
    // MARK: =============================== View Controller Life Cycle Methods ===============================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.showOtherFieldToComplete(show: completeProfile ?? true)
        ApplicationPreference.savecheckUserType(saveStatus: "Lawyer")
        txtPhoneNo.text = createAccountVM.signupPhoneNumber
        updateUI(show: false)
        self.hideJudgeFeilds()
        txtPhoneNo.isUserInteractionEnabled = false
        tempMangeUserType()
        
    }
    
    // FIXME: ======= Manage Continue button ========
    private func tempMangeUserType() {
        if checkUserType == "User" {
            self.btnContinue.backgroundColor = .systemGray5
            self.btnContinue.isUserInteractionEnabled = false
        } else {
            self.btnContinue.backgroundColor = .solidBlue
            self.btnContinue.isUserInteractionEnabled = true
            txtCompentency.text = "Enter your core comptency"
            txtCompentency.textColor = placeHolderColor
        }
    }
  
    // MARK: ===============================  Check User Type Created Method ===============================
   private func updateUI(show: Bool) {
        comptencyView.isHidden = show
        describeWordView.isHidden = show
        organizationNameView.isHidden = show
        fatherNameView.isHidden = show
        diplayAdvocateProfileView.isHidden = show
        nameOfStateBarView.isHidden = show
        nameOfPractingCourtView.isHidden = show
        yearOfPracticeView.isHidden = show
        practicingFieldView.isHidden = show
        barLicenceView.isHidden = show
        displayOnProfileAdvocateStack.isHidden = show
        displayOnPhoneNumberView.isHidden = show
        displayOnProfileSecondaryView.isHidden = show
        userBusinessAddressView.isHidden = !show
    }
    
    private func hideJudgeFeilds() {
        judgeCurrentDistrictDropDownView.isHidden = true
        judgeCurrentStateDropDownView.isHidden = true
        userBusinessAddressView.isHidden = true
        judgeCurrentStateView.isHidden = true
        judgeCurrentDistrictView.isHidden = true
        courtNameView.isHidden = true
        courtTypeView.isHidden = true
        registrationNoView.isHidden = true
    }

    
    private func setUI() {
        self.lblCreateAnAccount.text = objAppShareData.isFromDoneSignUp == true ? "Complete your profile" :  "Create an account"
        stateDropDownView.isHidden = true
        cityDropDownView.isHidden = true
        que1DropDownView.isHidden = true
        que2DropDownView.isHidden = true
        self.imgProfilePhoto.layer.cornerRadius = 40
        self.practicingFieldDropDownView.isHidden = true
        self.fieldCollectionView.dataSource = self
        self.btnContinue.layer.cornerRadius = 12
        self.fieldPracticingView.isHidden = false
        self.selectedFieldView.isHidden = true
        self.securityView1.isHidden = true
        self.answer1View.isHidden = true
        self.securityView2.isHidden = true
        self.answer2View.isHidden = true
    }
    
    private func showOtherFieldToComplete(show: Bool) {
        self.fieldPracticingView.isHidden = !show
        self.selectedFieldView.isHidden = show
        self.securityView1.isHidden = show
        self.answer1View.isHidden = show
        self.securityView2.isHidden = show
        self.answer2View.isHidden = show
    }
    
    private func setButtonImage(button: UIButton) {
        button.setImage(UIImage(named: "FilterCheckBox"), for: .selected)
        button.setImage(UIImage(named: "checkBox"), for: .normal)
        button.isSelected = !button.isSelected
    }
    
    private func hideShowPassword(password: UITextField, showAndHide: UIButton) {
        password.isSecureTextEntry = iconClick == true ? false : true
        showAndHide.setImage(iconClick == true ? UIImage(named: "showPasswordIcon") : UIImage(named: "hidePasswordIcon"), for: .normal)
        iconClick = !iconClick
    }

    // MARK: ================================== Private Validation Method ============================================
    private func validationMethod() {
        switch createAccountVM.userType {
        case.lawyer:
           
            guard createAccountVM.commonValidationUserAndLawyer(fullName: txtName.text ?? "", address: txtAddress.text ?? "", state: txtState.text ?? "", city: txtCity.text ?? "", phoneNumber: txtPhoneNo.text ?? "" , email: txtemail.text ?? "", password: enterPasswordTextField.text ?? "", confirmPassword: enterConfirmPasswordTextField.text ?? "") else { return }
           
            guard createAccountVM.isTextFieldsValidLawyer(fatherName: txtFatherName.text ?? "", competency: txtCompentency.text ?? "", nameOfStateBar: txtStateBar.text ?? "", nameOfPracticingCourt: txtNamePracticingCourt.text ?? "", yearOfPractice: txtpracticeYear.text ?? "", barLicenseNo: txtbarLicense.text ?? "", practicingField: txtfieldPracticing.text ?? "") else { return }
              
            self.emailVerifyPopupShow()
        
        case .user:
            guard  createAccountVM.commonValidationUserAndLawyer(fullName: txtName.text ?? "", address: txtAddress.text ?? "", state: txtState.text ?? "", city: txtCity.text ?? "", phoneNumber: txtPhoneNo.text ?? "" , email: txtemail.text ?? "", password: enterPasswordTextField.text ?? "", confirmPassword: enterConfirmPasswordTextField.text ?? "") else { return }
                createAccountApi()
            
        case .judge:
           
            guard createAccountVM.commonValidationUserAndLawyer(fullName: txtName.text ?? "", address: txtAddress.text ?? "", state: txtState.text ?? "", city: txtCity.text ?? "", phoneNumber: txtPhoneNo.text ?? "" , email: txtemail.text ?? "", password: enterPasswordTextField.text ?? "", confirmPassword: enterConfirmPasswordTextField.text ?? "") else { return }
            
            guard createAccountVM.validationForJudge(currentState: txtCurrentState.text ?? "", currentDistrict: txtCurrentDistrict.text ?? "", courtType: txtCourtType.text ?? "", courtName: txtCourtName.text ?? "", registrationNo: txtRegistrationNo.text ?? "") else { return }
            ObjAppdelegate.setRootViewController()
        default:
            break
        }
        
    }
    
    // MARK: ==================================== Private Method didSelectUserType =========================================
    private func didSelectUserType(userSelectionType: UserSelectionType) {
        // Reset state
        [userButton, judgeButton, lawyerButton, sellerButton].forEach { button in
            button?.setImage(UIImage(named:  "UncheckCircle"), for: .normal)
        }
   
        switch userSelectionType {
            
        case .lawyer:
            lawyerButton.setImage(UIImage(named:  "checkCircle"), for: .normal)
            createAccountVM.userType = .lawyer
            ApplicationPreference.savecheckUserType(saveStatus: "Lawyer")
            
        case .judge:
            judgeButton.setImage(UIImage(named:  "checkCircle"), for: .normal)
            createAccountVM.userType = .judge
             ApplicationPreference.savecheckUserType(saveStatus: "Judge")
             
        case .user:
            userButton.setImage(UIImage(named:  "checkCircle"), for: .normal)
            createAccountVM.userType = .user
            ApplicationPreference.savecheckUserType(saveStatus: "User")
            
        case .seller:
            sellerButton.setImage(UIImage(named:  "checkCircle"), for: .normal)
            createAccountVM.userType = .seller
            ApplicationPreference.savecheckUserType(saveStatus: "Seller")
            
        }
    }
    

    private func emailVerifyPopupShow() {
        
        self.emailVerifyPopUp = EmailVerificationPopUp(frame: self.view.frame)
        emailVerifyPopUp?.callbackForOK = {
            objAppShareData.isFromDoneSignUp = true
            self.createLawyerAccount()
           
        }
        emailVerifyPopUp?.emailVerifyPopUp.isHidden = true
        emailVerifyPopUp?.accountResgistrationPopup.isHidden = false
        self.view.addSubview(emailVerifyPopUp ?? UIView())
       
        if completeProfile == false {
            ObjAppdelegate.setRootViewController()
        }
    }
    
    // MARK: ================================== Private Send Otp Email Validation Method ====================================
    private func emailVerifyValidation(email: String) -> Bool {
        guard !email.isEmpty else { return AlertView.show(title: alertTitle, message: "Please enter email") }
        guard email.isValid(type: .email) else { return AlertView.show(title: alertTitle, message: "Please enter vaild email") }
        return true
    }
    
    // MARK: ========================================== Private Send Otp Email Api Call =====================================
    private func sendOtpOnEmail() {
        
        guard emailVerifyValidation(email: txtemail.text ?? "") else  { return }
       
        Loader.show()
        
        createAccountVM.sendOtoOnEmailMutation(email: txtemail.text ?? "") { [weak self] response, message in
            
            Loader.hide()
           
            switch response {
            
            case .success:
                
                AlertView.show(title: "", message: message, okTitle: "Ok", cancelTitle: "") { index in
                    if index == 1 {
                        self?.emailVerifyPopShowMethod()
                    }
                }
            case .failure:
                AlertView.show(title: "", message: message)
            default:
                break
            }
        }
    }
    
    // MARK: ===================================== Private Method Create Lawyer Account ==================================
    private func createLawyerAccount() {
        
        Loader.show()
        
        createAccountVM.lawyerAccountCreation(lawyerName: txtName.text ?? "",
                                              fatherName: txtFatherName.text ?? "", orgainization: txtOrganizationName.text ?? "",
                                              primaryContact: txtPhoneNo.text ?? "",
                                              isPrimaryContactWhatsapp: createAccountVM.isPrimaryContactWhatsapp ?? Bool(),isPrimaryMobileDisplay: createAccountVM.isprimaryMobiledisplay ?? Bool(),
                                              secondaryContact: txtSecondPhoneNo.text ?? "",
                                              isSecondaryContactWhatsapp: createAccountVM.isSecondaryContactWhatsapp ?? Bool(),isSecondaryMobileDisplay: createAccountVM.issecondaryMobiledisplay ?? Bool(),
                                              city: txtCity.text ?? "", state: txtState.text ?? "",
                                              email: txtemail.text ?? "", password: enterPasswordTextField.text ?? "",
                                              confirmPassword: enterConfirmPasswordTextField.text ?? "",
                                              barLicenseNumber: txtbarLicense.text ?? "",
                                              stateBar: txtStateBar.text ?? "", practiceYear: txtpracticeYear.text ?? "",
                                              coreCompetency: txtCompentency.text ?? "",
                                              practicingCourt: txtNamePracticingCourt.text ?? "", practicingField: createAccountVM.arrPracticeField,
                                              isEmailDisplay:createAccountVM.isemaildisplay ?? Bool(),
                                              barAddress: txtAddress.text ?? "", isBarAddressDisplay: createAccountVM.isbaraddressdisplay ?? Bool()) { [weak self] response, message in
          
          Loader.hide()
            switch response {
            case .success:
                AlertView.show(title: "", message: message, okTitle: "Ok", cancelTitle: "") { [weak self] index in
                    if index == 1 {
                        self?.emailVerifyPopUp?.emailVerifyPopUp.isHidden = true
                        //self?.emailVerifyPopUp?.emailVerifyPopUp.removeFromSuperview()
                        self?.navigationController?.popToRootViewController(animated: true)
                    }
                }
            default:
                AlertView.show(title: "", message: message)
            }
        }
    }

    // MARK: ================================= Private Method EmailVerify Api Calling =======================================
    private func emailVerifyPopShowMethod() {

        self.emailVerifyPopUp = EmailVerificationPopUp(frame: self.view.frame)
        self.emailVerifyPopUp?.email.text = txtemail.text ?? ""
        
        emailVerifyPopUp?.callbackForResendOtp = {
            
            Loader.show()
           
            self.createAccountVM.reSendOtpOnEmail(email: self.txtemail.text ?? "") { response, message in
                Loader.hide()
               
                switch response {
                case .success:
                    
                    AlertView.show(title: "", message: message, okTitle: "Ok", cancelTitle: "") { index in
                        if index == 1 {
                            print("Resend OTP")
                        }
                    }
                default:
                    AlertView.show(title: "", message: message)
                }
            }
        }
        
        
        emailVerifyPopUp?.callBackForEmailVerification = {
            self.btnVerify.setTitleColor(.solidBlue, for: .normal)
            self.btnVerify.setTitle("(Verified)", for: .normal)
            self.btnVerify.isUserInteractionEnabled = false
            self.btnContinue.backgroundColor = .solidBlue
            self.btnContinue.isUserInteractionEnabled = true
        }
        emailVerifyPopUp?.emailVerifyPopUp.isHidden = false
        emailVerifyPopUp?.accountResgistrationPopup.isHidden = true
        self.view.addSubview(emailVerifyPopUp ?? UIView())
    }
    
    // MARK: =============================================== Private Method Account Creation Api Calling ===============================================
    private func createAccountApi() {
        
        Loader.show()
        
        createAccountVM.userAccountCreation(name: txtName.text ?? "", phoneNumber: txtPhoneNo.text ?? "", isPrimaryContactWhatsapp: createAccountVM.isPrimaryContactWhatsapp ?? Bool(), secondaryContact: txtSecondPhoneNo.text ?? "", isSecondaryContactWhatsapp: createAccountVM.isSecondaryContactWhatsapp ?? Bool(), address: txtAddress.text ?? "", city: txtCity.text ?? "", state: txtState.text ?? "", email: txtemail.text ?? "", password: enterPasswordTextField.text ?? "", confirmPassword: enterConfirmPasswordTextField.text ?? "") {[weak self] response, message in
            
            Loader.hide()
            
            switch response {
                
            case .success:
                AlertView.show(title: "", message: message, okTitle: "Ok", cancelTitle: "") { index in
                    
                    if index == 1 {
                        self?.popToSpecificController(LoginViewController.self)
                        print("Account Creation")
                    }
                }
                
            default:
                AlertView.show(title: "", message: message)
            }
        }
        
    }
    
    func showDropDown(dropDownHeight: NSLayoutConstraint, dropDownView: CustomDropDownView, text: UITextField, data: [String]) {
        dropDownHeight.constant = 300
        dropDownView.tableData = data
        dropDownView.dropDownTable.reloadData()
        dropDownView.isHidden = false
        
        dropDownView.closerForbackVC = { sttr in
           text.text = dropDownView.selectedItemText
            dropDownView.isHidden = true
            
        }
    }
    
    // MARK: =============================================== MultiPart API Calling ===============================================
    func createAccountMultiPartApi() {
        let image = imgProfilePhoto.image ?? #imageLiteral(resourceName: "profilePhoto")
        //profileImageView.image ?? UIImage()
        Loader.show()
        createAccountVM.accountCretaionAPICalling(name: txtName.text ?? "", phoneNumber: txtPhoneNo.text ?? "", isPrimaryContactWhatsapp: createAccountVM.isPrimaryContactWhatsapp ?? Bool(), secondaryContact: txtSecondPhoneNo.text ?? "", isSecondaryContactWhatsapp: createAccountVM.isSecondaryContactWhatsapp ?? Bool(), address: txtAddress.text ?? "", city: txtCity.text ?? "", state: txtState.text ?? "", email: txtemail.text ?? "", password: enterPasswordTextField.text ?? "", confirmPassword: enterConfirmPasswordTextField.text ?? "", image: image ) { response,
            message in
            Loader.hide()
            switch response {
            case .success:
                print("Success")
                
            default:
                print("Failure")
                break
            }
        }
    }
    
    
    //MARK: =============================== IBActions Methods ===============================
    @IBAction func btnAddPhotoAction(_ sender: UIButton) {
        self.showImagePicker()
    }
    
    @IBAction func btnDisplayAddressAction(_ sender: UIButton) {
        createAccountVM.isbaraddressdisplay = sender.isSelected ==  true ? true : false
        self.setButtonImage(button: btnDisplayAddress)
    }
    
    @IBAction func btnSelectStateAction(_ sender: UIButton) {
        self.showDropDown(dropDownHeight: stateDropDownViewHeight,
                          dropDownView: stateDropDownView, text: txtState, data: createAccountVM.arrData)
    }
    
    @IBAction func btnSelectCityAction(_ sender: UIButton) {
        self.showDropDown(dropDownHeight: cityDropDownViewHeight,
                          dropDownView: cityDropDownView, text: txtCity, data: createAccountVM.arrData)
    }
    
    @IBAction func btnSelectCurrentStateAction(_ sender: UIButton) {
        self.showDropDown(dropDownHeight: judgeCurrentStateDropDownViewHeight,
                          dropDownView: judgeCurrentStateDropDownView, text: txtCurrentState, data: createAccountVM.arrData)
    }
    
    @IBAction func btnSelectCurrentDistrictAction(_ sender: UIButton) {
        self.showDropDown(dropDownHeight: judgeCurrentDistrictDropDownViewHeight,
                          dropDownView: judgeCurrentDistrictDropDownView, text: txtCurrentDistrict, data: createAccountVM.arrData)
    }
    
    @IBAction func btnDisplayPhoneNoAction(_ sender: UIButton) {
        createAccountVM.isprimaryMobiledisplay = sender.isSelected ==  true ? true : false
        self.setButtonImage(button: btnDisplayPhoneNo)
    }
    
    @IBAction func btnIsWhatsAppNoAction(_ sender: UIButton) {
        createAccountVM.isPrimaryContactWhatsapp = !sender.isSelected ==  true ? true : false
        self.setButtonImage(button: btnIsWhatsAppNo)
    }
    
    @IBAction func btnDisplaySecondPhoneNoAction(_ sender: UIButton) {
        createAccountVM.issecondaryMobiledisplay = sender.isSelected ==  true ? true : false
        self.setButtonImage(button: btnDisplaySecondPhoneNo)
    }
    
    @IBAction func btnIsWhatsAppSecondNoAction(_ sender: UIButton) {
        createAccountVM.isSecondaryContactWhatsapp = sender.isSelected ==  true ? true : false
        self.setButtonImage(button: btnIsWhatsAppSecondNo)
    }
    
 
    @IBAction func btnVerifyAction(_ sennder: UIButton) {
        sendOtpOnEmail()
    }
    
    @IBAction func btnDisplayEmailAction(_ sender: UIButton) {
        createAccountVM.isemaildisplay = sender.isSelected ==  true ? true : false
        self.setButtonImage(button: btnDisplayEmail)
    }
    
    @IBAction func btnSelectFieldPracticingAction(_ sender: UIButton) {
        practicingFieldDropDownViewHeight.constant = 300
        practicingFieldDropDownView.tableData = createAccountVM.arrPracticeField
        practicingFieldDropDownView.dropDownTable.reloadData()
        practicingFieldDropDownView.isHidden = false
        practicingFieldDropDownView.txtSearch.placeholder = "Search Practicing Field"
        practicingFieldDropDownView.callBackForDone = {
            self.practicingFieldArray = self.practicingFieldDropDownView.selectedFeild
            self.fieldCollectionView.reloadData()
            self.selectedFieldView.isHidden = false
            self.fieldPracticingView.isHidden = true
            self.practicingFieldDropDownView.isHidden = true
        }
        self.practicingFieldDropDownView.closerForbackVC = { sttr in
         }
    }
    
    @IBAction func btnContinueAction(_ sender: UIButton) {
       // createAccountMultiPartApi()
        validationMethod()
    }
    
    @IBAction func btnSecurityQue1Action(_ sender: UIButton) {
        self.showDropDown(dropDownHeight: que1DropDownViewHeight,
                          dropDownView: que1DropDownView, text: txtSecurityQuestion1, data: createAccountVM.arrQueData)
    }
    
    @IBAction func btnSecurityQue2Action(_ sender: UIButton) {
        self.showDropDown(dropDownHeight: que2DropDownViewHeight,
                          dropDownView: que2DropDownView, text: txtSecurityQuestion2, data: createAccountVM.arrQueData)
    }
    
    // Password And Confirm Password Button Action Methods
    @IBAction func enterPasswordShowHideButtonAction(_ sender: UIButton) {
        self.hideShowPassword(password: enterPasswordTextField, showAndHide: enterPasswordShowHideButton)
    }
    
    @IBAction func confirmPasswordShowHideButtonAction(_ sender: UIButton) {
        self.hideShowPassword(password: enterConfirmPasswordTextField, showAndHide: enterConfirmPasswordShowHideButton)
    }
    
    // MARK:  =============================================== User Selection Button IBAction Methods ===============================================
    @IBAction func lawyerButtonAction(_ sender: UIButton) {
        didSelectUserType(userSelectionType: .lawyer)
        self.updateUI(show: false)
        txtAddress.placeholder = "Enter your bar address"
        self.hideJudgeFeilds()
    }
    
    @IBAction func judgeButtonAction(_ sender: UIButton) {
        didSelectUserType(userSelectionType: .judge)
        self.updateUI(show: true)
        txtAddress.placeholder = "Enter your permanent address"
        judgeCurrentDistrictDropDownView.isHidden = true
        judgeCurrentStateDropDownView.isHidden = true
        userBusinessAddressView.isHidden = true
        judgeCurrentStateView.isHidden = false
        judgeCurrentDistrictView.isHidden = false
        courtNameView.isHidden = false
        courtTypeView.isHidden = false
        registrationNoView.isHidden = false
    }
    
    @IBAction func userButtonAction(_ sender: UIButton) {
        didSelectUserType(userSelectionType: .user)
        self.updateUI(show: true)
        txtAddress.placeholder = "Enter your permanent address"
        self.hideJudgeFeilds()
     }
    
    @IBAction func sellerButtonAction(_ sender: UIButton) {
        didSelectUserType(userSelectionType: .seller)
    }
}

//MARK:  ======================================== UICollection DataSource Methods ============================================
extension CreateAccountController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        practicingFieldArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.fieldCollectionView.dequeueReusableCell(withReuseIdentifier: "FieldCollectionViewCell", for: indexPath) as! FieldCollectionViewCell
        let data = practicingFieldArray?[indexPath.row]
        cell.lblFieldName.text = data
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = self.fieldCollectionView.dequeueReusableCell(withReuseIdentifier: "FieldCollectionViewCell", for: indexPath) as! FieldCollectionViewCell
        return CGSize(width: cell.lblFieldName.frame.width, height: 40)
    }
}


//MARK:  =============================================== UIIMage PickerController Delegate Methods ===============================================
extension CreateAccountController: UIImagePickerControllerDelegate {
    func showImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary // You can also use .camera if you want to capture images using the device's camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            let mediaType = info[.mediaType] as? String
            let imageName = (info[.imageURL] as? URL)?.lastPathComponent
            print("Media Type: \(mediaType ?? "Unknown")")
            print("Image Name: \(imageName ?? "Unknown")")
            imgProfilePhoto.image = pickedImage
            imgProfilePhoto.layer.cornerRadius = 40
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: =============================================== UITextView Delegate Method ===============================================
extension CreateAccountController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let range = text.rangeOfCharacter(from: .whitespaces)
        let textViewTextCount = textView.text.count
        if textViewTextCount == 0 && (range != nil) {
            return false
        } else {
            let totalTextCount = text.isEmpty ? textViewTextCount : textViewTextCount + 1
            return totalTextCount <= 200 // 200 Limit Value
        }
    }
    
    // MARK: =========== Private Method TextView PlaceHoder ===========
     func textViewDidBeginEditing(_ textView: UITextView) {
        if txtCompentency.textColor == placeHolderColor {
            txtCompentency.text = nil
            txtCompentency.textColor = UIColor.black
        }
    }
}

// MARK: =============================================== UITextField Delegate Methods ===============================================
extension CreateAccountController: UITextFieldDelegate {
    private func textFieldRangAndCount(_ string: String, _ textField: UITextField, _ textCount: Int) -> Bool {
        let range = string.rangeOfCharacter(from: .whitespaces)
        let tfTextCount = textField.text?.count ?? 0
        if tfTextCount == 0 && (range != nil) {
            return false
        } else {
            let totalTextCount = string.isEmpty ? tfTextCount : tfTextCount + 1
            return totalTextCount <= textCount
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if textField == txtName {
            return textFieldRangAndCount(string, textField, 50)
        } else if textField == txtFatherName {
            return textFieldRangAndCount(string, textField, 50)
        } else if textField == txtAddress {
            return textFieldRangAndCount(string, textField, 60)
        } else if textField == txtCourtName {
            return textFieldRangAndCount(string, textField, 60)
        } else if textField == txtCourtType {
            return textFieldRangAndCount(string, textField, 20)
        } else if textField == txtSecondPhoneNo {
            return textFieldRangAndCount(string, textField, 10)
        }
        return true
        
    }
}
