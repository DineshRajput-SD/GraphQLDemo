////
////  FeedVC.swift
////  Vidhik
///
///Aman:========
///


import UIKit
import AVFoundation
import AVKit

class FeedVC: UIViewController {
    //MARK: ====================== IBOutlet Properties ======================
    @IBOutlet weak var btnSideMenu: UIButton!
    @IBOutlet weak var btnNotification: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnProfile: UIButton!
    @IBOutlet weak var LblMarquee: MarqueeLabel!
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var imgProfilePhoto: UIImageView!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtEnterText: UITextView!
    @IBOutlet weak var btnPost: UIButton!
    @IBOutlet weak var feedsTableView: FeedTableView!
    @IBOutlet weak var AdVideo: UIView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var lawyerPostView: CustomView!
    @IBOutlet weak var lawyerPostViewHeightConstraint: NSLayoutConstraint!
    
    //MARK: ====================== Instance Properties ======================
    var player: AVPlayer!
    var looper: AVPlayerLooper?
    var playerViewController: AVPlayerViewController!
    var sidemenu: SideMenu?
    var checkUserType = ApplicationPreference.getcheckUserType()
    var placeHolderColor = UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
    let feedVM  = FeedVM()
    
    //MARK: ====================== View Controller Life Cycle Methods ======================
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.selectedIndex = 2
        setupUI()
        self.playVideo()
        self.tableViewSetUp()
        setUIAccordingUserSelction()
       // print(UserKeychainManager.shared.getLawyerName()?.capitalized ?? "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFeedPostAPI()
        self.feedsTableView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        feedsTableView.reloadData()
    }
    
    //MARK: ====================== Private Methods ======================
    private func setupUI() {
        txtEnterText.text = "Enter text here..."
        txtEnterText.textColor = placeHolderColor
        txtEnterText.delegate = self
    }
    
    private func setUIAccordingUserSelction() {
        lawyerPostView.isHidden = checkUserType == "User" ? true : false
        lawyerPostViewHeightConstraint.constant = checkUserType == "User" ? 0 : 146
        btnSearch.isHidden = checkUserType == "User" ? true : false
    }
    
    private func tableViewSetUp() {
        self.feedsTableView.delegate = self
        self.feedsTableView.dataSource = self
        self.feedsTableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
    }
    
    private func playVideo() {
        let videoURL = URL(string: "https://static.pexels.com/lib/videos/free-videos.mp4")
        let player = AVQueuePlayer()
        looper = AVPlayerLooper(player: player, templateItem: AVPlayerItem(asset: AVAsset(url: videoURL!)))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = AdVideo.bounds
        playerLayer.videoGravity = .resizeAspectFill
        AdVideo.layer.addSublayer(playerLayer)
        player.play()
    }
    
    
    // MARK: ================= Private Methods API Calling =================
    // FIXME: LawyerId
    private func lawyerPostAPI() {
        Loader.show()
        let id = UserDefaults.standard.string(forKey: UserDefaults.Keys._id)
        feedVM.lawyerPostActivity(lawyerId: id!, title: txtTitle.text ?? "", description: txtEnterText.text ?? "", likeCount: 0) {  response, message in
            Loader.hide()
            switch response {
                
            case .success:
                AlertView.show(title: "", message: message, okTitle: "Ok", cancelTitle: "") { [weak self] index in
                    if index == 1 {
                        self?.txtTitle.text = ""
                        self?.txtEnterText.text = ""
                        self?.getFeedPostAPI()
                        self?.feedsTableView.reloadData()
                        print("Post added successfully")
                    }
                }
                
            default:
                AlertView.show(title: "", message: message)
            }
        }
    }
    
    //MARK:  ====================== IBAction Methods ======================
    @IBAction func btnSideMenuAction(_ sender: UIButton) {
        self.sidemenu = SideMenu(frame: self.view.frame, inview: self)
        sidemenu?.menuTableView.reloadData()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapRecognized))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.isEnabled = true
        tapGesture.cancelsTouchesInView = false
        sidemenu?.blurView.addGestureRecognizer(tapGesture)
        self.view.addSubview(sidemenu ?? UIView())
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func tapRecognized() {
        sidemenu?.removeFromSuperview()
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func btnNotificationAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Notification", bundle: nil).instantiateViewController(withIdentifier: "NotificationVC")as! NotificationVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnSearchAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "SearchVC")as! SearchVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnProfileAction(_ sender: UIButton) {
        if checkUserType == "Laywer" {
            let vc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC")as! ProfileVC
            self.navigationController?.pushViewController(vc, animated: true)
        } else if checkUserType == "User" {
            let vc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "UserProfileVC")as! UserProfileVC
            self.navigationController?.pushViewController(vc, animated: true)
        } else if checkUserType == "Judge" {
            let vc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "JudgeProfileVC")as! JudgeProfileVC
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            
        }
    }
    
    @IBAction func btnPostAction(_ sender: UIButton) {
        guard feedVM.validationForPost(title: txtTitle.text ?? "", description: txtEnterText.text ?? "") else { return }
        lawyerPostAPI()
    }
}

