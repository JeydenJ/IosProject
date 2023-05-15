//
//  MessageManager.swift
//  IOSPROJECTAPP
//
//  Created by apple on 2023/5/12.
//

import Foundation


class MessageManager: NSObject {
    
    static let shared = MessageManager()
    
    var messageData = [MessageListModel]()
    //缓存路径
    let filePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first! + "/message.plist"
    override init() {
        super.init()
        print(filePath)
        //读取缓存plist文件
        guard let array = NSArray(contentsOfFile: filePath) else{
            let subModel = MessageModel(friendName: "Jim", date: Int(Date().timeIntervalSince1970), message: "hello", isFriendMessage: true,head: "head1")
           let model1 = MessageListModel(friendName: "Jim",head: "head1", list: [subModel])
            
            let subModel1 = MessageModel(friendName: "Tom", date: Int(Date().timeIntervalSince1970), message: "are you ok", isFriendMessage: true,head: "head2")
            let model2 = MessageListModel(friendName: "Tom",head: "head2", list: [subModel1])
            
            messageData = [model1,model2]
            self.syncData()
          return
        }
        do {
            //转化成data, 好进行模型转换
            let data = try JSONSerialization.data(withJSONObject: array, options: .prettyPrinted)
            do {
                //json解码   data 转 model
                let messageDataTemp = try JSONDecoder().decode([MessageListModel].self, from: data)
                //保存转换后的模型
                self.messageData = messageDataTemp
            } catch  {
                print(error)
            }
        } catch  {
            print(error)
        }
    }
    
    //添加一条笔记
    func addOneDataModel(id: String, messageModel :MessageModel){
        // 插入在最前面
        for (index,item) in self.messageData.enumerated() {
            if item.id == id {
                self.messageData[index].list.append(messageModel)
                break
            }
        }
        syncData()
        
    }
    
    func getItemMessageData(id: String) ->  MessageListModel{
        // 插入在最前面
        for (_,item) in self.messageData.enumerated() {
            if item.id == id {
                return item
            }
        }
      return  MessageListModel()
    }
    
    
    func syncData()  {
        do {
            // json编码 模型转data
            let data = try JSONEncoder().encode(self.messageData)
            do {
                // model 转 数组
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let jsonArray = jsonObject as? [[String : Any]]{
                    //将数组存入plist文件
                    (jsonArray as NSArray).write(toFile: filePath, atomically: true)
                }
            } catch  {
                print(error)
            }
        } catch  {
            print(error)
        }
    }
}
