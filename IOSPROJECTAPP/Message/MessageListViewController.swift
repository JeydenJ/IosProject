//
//  MessageListViewController.swift
//  IOSPROJECTAPP
//
//  Created by apple on 2023/5/12.
//

import UIKit

class MessageListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    

}


extension MessageListViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageManager.shared.messageData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCellID", for: indexPath)
       let messageListModel = MessageManager.shared.messageData[indexPath.row]
        cell.imageView?.image = UIImage(named: messageListModel.head)
        
    
        cell.textLabel?.text = messageListModel.friendName
        cell.detailTextLabel?.text = messageListModel.list.first?.message
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toChatViewController",
           let indexPath = tableView.indexPathForSelectedRow,
           let vc  = segue.destination as? ChatViewController{
            vc.messageListModel = MessageManager.shared.messageData[indexPath.row]
        }
    }
}
