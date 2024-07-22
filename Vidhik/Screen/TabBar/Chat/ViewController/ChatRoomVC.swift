//
//  ChatRoomVC.swift
//  Vidhik
//
//  Created by NumeroEins on 28/02/24.
//

import UIKit

class ChatRoomVC: UIViewController {
    //MARK: =========================== IBOutlet ===========================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var imgChatRoom: UIImageView!
    @IBOutlet weak var lblChatRoomName: UILabel!
    @IBOutlet weak var lblParticipantsNo: UILabel!
    @IBOutlet weak var btnChatOption: UIButton!
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var txtTypeMsg: UITextField!
    @IBOutlet weak var btnSendMsg: UIButton!
    @IBOutlet weak var triangleView: UIView!
    @IBOutlet weak var chatRoomOptionView: UIView!
    @IBOutlet weak var btnAddMember: UIButton!
    @IBOutlet weak var btnRemoveMember: UIButton!
    @IBOutlet weak var btnDeleteChat: UIButton!
    
    var closerForbackVC:(( _ strdict: String) ->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
        self.setUpTableView()
        tabBarController?.tabBar.isHidden = true
        self.imgChatRoom.layer.cornerRadius = 21
        self.triangleView.isHidden = true
        self.chatRoomOptionView.isHidden = true
        self.hideChatOptions()
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Chat Room"
    }
    
    private func setUpTableView() {
        self.chatTableView.delegate = self
        self.chatTableView.dataSource = self
        self.chatTableView.register(UINib(nibName: "ReceiverTableViewCell", bundle: nil), forCellReuseIdentifier: "ReceiverTableViewCell")
        self.chatTableView.register(UINib(nibName: "SenderTableViewCell", bundle: nil), forCellReuseIdentifier: "SenderTableViewCell")
    }
    
    private func hideChatOptions() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.triangleView.isHidden = true
        self.chatRoomOptionView.isHidden = true
    }
    
    //MARK: =========================== IBAction ===========================
    @IBAction func btnChatOptionAction(_ sender: UIButton) {
        self.chatRoomOptionView.layer.cornerRadius = 12
        self.triangleView.isHidden = false
        self.chatRoomOptionView.isHidden = false
        setUpTriangle(targetView: triangleView)
        addShadow(view: triangleView, shadowOpacity: 0.5)
        addShadow(view: chatRoomOptionView, shadowOpacity: 0.5)
    }
    
    @IBAction func btnAddMemberAction(_ sender: UIButton) {
        self.triangleView.isHidden = true
        self.chatRoomOptionView.isHidden = true
        let chatAddMembersVC = UIStoryboard(name: "Chat", bundle: nil).instantiateViewController(withIdentifier: "ChatAddMembersVC")as! ChatAddMembersVC
        chatAddMembersVC.modalPresentationStyle = .overCurrentContext
        navigationController?.present(chatAddMembersVC, animated: false)
    }
    
    @IBAction func btnRemoveMemberAction(_ sender: UIButton) {
        self.triangleView.isHidden = true
        self.chatRoomOptionView.isHidden = true
        let removeMemberVC = UIStoryboard(name: "Chat", bundle: nil).instantiateViewController(withIdentifier: "ChatRemoveMemberVC")as! ChatRemoveMemberVC
        removeMemberVC.modalPresentationStyle = .overCurrentContext
        navigationController?.present(removeMemberVC, animated: false)
    }
    
    @IBAction func btnDeleteChatAction(_ sender: UIButton) {
        self.triangleView.isHidden = true
        self.chatRoomOptionView.isHidden = true
        let deleteChatVC = UIStoryboard(name: "Chat", bundle: nil).instantiateViewController(withIdentifier: "DeleteChatVC")as! DeleteChatVC
        deleteChatVC.modalPresentationStyle = .overCurrentContext
        navigationController?.present(deleteChatVC, animated: false)
    }
    
    @IBAction func btnSendMsgAction(_ sender: UIButton) {
        
    }
}

//MARK: =========================== Extension ===========================
extension ChatRoomVC: NavigationBarViewDelegate {
    func navigationBackAction() {
        self.closerForbackVC?("Hi")
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

//MARK: =========================== UITableViewDelegate, UITableViewDataSource ===========================
extension ChatRoomVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let senderCell = chatTableView.dequeueReusableCell(withIdentifier: "SenderTableViewCell", for: indexPath) as! SenderTableViewCell
        print(senderCell)
        let receiverCell = chatTableView.dequeueReusableCell(withIdentifier: "ReceiverTableViewCell", for: indexPath) as! ReceiverTableViewCell
        return receiverCell
    }
}
