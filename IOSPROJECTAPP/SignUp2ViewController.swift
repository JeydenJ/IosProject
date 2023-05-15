//
//  SignUp2ViewController.swift
//  IOSPROJECTAPP
//
//  Created by Jeyden Johnson on 13/5/2023.
//

import UIKit

class SignUp2ViewController: UIViewController{
    
    var email: String?
    var password: String?
    
    @IBOutlet weak var signUpSuburb: UITextField!
    @IBOutlet weak var signUpLastName: UITextField!
    @IBOutlet weak var signUpFirstName: UITextField!
    
    @IBOutlet weak var signUp2Button: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
            self.email = aDecoder.decodeObject(forKey: "email") as? String ?? ""
            self.password = aDecoder.decodeObject(forKey: "password") as? String ?? ""
            super.init(coder: aDecoder)
        }
    init(email: String?, password: String?) {
            self.email = email
            self.password = password
            super.init(nibName: nil, bundle: nil)
        }
    
    @IBAction func signUp2ButtonPressed(_ sender: Any) {
        guard let firstName = signUpFirstName.text, let lastName = signUpLastName.text, let suburb = signUpSuburb.text, !firstName.isEmpty, !lastName.isEmpty, !suburb.isEmpty else {
                    signUp2Alert(withTitle: "Alert", message: "Invalid, one or more fields are empty")
                    return
                }
            
        if let email = email, let password = password {
            let user = User(email: email, password: password, firstName: firstName, lastName: lastName, suburb: suburb)
            DataStore.shared.users.append(user)
            DataStore.shared.saveUsers()
            print("Created new user: \(user)")
            DataStore.shared.loggedInUserEmail = email
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "MainScreen" {
            if signUpFirstName.text == "" || signUpFirstName.text == "" || signUpSuburb.text == "" {
                return false
            }
        }
        return true
    }
    private func signUp2Alert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true) {
            self.signUpFirstName.text = ""
            self.signUpLastName.text = ""
            self.signUpSuburb.text = ""
        }
    }
}
