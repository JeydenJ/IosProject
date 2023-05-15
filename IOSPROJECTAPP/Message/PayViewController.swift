//
//  PayViewController.swift
//  IOSPROJECTAPP
//
//  Created by apple on 2023/5/12.
//

import UIKit

class PayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func surePay(_ sender: Any) {
        
        showAlertVC(message: "Pay Successed") {
            self.navigationController?.popViewController(animated: true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    //show Alert viewController
    func showAlertVC(message:String,handler: (()->())?)  {
        let alertVC = UIAlertController(title: "tips", message: message, preferredStyle: .alert)
        
        let action =  UIAlertAction(title: "Sure", style: .default) {
            _ in
            handler?()
        }
        
        alertVC.addAction(action)
        self.present(alertVC, animated: true, completion: nil)
    }
}
