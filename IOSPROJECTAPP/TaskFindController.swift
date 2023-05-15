//
//  TaskFindController.swift
//  IOSPROJECTAPP
//
//  Created by angie on 14/5/2023.
//

import UIKit

class TaskFindController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var viewDetailsbutton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        tableView.register(TaskCell.self, forCellReuseIdentifier: "TaskCell")
        tableView.dataSource = self
                tableView.delegate = self
        DataStore.shared.loadTasks()

    }
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return DataStore.shared.tasks.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
            let task = DataStore.shared.tasks[indexPath.row]
            cell.taskLabel.text = task.taskname
            cell.viewDetailsButton.addTarget(self, action: #selector(viewDetailsButtonTapped(_:)), for: .touchUpInside)
            return cell
    }

        

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let _ = DataStore.shared.tasks[indexPath.row]
            // navigate to task detail view controller
        }
    @objc func viewDetailsButtonTapped(_ sender: UIButton) {
        if let cell = sender.superview?.superview as? TaskCell,
           let indexPath = tableView.indexPath(for: cell) {
            let _ = DataStore.shared.tasks[indexPath.row]
            // Navigate to task detail view controller
        }
    }
    }

