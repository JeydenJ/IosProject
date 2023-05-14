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
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        var taskData = [String: Any]()
        if let taskName = taskname.text {
            taskData["taskName"] = taskName
        }
        if let budgetValue = budget.text {
            taskData["budget"] = budgetValue
        }
        let chosenTime = choosetime.date
        taskData["chosenTime"] = chosenTime
        if let taskDetail = detail.text {
            taskData["taskDetail"] = taskDetail
        }
        let defaults = UserDefaults.standard
        defaults.set(taskData, forKey: "taskData")
    }


}