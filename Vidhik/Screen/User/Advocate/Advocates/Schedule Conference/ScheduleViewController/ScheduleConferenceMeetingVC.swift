//
//  ScheduleConferenceMeetingVC.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 01/03/24.
//

import UIKit

class ScheduleConferenceMeetingVC: UIViewController {
    
    // MARK: ================================ IBOutlets Properties ================================
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: ================================ Instance Properties ================================
    let scheduleConferenceMeetingVM = ScheduleConferenceMeetingVM()
    
    // MARK: ================================ View Controller Life Cycle ================================
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleConferenceMeetingVM.getAvailableSlot()
        collectionHeaderAndFooterNibRegister()
    }
    
    // MARK: ================================ Private Instance Methods HeaderNib register ================================
    private func collectionHeaderAndFooterNibRegister() {
        collectionView.register(UINib(nibName: String(describing: HeaderViewCell.self), bundle: nil),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: String(describing: HeaderViewCell.self))
        
    }
    
    // MARK: ================================ IBaction Methods ================================
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func makePaymentButton(_ sender: UIButton) {
        let userPaymentQRCodeVC = storyboard?.instantiateViewController(identifier: "UserPaymentQRCodeVC") as! UserPaymentQRCodeVC
        userPaymentQRCodeVC.isFirstTimePayment = true
        self.navigationController?.pushViewController(userPaymentQRCodeVC, animated: true)
        print("Open Payment Popup View")
    }
}

// MARK: ================================ UICollection View DataSource Methods ================================
extension ScheduleConferenceMeetingVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return scheduleConferenceMeetingVM.availableTime?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let numerSlot = scheduleConferenceMeetingVM.availableTime?[section].availableTimeSlot.count else { return 0 }
        return numerSlot
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        let slot = scheduleConferenceMeetingVM.availableTime?[indexPath.section].availableTimeSlot[indexPath.row].time
        cell.timeSlotLabel.text = slot
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                   withReuseIdentifier: String(describing: HeaderViewCell.self),
                                                                                   for: indexPath) as? HeaderViewCell else { return HeaderViewCell() }
            
            let headerTitle = scheduleConferenceMeetingVM.availableTime?[indexPath.section]//.availableTimeSlot[indexPath.row]
            headerView.dateLabel.text = headerTitle?.availableDate
            return headerView
        default:
            break
        }
        return UICollectionViewCell()
    }
    
}

// MARK: ================================ UICollection View Delegate Methods ================================
extension ScheduleConferenceMeetingVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        let slot = scheduleConferenceMeetingVM.availableTime?[indexPath.section].availableTimeSlot[indexPath.row]
        print(cell)
        print(slot as Any)
    }
}
