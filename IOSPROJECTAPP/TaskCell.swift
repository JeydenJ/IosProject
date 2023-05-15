//
//  TaskCell.swift
//  IOSPROJECTAPP
//
//  Created by Jeyden Johnson on 15/5/2023.
//

import UIKit

class TaskCell: UITableViewCell {
    
    
        @IBOutlet weak var taskLabel: UILabel!
        @IBOutlet weak var viewDetailsButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
