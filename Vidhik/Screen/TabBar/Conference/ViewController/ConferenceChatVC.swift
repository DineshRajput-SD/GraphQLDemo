//
//  ConferenceChatVC.swift
//  Vidhik
//
//  Created by NumeroEins on 21/02/24.
//

import UIKit

class ConferenceChatVC: UIViewController {
    //MARK: =================== IBOutlet Property ===================
    @IBOutlet weak var chatTableView: UITableView!
    
    //MARK: =================== View Controller Life Cycle Method ===================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
    }
    
    private func setUpTableView() {
        self.chatTableView.delegate = self
        self.chatTableView.dataSource = self
        self.chatTableView.register(UINib(nibName: "ReceiverTableViewCell", bundle: nil), forCellReuseIdentifier: "ReceiverTableViewCell")
        self.chatTableView.register(UINib(nibName: "SenderTableViewCell", bundle: nil), forCellReuseIdentifier: "SenderTableViewCell")
    }
    
    //MARK: =================== IBAction ===================
    @IBAction func btnCancelAction(_ sender: UIButton) {
        dismiss(animated:  true)
    }
}

//MARK: =================== UITableViewDelegate, UITableViewDataSource ===================
extension ConferenceChatVC: UITableViewDelegate, UITableViewDataSource {
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
