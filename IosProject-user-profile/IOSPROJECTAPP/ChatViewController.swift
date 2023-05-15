//
//  ChatViewController.swift
//  IOSPROJECTAPP
//
//  Created by apple on 2023/5/12.
//

import UIKit

class ChatViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var messageListModel = MessageListModel()
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ChatCell", bundle: nil), forCellReuseIdentifier: "ChatCell")
        //ChatCellID
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight =  UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
        textField.delegate = self
        textField.returnKeyType = .done
    }
    

    func sendMessage()  {
        guard let text = textField.text,
        text.count > 0 else { return  }
        
        let msgModel = MessageModel(friendName: messageListModel.friendName, date: Int(Date().timeIntervalSince1970), message: text, isFriendMessage: false, head: messageListModel.head)
        MessageManager.shared.addOneDataModel(id: messageListModel.id, messageModel: msgModel)
        messageListModel =  MessageManager.shared.getItemMessageData(id: messageListModel.id)
        textField.text = ""
        tableView.reloadData()
        textField.resignFirstResponder()
    }

}
extension ChatViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendMessage()
        return true
    }
}

extension ChatViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageListModel.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
       let messageModel = messageListModel.list[indexPath.row]
        
        
        if messageModel.isFriendMessage  {
            cell.leftImageV.isHidden = false
            cell.rightImageV.isHidden = true
            cell.leftImageV.image = UIImage(named: messageListModel.head)
            cell.titleLab.textAlignment = .left
            cell.detailsLab.textAlignment = .left
            cell.titleLab.text = messageModel.friendName
        } else {
            cell.leftImageV.isHidden = true
            cell.rightImageV.isHidden = false
            cell.rightImageV.image = UIImage(named: "mehead")
            cell.titleLab.textAlignment = .right
            cell.detailsLab.textAlignment = .right
            cell.titleLab.text = "Me"
        }
        
        cell.detailsLab.text = messageModel.message
        
        return cell
    }
    
   
    
}
