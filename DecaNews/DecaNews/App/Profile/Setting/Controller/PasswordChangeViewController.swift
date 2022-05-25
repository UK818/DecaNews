//
//  PasswordChangeViewController.swift
//  DecaNews
//
//  Created by Geniusjames on 16/02/2022.
//

import UIKit

class PasswordChangeViewController: UIViewController {
    @IBOutlet weak var oldPasswordTextField: HideShowPasswordTextField!
    @IBOutlet weak var newPasswordTextField: HideShowPasswordTextField!
    @IBOutlet weak var passwordConfirmationTextField: HideShowPasswordTextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var servicesViewModel: ServicesViewModel?
    var didCompletePasswordChange: CoordinatorTransition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func updatePasswords() {
        guard let oldPassword = oldPasswordTextField.text, let newPassword = newPasswordTextField.text, let passwordConfirmation = passwordConfirmationTextField.text else {return}
        
        if oldPassword.isValidPassword && newPassword.isValidPassword && (newPassword == passwordConfirmation) {
            servicesViewModel?.firebaseService.changePassword(oldPassword: oldPassword, newPassword: newPassword) { result in
                switch result {
                case .failure(let error):
                    print(error)
                    UIView.animate(withDuration: 3) {
                        self.resultLabel.text = error.localizedDescription
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        self.resultLabel.text = ""
                        self.resultLabel.alpha = 1
                    }
                case .success(_:):
                    print("password changed")
                    UIView.animate(withDuration: 3) {
                        self.resultLabel.text = "password changed"
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            self.resultLabel.text = ""
                            self.resultLabel.alpha = 1
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func changePasswordPressed(_ sender: Any) {
        updatePasswords()
    }
}

extension PasswordChangeViewController: Storyboardable {
    static var storyboard: Storyboard { .profile }
}