// MARK: ====================== UITableView Delegate & DataSource  Methods ======================
extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedVM.lawyerPostModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.feedsTableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell") as! FeedTableViewCell
        
        var post = feedVM.lawyerPostModel[indexPath.row]
        cell.lblPostTitle.text = post.title
        cell.lblName.text = post.lawyerName ?? ""
        cell.lblLocation.text = post.location ?? ""
        cell.lblPostDescription.text = post.description
        cell.lblTime.text = post.createdAt?.utcToLocal(format: .fullDate, toFormat: .mmDDYYYYHours12)
        let totalLikeCount = " \(Int(post.likeCount ?? Float()))"
        cell.btnLike.setTitle(totalLikeCount, for: .normal)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"//"yyyy-MM-dd HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        //        let date = dateFormatter.date(from: post.createdAt ?? "")
        //        //UTCDateString().convertDateFormater(sourceFormat: .fullDate, destinationFormat: .date)
        //        let localDate = date?.utcToLocal(format: .fullDate, toFormat: .newddMMyyyy)
        //        let days = localDate?.toStringWithRelativeTime()
        //        let intDays: Int = Int((days ?? "0")) ?? 0
        //        if intDays > 1 {
        //            let strDate = Date.stringFromDateString((post.createdAt ?? ""), sourceFormat: .shortTime12, outputFormat: .dayTimeFormat)
        //            cell.lblTime.text = strDate
        //        } else {
        //            cell.lblTime.text = localDate?.toStringWithRelativeTime()
        //        }
        
        cell.lawyerCommentView.isHidden = checkUserType == "User" ? true : false
        cell.btnShare.isHidden = checkUserType == "User" ? true : false
        cell.btnShowComments.setTitle(checkUserType == "User" ? "Share" : "Comment", for: .normal)
        cell.btnShowComments.setImage(UIImage(named: checkUserType == "User" ? "ShareButton" : "CommentButton"), for: .normal)
        cell.btnShowComments.tag = indexPath.row
       // cell.btnShowComments.addTarget(nil, action: #selector(btnCommentAction(sender:)), for:.touchUpInside)
        cell.btnLike.tag = indexPath.row
        // cell.btnLike.addTarget(nil, action: #selector(btnLikeAction(sender:)), for:.touchUpInside)
        cell.callBackForLike = {
            let fav = self.feedVM.isLiked == 1 ? true : false
            self.feedVM.isLiked = fav ? 0 : 1
            cell.btnLike.setImage(self.feedVM.isLiked == 0 ? #imageLiteral(resourceName: "LikeButtonn") : #imageLiteral(resourceName: "likeFillBig"), for: .normal)
            post.likeCount = self.feedVM.isLiked == 0 ? (post.likeCount ?? 0) - 1 : (post.likeCount ?? 0) + 1
            let totalLikeCount = " \(Int(post.likeCount ?? Float()))"
            cell.btnLike.setTitle(totalLikeCount, for: .normal)
            //cell.lblLikes.text = "\(post.likeCount ?? 0) Likes"
            self.likeAndUnlikePostApi(postId: post.postId ?? "", isliked: fav, userID: "663dfc927e235ff2a33b8f97")
            
            
            //guard let userDetail = feedVM.userDetail else { return }
            //            let isLiked = self.feedVM.isLiked
            //            let totalLikeCount = " \(Int(post.likeCount ?? Float()))"
            //            cell.btnLike.setTitle(totalLikeCount, for: .normal)
            //userDetail.allPostCommentLikeCount = isLiked == 0 ? (userDetail.allPostCommentLikeCount ?? 0) - 1 : (userDetail.allPostCommentLikeCount ?? 0) + 1
            
            //            self.repliesVM.childCommentList[index.row].totalLikeCount =  self.repliesVM.childCommentList[index.row].isLiked == 0 ? (self.repliesVM.childCommentList[index.row].totalLikeCount ?? 0) - 1 : (self.repliesVM.childCommentList[index.row].totalLikeCount ?? 0) + 1
            //            repliesCell.totalLikeLabel.text = "\(self.repliesVM.childCommentList[index.row].totalLikeCount ?? 0) Likes"
        }
        
        cell.callBackForComment = {
           // var buttonNumber = sender.tag
            self.tableHeight.constant = self.feedsTableView.contentSize.height
            self.feedsTableView.reloadData()
            self.feedVM.getCommentPostApi(postID: post.postId ?? "") { response, message in
                switch response {
                case .success:
                    cell.commentTableView.reloadData()
                    print("Comment button clicked ==> \(response)")
                default:
                    AlertView.show(title: "", message: message)
                }
            }
        }
        
        
        cell.callBackForPostComment = {
            self.feedVM.postCommentApi(postID: post.postId ?? "", lawyerID: post.lawyerId ?? "", textComment: cell.txtCommentText.text ?? "") { PostCommentResponse, message in
                switch PostCommentResponse {
                case .success:
                    AlertView.show(title: "", message: message, okTitle: "Ok", cancelTitle: "") { index in
                        cell.txtCommentText.text = ""
                        cell.commentTableView.reloadData()
                    }
                    
                default:
                    AlertView.show(title: "", message: message)
                }
                
            }
        }
        
        cell.btnShare.tag = indexPath.row
        cell.btnShare.addTarget(nil, action: #selector(btnShareAction(sender:)), for:.touchUpInside)
        return cell
    }
    
    @objc func btnCommentAction(sender: UIButton) {
        var buttonNumber = sender.tag
        self.tableHeight.constant = self.feedsTableView.contentSize.height
        self.feedsTableView.reloadData()
    }
    
    @objc func btnLikeAction(sender: UIButton) {
        objAppShareData.showAlert(message: "Under Development", controller: self)
    }
    
    @objc func btnShareAction(sender: UIButton) {
        objAppShareData.showAlert(message: "Under Development", controller: self)
    }
}

