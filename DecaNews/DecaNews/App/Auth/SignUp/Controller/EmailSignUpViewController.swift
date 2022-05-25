//
//  EmailLoginViewController.swift
//  DecaNews
//
//  Created by Decagon on 23/01/2022.
//

import UIKit

final class EmailSignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    var viewModel: SignUpViewModel?
    var navigateToTopics: (() -> Void)?
    var navigateToEmailSignin: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    @IBAction func showUnshow(_ sender: Any) {
        guard let sender = sender as? UIButton else { return }
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        passwordTextField.isSecureTextEntry ? setImage(sender, "eye.slash") : setImage(sender, "eye")
    }

    @IBAction func createAccount(_ sender: Any) {
        if !fieldTextError(nameTextField) || !fieldTextError(emailTextField) || !fieldTextError(passwordTextField) {
            return
        }
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        HUD.show()
        viewModel?.signUp(email, password, loggedIn(_:))
    }

    @IBAction func login(_ sender: Any) {
        navigateToEmailSignin?()
    }

    func setImage(_ button: UIButton, _ imageName: String) {
        button.setImage(UIImage(systemName: imageName), for: .normal)
    }

    func loggedIn(_ result: Result<Int, Error>) {
        switch result {
        case .success(_:):
            HUD.hide()
            viewModel?.didSignIn()
            navigateToTopics?()
            self.alert(message: AppMessages.signUpSuccessful, title: AppMessages.signUpTitle)
        case .failure(let error):
            HUD.hide()
            errorMessageLabel.text = error.localizedDescription
        }
    }

    func fieldTextError(_ textField: UITextField) -> Bool {
        var status = true
        if let text = textField.text {
            if (textField.tag == 1 || textField.tag == 3) && text.isEmpty {
                let errorText = textField.tag == 1 ? "Please enter Name" : "Please enter Password"
                status = showError(errorText, textField)
            } else if textField.tag == 2 && !text.isValidEmail {
                status = showError("Please enter a valid Email", textField)
            }
        }
        return status
    }

    func showError(_ errorMessage: String, _ textField: UITextField) -> Bool {
        changeBorderColor(textField)
        errorMessageLabel.text = errorMessage
        return false
    }

    func changeBorderColor(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.red.cgColor
    }

}

extension EmailSignUpViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !fieldTextError(textField) {
            return
        }
        textField.layer.borderWidth = 0
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        errorMessageLabel.text = ""
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "peach")?.cgColor
    }
}

extension EmailSignUpViewController: Storyboardable {
    static var storyboard: Storyboard { .auth }
}
