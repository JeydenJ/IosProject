//
//  SignUpController.swift
//  IOSPROJECTAPP
//
//  Created by Jeyden Johnson on 11/5/2023.
//

import UIKit

class SignUpViewController: UIViewController{
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    var isValidEmail: NSPredicate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        isValidEmail = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        DataStore.shared.loadUsers()
       
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        
        if emailTextField.text == "" || passwordTextField.text == ""{
            let alert = UIAlertController(title: "Alert", message: "Your email or password is empty, please try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
            
        }
        else if !isValidEmail.evaluate(with: emailTextField.text) {
            let alert = UIAlertController(title: "Alert", message: "Your email is not valid", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
            emailTextField.text = ""
            passwordTextField.text = ""
        }
        else {
            let newUser = User(email: emailTextField.text!, password: passwordTextField.text!)
            DataStore.shared.users.append(newUser)
            DataStore.shared.saveUsers()
            return
        }
        
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "LoginScreen" {
            if emailTextField.text == "" || passwordTextField.text == "" {
                return false
            }
            else if !isValidEmail.evaluate(with: emailTextField.text) {
                return false
            }
        }
        return true
    }
    
    
}
