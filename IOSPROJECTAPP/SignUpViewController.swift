//
//  SignUpController.swift
//  IOSPROJECTAPP
//
//  Created by Jeyden Johnson on 11/5/2023.
//

import UIKit

class SignUpViewController: UIViewController{
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var signUpEmailTextField: UITextField!
    
    @IBOutlet weak var signUpPasswordTextField: UITextField!
    
    var isValidEmail: NSPredicate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        isValidEmail = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        DataStore.shared.loadUsers()
        print("Loaded \(DataStore.shared.users.count) users")
       
    }       
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        
        guard let email = signUpEmailTextField.text, let password = signUpPasswordTextField.text, !email.isEmpty, !password.isEmpty else {
                signUpAlert(withTitle: "Alert", message: "Your email or password is empty, please try again")
                return
            }
            guard isValidEmail.evaluate(with: email) else {
                signUpAlert(withTitle: "Alert", message: "Your email is not valid")
                return
            }
            let existingUser = DataStore.shared.users.first(where: { $0.email == email })
            if existingUser != nil {
                signUpAlert(withTitle: "Alert", message: "This email has already been used")
                return
            }
        // If there is no existing user with the same email, continue with the signup process
            if let signUp2VC = storyboard?.instantiateViewController(withIdentifier: "SignUp2ViewController") as? SignUp2ViewController {
                signUp2VC.email = signUpEmailTextField.text
                signUp2VC.password = signUpPasswordTextField.text
            }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "SignUp2Screen" {
            if signUpEmailTextField.text == "" || signUpPasswordTextField.text == "" {
                return false
            }
            else if !isValidEmail.evaluate(with: signUpEmailTextField.text) {
                return false
            }
            let existingUser = DataStore.shared.users.first(where: { $0.email == signUpEmailTextField.text })
            if existingUser != nil {
                signUpAlert(withTitle: "Alert", message: "This email has already been used")
                return false
            }
            return true
        }
        return true
    }
    private func signUpAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true) {
            self.signUpEmailTextField.text = ""
            self.signUpPasswordTextField.text = ""
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignUp2Screen" {
            if let signUp2VC = segue.destination as? SignUp2ViewController {
                signUp2VC.email = signUpEmailTextField.text
                signUp2VC.password = signUpPasswordTextField.text
            }
        }
    }
}
