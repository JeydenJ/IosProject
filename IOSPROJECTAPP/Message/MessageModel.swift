//
//  MessageModel.swift
//  IOSPROJECTAPP
//
//  Created by apple on 2023/5/12.
//

import Foundation

struct MessageListModel: Codable {
    var id = UUID().uuidString
    var friendName = ""
    var head = ""
    var list = [MessageModel]()
}


struct MessageModel: Codable {
    var id = UUID().uuidString
    var friendName = ""
    var date = 0
    var message = ""
    var isFriendMessage = true
    var head = ""
}
