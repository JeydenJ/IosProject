//
//  PostTaskController.swift
//  IOSPROJECTAPP
//
//  Created by angie on 14/5/2023.
//

import UIKit

class PostTaskController: UIViewController {

    @IBOutlet weak var taskname: UITextField!
    @IBOutlet weak var budget: UITextField!
    @IBOutlet weak var choosetime: UIDatePicker!
    @IBOutlet weak var detail: UITextView!
    @IBOutlet weak var submit: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func postButtonTapped(_ sender: UIButton) {
        //save as dictionary
        guard let loggedInUserEmail = DataStore.shared.loggedInUserEmail else {
                // handle the case when no user is logged in
                return
            }
            
            let task = Task(taskname: taskname.text ?? "",
                            budget: budget.text ?? "",
                            choosetime: choosetime.date,
                            detail: detail.text ?? "",
                            email: loggedInUserEmail)
            
            DataStore.shared.saveTask(task: task)
    }
    


}
