//
//  FeedTableViewCell.swift
//  Vidhik
//
//  Created by NumeroEins on 18/01/24.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    //MARK: ====================== IBOutlet Properties ======================
    @IBOutlet weak var imgProfilePhoto: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblPostTitle: UILabel!
    @IBOutlet weak var lblPostDescription: UILabel!
    @IBOutlet weak var lblLikes: UILabel!
    @IBOutlet weak var lblComments: UILabel!
    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var commentPostView: CustomView!
    @IBOutlet weak var imgUserProfile: UIImageView!
    @IBOutlet weak var txtCommentText: UITextField!
    @IBOutlet weak var btnCommentPost: UIButton!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnShowComments: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var commentTableHeight: NSLayoutConstraint!
    @IBOutlet weak var lawyerCommentView: UIView!
    
    var checkUserType = ApplicationPreference.getcheckUserType()
    var callBackForPostComment : (() -> ())?
    var callBackForLike: (() -> ())?
    var callBackForComment: (() -> ())?
    let feedVM  = FeedVM()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commentTableView.isHidden = true
        self.commentPostView.isHidden = true
        self.commentTableView.reloadData()
        self.setupTableView()
      
    }
    
    func setupTableView() {
        self.commentTableView.dataSource = self
        self.commentTableView.delegate = self
        self.commentTableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentTableViewCell")
    }
    
    // MARK: ====================== IBAction Method ======================
    @IBAction func btnCommentAction(_ sender: UIButton) {
        
        if checkUserType == "User" {
            print("Under Development")
        } else {
            callBackForComment?()
            self.commentTableHeight.constant = self.commentTableView.contentSize.height
            self.commentTableView.isHidden = false
            self.commentPostView.isHidden = false
           
           // self.commentTableView.reloadData()
        }
    }
    
    
    @IBAction func btnLikeAction(_ sender: UIButton) {
        callBackForLike?()
    }
    
    
    @IBAction func btnShareAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnPostCommentAction(_ sender: UIButton) {
        callBackForPostComment?()
    }
}

// MARK: ====================== UITable View DataSource & Delegate Methods ======================
extension FeedTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedVM.commentPostModel.count
        //return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commentTableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell
        let commentPost = feedVM.commentPostModel[indexPath.row]
        cell.lblName.text = commentPost.lawyerName
        cell.lblLocation.text = commentPost.location
        cell.lblTime.text = commentPost.createdAt?.utcToLocal(format: .fullDate, toFormat: .mmDDYYYYHours12)
        cell.lblPostData.text = commentPost.commentText
        return cell
    }
    
    
}
