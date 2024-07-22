//
//  AddAvailabilityVC.swift
//  Vidhik
//
//  Created by NumeroEins on 13/02/24.
//

import UIKit

class AddAvailabilityVC: UIViewController {
    
    //MARK:  ===========================  IBOutlet Properties ===========================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var btnSelectDate: UIButton!
    @IBOutlet weak var txtSelectedDate: UITextField!
    @IBOutlet weak var btnSelectSlot: UIButton!
    @IBOutlet weak var selectSlotView: UIView!
    @IBOutlet weak var selectedSlotView: UIView!
    @IBOutlet weak var selectedSlotCollectionView: UICollectionView!
    @IBOutlet weak var slotDropDownView: CustomDropDownView!
    @IBOutlet weak var slotDropDownViewHeight: NSLayoutConstraint!
    
    var arrData = ["Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name"]
    var selectedSlot: String?
    
    // MARK:  ===========================  View Controller Life Cycle Method ===========================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
        self.setUpUI()
        self.setUpCollectionView()
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Calendar"
    }
    
    private func setUpUI() {
        self.selectSlotView.isHidden = false
        self.selectedSlotView.isHidden = true
        self.slotDropDownView.isHidden = true
    }
    
    private func setUpCollectionView() {
        self.selectedSlotCollectionView.delegate = self
        self.selectedSlotCollectionView.dataSource = self
    }
    
    //MARK:  ===========================  IBAction Methods ===========================
    @IBAction func btnSelectDateAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnSelectSlotAction(_ sender: UIButton) {
        slotDropDownViewHeight.constant = 300
        slotDropDownView.tableData = arrData
        slotDropDownView.dropDownTable.reloadData()
        slotDropDownView.isHidden = false
        
        self.slotDropDownView.closerForbackVC = { sttr in
            // self.txtSelectedDate.text = self.slotDropDownView.selectedItemText
            self.selectedSlot = self.slotDropDownView.selectedItemText
            self.slotDropDownView.dropDownTable.reloadData()
            self.slotDropDownView.isHidden = true
            self.selectSlotView.isHidden = true
            self.selectedSlotView.isHidden = false
        }
    }
    
    @IBAction func btnSaveAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnCancelAction(_ sender: UIButton) {
        dismiss(animated: false)
    }
}

//MARK: ===========================  Extension NavigationBarView Delegate Methods ===========================
extension AddAvailabilityVC: NavigationBarViewDelegate {
    func navigationBackAction() {
        tabBarController?.tabBar.isHidden = true
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

//MARK: ===========================  UICollectionViewDelegate, UICollectionViewDataSource  ===========================
extension AddAvailabilityVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.selectedSlotCollectionView.dequeueReusableCell(withReuseIdentifier: "FieldCollectionViewCell", for: indexPath) as! FieldCollectionViewCell
        cell.lblFieldName.text = selectedSlot
        return cell
    }
    
}
