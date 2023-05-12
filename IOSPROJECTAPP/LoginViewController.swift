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
        DataStore.shared.loadUsers()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        guard let email = loginEmailTextField.text, let password = loginPasswordTextField.text, !email.isEmpty, !password.isEmpty else {
                    alertDisplay(withTitle: "Alert", message: "Your email or password is empty, please try again")
                    return
                }
                
                guard isValidEmail.evaluate(with: email) else {
                    alertDisplay(withTitle: "Alert", message: "Your email is not valid")
                    return
                }
                let savedUsers = DataStore.shared.users
                    if savedUsers.first(where: { $0.email == email && $0.password == password }) != nil {
                    
                        return
                        }
                    else {
                        alertDisplay(withTitle: "Alert", message: "Invalid email or password")
                        return
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
    private func alertDisplay(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true) {
            self.loginEmailTextField.text = ""
            self.loginPasswordTextField.text = ""
        }
    }
    
    
}

