//
//  ChatCell.swift
//  IOSPROJECTAPP
//
//  Created by apple on 2023/5/12.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var leftImageV: UIImageView!
    @IBOutlet weak var rightImageV: UIImageView!
    
    @IBOutlet weak var titleLab: UILabel!
    
    @IBOutlet weak var detailsLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        leftImageV.layer.cornerRadius = 20
        leftImageV.layer.masksToBounds = true
        rightImageV.layer.cornerRadius = 20
        rightImageV.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
