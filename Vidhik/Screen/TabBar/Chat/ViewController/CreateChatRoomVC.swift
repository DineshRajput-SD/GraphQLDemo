//
//  CreateChatRoomVC.swift
//  Vidhik
//
//  Created by NumeroEins on 09/02/24.
//

import UIKit

class CreateChatRoomVC: UIViewController {
    //MARK: =========================== IBOutlets ===========================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var lblChatRoomHeading: UILabel!
    @IBOutlet weak var lblChatRoomSubHeading: UILabel!
    @IBOutlet weak var btnCreate: UIButton!
    @IBOutlet weak var imgChatRoom: UIImageView!
    @IBOutlet weak var inboxTableView: UITableView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var btnAddMember: UIButton!
    @IBOutlet weak var firstTimeCreateView: UIView!
    @IBOutlet weak var inboxView: UIView!
    
    //MARK: =========================== View Controller Life Cycle Method ===========================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
        self.setUpUI()
        self.setUpTableView()
    }
    
    //MARK: Funcations
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Chat Room"
    }
    
    private func setUpTableView() {
        self.inboxTableView.dataSource = self
        self.inboxTableView.delegate = self
        self.inboxTableView.register(UINib(nibName: "InboxTableViewCell", bundle: nil), forCellReuseIdentifier: "InboxTableViewCell")
    }
    
    private func setUpUI() {
        self.inboxView.isHidden = true
    }
    
    private func addMemberForChat() {
        let createChatRoom = UIStoryboard(name: "Chat", bundle: nil) .instantiateViewController(identifier: "CreateChatRoomPopupVC") as! CreateChatRoomPopupVC
        createChatRoom.modalPresentationStyle = .overCurrentContext
        createChatRoom.closerForbackVC = { strdict in
            self.firstTimeCreateView.isHidden = true
            self.inboxView.isHidden = false
        }
        self.navigationController?.present(createChatRoom, animated: false)
    }
    
    //MARK: =========================== Button Action ===========================
    @IBAction func btnCreate(_ sender: UIButton) {
        self.addMemberForChat()
    }
    
    @IBAction func btnAddMemberAction(_ sender: UIButton) {
        self.addMemberForChat()
    }
    
}

//MARK: =========================== Extension ===========================
extension CreateChatRoomVC: NavigationBarViewDelegate {
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

//MARK: =========================== UITableViewDataSource, UITableViewDelegate ===========================
extension CreateChatRoomVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.inboxTableView.dequeueReusableCell(withIdentifier: "InboxTableViewCell", for: indexPath) as! InboxTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatRoomVC = UIStoryboard(name: "Chat", bundle: nil).instantiateViewController(withIdentifier: "ChatRoomVC")as! ChatRoomVC
        chatRoomVC.closerForbackVC = { strdict in
            self.tabBarController?.tabBar.isHidden = false
        }
        self.navigationController?.pushViewController(chatRoomVC, animated: true)
    }
}
