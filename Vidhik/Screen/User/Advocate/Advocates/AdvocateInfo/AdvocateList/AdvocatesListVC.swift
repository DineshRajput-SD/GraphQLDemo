//
//  AdvocatesListVC.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 26/02/24.
//

import UIKit


class AdvocatesListVC: UIViewController {
    // MARK: ================================ IBOutlets Properties ================================
    @IBOutlet weak var advocatesTableView: UITableView!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    // MARK: ================================ Instance Properties ================================
    let advocateListVM = AdvocateListVM()
    var isBackButtonHide: Bool?
    
    // MARK: ================================ View Controller LifeCycle Methods ================================
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = false
        backButton.isHidden = isBackButtonHide == true ? true : false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        advocatesTableView.estimatedRowHeight = 70
        self.navigationItem.hidesBackButton = true
    }
    
    //MARK: ================================ IBAction Methods ================================
    @IBAction func filterButton(_ sender: UIButton) {
        self.tabBarController?.tabBar.isHidden = true
        let advocateFilter = AdvocatesFilter.showFilteredView(onview: view) {
            print("Show Advocates Filter View")
        }
        advocateFilter.placeDropDownView.isHidden = true
        advocateFilter.practiceFieldDropDownView.isHidden = true
        
        advocateFilter.callbackHideView = {
            self.tabBarController?.tabBar.isHidden = false
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
}

// MARK: ================================ UITableView DataSource Methods ================================
extension AdvocatesListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return advocateListVM.numberOfRowMethod(index: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdvocatesListCell", for: indexPath) as! AdvocatesListCell
        cell.advocateListData()
        
        cell.callback = {
            let advocateDetailVC = self.storyboard?.instantiateViewController(identifier: "AdvocateDetailsVC") as! AdvocateDetailsVC
            self.navigationController?.pushViewController(advocateDetailVC, animated: true)
            print("See Detail")
        }
        
        cell.callbackRating = {
            let reviewVC = self.storyboard?.instantiateViewController(identifier: "ReviewVC") as! ReviewVC
            self.navigationController?.pushViewController(reviewVC, animated: true)
        }
        return cell
    }
}
