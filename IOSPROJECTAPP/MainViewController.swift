//
//  MainViewController.swift
//  IOSPROJECTAPP
//
//  Created by Jeyden Johnson on 13/5/2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DataStore.shared.loadUsers()
        if let firstName = DataStore.shared.getFirstNameForLoggedInUser() {
            print("First name: \(firstName)")
            nameLabel.text = firstName
            }
    }
}
