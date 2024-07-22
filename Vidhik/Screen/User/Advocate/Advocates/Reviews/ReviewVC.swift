//
//  ReviewVC.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 29/02/24.
//

import UIKit

class ReviewVC: UIViewController {
    
    // MARK: ================================ IBOutlets Properties ================================
    @IBOutlet weak var reviewTableView: UITableView!
    
    let reviewVM = ReviewVM()
    
    // MARK: ================================ View Controller Life Cycle Methods ================================
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    // MARK: ================================ IBAction Methods ================================
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: ================================  RatingView Delegate Method ================================
extension ReviewVC: RatingViewDelegate {
    func updateRatingFormatValue(_ value: Int) {
        print("Rating : = ", value)
    }
}


// MARK: ================================ UITableView DataSource Methods ================================
extension ReviewVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "ReviewHeaderViewCell", for: indexPath) as! ReviewHeaderViewCell
            headerCell.ratingButton.isUserInteractionEnabled = isFirstTimePayment == true ? true : false
            headerCell.ratingButton.backgroundColor = isFirstTimePayment == true ? .solidBlue : .bgGrey
            headerCell.ratingButton.tintColor = isFirstTimePayment == true ? .white : .gray
           
            headerCell.callback = {
                self.reviewTableView.reloadData()
            }
            
            return headerCell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! ReviewCell
            return cell
        }
    }
}

// MARK: ================================ UITableView Delegate Methods ================================
extension ReviewVC : UITableViewDelegate {
    
}