// MARK: ====================== UITextView Delegate Method ======================
extension FeedVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if txtEnterText.textColor == placeHolderColor {
            txtEnterText.text = nil
            txtEnterText.textColor = UIColor.black
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        return numberOfChars < 200 // 220 Limit Value
    }
}



// MARK: ============  LikeUnLike Api Calling ==============
extension FeedVC {
    // MARK: - LikeUnLike Api Calling
    private func likeUnLike(_ isFav: String, _ lawyerPostModel: LawyerPostModel) {
        Loader.show()
        feedVM.isLikedUnlikedAPI(lawyerId: "", title: "", description: "", likeCount: "") { response, message in
            Loader.hide()
            switch response {
            case .success:
                print("Sucees")
                // let fav = postDetail.isLiked == 0 ? true : false
                //                postDetail.isLiked = fav ? 1 : 0
                //                self.likeButton.setImage(postDetail.isLiked == 0 ? #imageLiteral(resourceName: "ic_like_deactive") : #imageLiteral(resourceName: "ic_like_active"), for: .normal)
                //                postDetail.totalLikeCount = postDetail.isLiked == 0 ? (postDetail.totalLikeCount ?? 0) - 1 : (postDetail.totalLikeCount ?? 0) + 1
                //                self.totleLikeLabel.text = "\(postDetail.totalLikeCount ?? 0) Likes"
                //                guard let userDetail = postDetail.userDetail else { return }
                //                let isLiked = postDetail.isLiked
                //                userDetail.allPostCommentLikeCount = isLiked == 0 ? (userDetail.allPostCommentLikeCount ?? 0) - 1 : (userDetail.allPostCommentLikeCount ?? 0) + 1
                //                self.allComentsLabel.text = "(\(userDetail.allPostCommentLikeCount ?? 0))"
            default:
                AlertView.show(title: "", message: message)
            }
        }
    }
    
    // MARK: - favApiCall() func
    func favApiCall() {
        //        guard let postDetail = communityDetailVM.postDetail else { return }
        //        let isFav = postDetail.isLiked == 0 ? "like" : "unlike"
        //        likeUnLike(isFav, postDetail)
    }
}

// MARK: ================ Get Post List API ===================
extension FeedVC {
    private func getFeedPostAPI() {
        Loader.show()
        feedVM.getPostListApi { [weak self] response, message in
            Loader.hide()
            switch response {
            case .success:
              //  DispatchQueue.main.async {
                    self?.feedsTableView.reloadData()
              //  }
               
            default:
                AlertView.show(title: "", message: message)
                
            }
        }
    }
    
}

//func UTCDateString() -> String {
//    let formatter = DateFormatter()
//    formatter.timeZone = TimeZone(abbreviation: "UTC")
//    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
//    return formatter.string(from: self)
//}

//MARK: ====================== Post Like and Unlike Api Calling ======================
extension FeedVC {
    private func likeAndUnlikePostApi(postId: String, isliked: Bool, userID: String ) {
        Loader.show()
        feedVM.PostLikeAndUnlikeApi(postId: postId, isliked: isliked, userID: userID) { response, message in
            Loader.hide()
            switch response {
            case .success:
                print("Liked button clicked ==> \(response)")
            default:
                AlertView.show(title: "", message: message)
            }
            
        }
        
    }
}

extension FeedVC {
    private func getCommentPostApi(postId: String) {
        Loader.show()
        feedVM.getCommentPostApi(postID: postId) { response, message in
            Loader.hide()
            switch response {
            case .success:
                print("Liked button clicked ==> \(response)")
            default:
                AlertView.show(title: "", message: message)
            }
            
        }
        
    }
}
