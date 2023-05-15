//
//  TaskFindController.swift
//  IOSPROJECTAPP
//
//  Created by angie on 14/5/2023.
//

import UIKit

class TaskFindController: UIViewController {

    @IBOutlet weak var task1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let lastTask = DataStore.shared.tasks.last {
            task1.text = lastTask.taskname
        }

    
    
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            if let lastTask = DataStore.shared.tasks.last {
                task1.text = lastTask.taskname
            }
        }

    
}
