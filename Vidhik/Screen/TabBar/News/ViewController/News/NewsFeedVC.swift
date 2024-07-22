//
//  NewsFeedVC.swift
//  Vidhik
//
//  Created by NumeroEins on 23/02/24.
//

import UIKit
import AVFoundation
import AVKit
import SDWebImage


class NewsFeedVC: UIViewController {
    //MARK: ====================== IBOutlet ======================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var LblMarquee: MarqueeLabel!
    @IBOutlet weak var AdVideo: UIView!
    @IBOutlet weak var newsFeedTableView: UITableView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    //MARK: ====================== Instance Properties ======================
    var player: AVPlayer!
    var looper: AVPlayerLooper?
    var playerViewController: AVPlayerViewController!
    var isBackButtonHide: Bool?
    var checkUserType = ApplicationPreference.getcheckUserType()
    let newsFeedVM = NewsFeedVM()
    
    //MARK: ====================== View Controller Life Cycle Methods ======================
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = false
        self.setUpNaviagtionBar()
        self.setUpTableView()
        playVideo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        getNewsListAPI()
        self.newsFeedTableView.reloadData()
    }
    
    
    //MARK: ====================== Private Methods Navigation Title ======================
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "News"
        navigationView.btnBack.isHidden = isBackButtonHide == true ? true : false
        self.navigationView.btnSearch.isHidden = checkUserType == "Lawyer" ? false : true
        self.navigationView.btnNotification.isHidden = checkUserType == "Lawyer" ? false : true
        self.navigationView.btnProfile.isHidden = checkUserType == "Lawyer" ? false : true
    }
    
    private func setUpTableView() {
        self.newsFeedTableView.delegate = self
        self.newsFeedTableView.dataSource = self
        self.newsFeedTableView.register(UINib(nibName: "NewsFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsFeedTableViewCell")
    }
    
    func playVideo() {
        let videoURL = URL(string: "https://static.pexels.com/lib/videos/free-videos.mp4")
        player = AVPlayer(url: videoURL!)
        let player = AVQueuePlayer()
        looper = AVPlayerLooper(player: player, templateItem: AVPlayerItem(asset: AVAsset(url: videoURL!)))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = AdVideo.bounds
        playerLayer.videoGravity = .resizeAspectFill
        AdVideo.layer.addSublayer(playerLayer)
        player.play()
    }
    // MARK: =============== Get News Api List ===============
    private func getNewsListAPI() {
        Loader.show()
        newsFeedVM.newsListApi { [weak self] response, message in
            Loader.hide()
            switch response {
            case .success:
                print("response")
                self?.newsFeedTableView.reloadData()
            default:
                AlertView.show(title: "", message: message)
            }
            
        }
        
    }
}

//MARK: ====================== Extension UITableView DataSource & Delegate Methods ======================
extension NewsFeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsFeedVM.newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsFeedTableView.dequeueReusableCell(withIdentifier: "NewsFeedTableViewCell", for: indexPath) as! NewsFeedTableViewCell
        tableHeight.constant = newsFeedTableView.contentSize.height
        
        let news = newsFeedVM.newsArray[indexPath.row]
        cell.lblNewsHeadline.text = news.title ?? ""
        cell.lblDetailNews.text = news.description ?? ""
        if let imageUrl = news.imageURL, let updatedUrl = imageUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            cell.newsImage.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "placeholder.png"))
        }
        
        
        cell.readMoreCallback = {
            let newsDetailVC = UIStoryboard(name: "News", bundle: nil).instantiateViewController(withIdentifier: "NewsDetailVC")as! NewsDetailVC
            newsDetailVC.newsUrl = news.newURl ?? ""
            self.navigationController?.pushViewController(newsDetailVC, animated: true)
            print("Read More Button Click")
        }
        return cell
    }
}

//MARK: ====================== NavigationBarView Delegate Methods ======================
extension NewsFeedVC: NavigationBarViewDelegate {
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

