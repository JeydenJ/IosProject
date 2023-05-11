//
//  LoginViewController.swift
//  IOSPROJECTAPP
//
//  Created by Jeyden Johnson on 11/5/2023.
//

import UIKit


class LoginViewController: UIViewController
{
    
    @IBOutlet weak var loginEmailTextField: UITextField!
    
    @IBOutlet weak var loginPasswordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var isValidEmail: NSPredicate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        isValidEmail = NSPredicate(format:"SELF MATCHES %@", emailRegex)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        if loginEmailTextField.text == "hi@gmail.com" && loginPasswordTextField.text == "123"{
            return
        }
        
        else if loginEmailTextField.text == "" || loginPasswordTextField.text == ""{
            let alert = UIAlertController(title: "Alert", message: "Your email or password is empty, please try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
        }
        else if !isValidEmail.evaluate(with: loginEmailTextField.text) {
            let alert = UIAlertController(title: "Alert", message: "Your email is not valid", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
            loginEmailTextField.text = ""
            loginPasswordTextField.text = ""
        }
        else {
            let alert = UIAlertController(title: "Alert", message: "Your email is not valid", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "MainScreen" {
            if loginEmailTextField.text == "" || loginPasswordTextField.text == "" {
                return false
            }
            else if !isValidEmail.evaluate(with: loginEmailTextField.text) {
                return false
            }
        }
        return true
    }
    
    
}

