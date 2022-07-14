//
//  SignupViewController.swift
//  PhotoApp
//
//  Created by Moe Steinmueller on 11.07.22.
//

import UIKit

class SignupViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    var signupPresenter: SignupPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        #if DEBUG
//        if CommandLine.arguments.contains("-skipSurvey") {
//            print("Skipping survey page")
//        }
//        #endif
//
//        #if DEBUG
//        if ProcessInfo.processInfo.arguments.contains("-skipSurvey") {
//            print("Skipping survey page")
//        }
//        #endif

        if signupPresenter == nil {
            let signupModelValidator = SignupFormModelValidator()
            
            let signupUrl = ProcessInfo.processInfo.environment["signupUrl"] ?? SignupConstants.signupURLString
            
            let webservice = SignupWebService(urlString: signupUrl)
            
            signupPresenter = SignupPresenter(formModelValidator: signupModelValidator, webservice: webservice, delegate: self)
        }
    }

    @IBAction func signupButtonTapped(_ sender: Any) {
        let signupFormModel = SignupFormModel(firstName: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", username: usernameTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "", repeatPassword: repeatPasswordTextField.text ?? "")
        
        do {
         try signupPresenter?.processUserSignup(formModel: signupFormModel)
        } catch {
            
        }
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let newView = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        newView.view.accessibilityIdentifier = "LoginViewController"
        self.navigationController?.pushViewController(newView, animated: true)
        
    }
    
}

extension SignupViewController: SignupViewDelegateProtocol {
    func successfulSignup() {
        let alert = UIAlertController(title: "Success", message: "The signup operation was successful", preferredStyle: .alert)
        let when = DispatchTime.now() + 1.5
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "successAlertDialog"
            self.present(alert, animated: true, completion: nil)
            
            
            DispatchQueue.main.asyncAfter(deadline: when) {
                alert.dismiss(animated: true) {
                    let newView = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
                    self.navigationController?.pushViewController(newView, animated: true)
                }
            }
            
        }
    }
    
    func errorHandler(error: SignupError) {
        let alert = UIAlertController(title: "Error", message: "Your request could not be processed at this time", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "errorAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}
