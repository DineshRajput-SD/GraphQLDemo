//
//  SubscriptionPlanVC.swift
//  Vidhik
//
//  Created by NumeroEins on 28/03/24.
//

import UIKit

class SubscriptionPlanVC: UIViewController {
    // MARK: ================= IBOutlets Properties =================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var plansCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    
    var planData = [["PlanType": "SILVER PLAN", "PlanLevel": "For Beginners","ActivePlan": true], ["PlanType": "GOLD PLAN", "PlanLevel": "For Mediators", "ActivePlan": false], ["PlanType": "PLATINUM PLAN", "PlanLevel": "For Experts", "ActivePlan": false]]
    
    // MARK: ================= View Controller Life Cycle Methods =================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
        self.plansCollectionView.dataSource = self
        self.plansCollectionView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setCollectionViewLayout()
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Plan"
    }
    
    func setCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = .zero
        layout.minimumLineSpacing = .zero
        layout.sectionInset = .zero
        layout.itemSize = plansCollectionView.frame.size
        plansCollectionView.setCollectionViewLayout(layout, animated: true)
    }
}

// MARK: ================= Extension NavigationBarView Delegate Methods =================
extension SubscriptionPlanVC: NavigationBarViewDelegate {
    
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

//MARK: ================= UICollectionView Delegates and DataSource =================
extension SubscriptionPlanVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = plansCollectionView.dequeueReusableCell(withReuseIdentifier: "SubscriptionPlanCollectionCell", for: indexPath) as! SubscriptionPlanCollectionCell
        let data = planData[indexPath.row]
        cell.imgActivePlan.isHidden = true
        cell.btnChoosePlan.layer.cornerRadius = 12
        cell.lblPlanType.text =  data["PlanType"] as? String
        cell.lblPlanLevel.text = data["PlanLevel"] as? String
        cell.currentActivePlan = data["ActivePlan"] as? Bool
        
        if cell.currentActivePlan == true {
            cell.imgActivePlan.isHidden = false
        }
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        pageController.currentPage = Int(offSet + horizontalCenter) / Int(width)
    }
}
