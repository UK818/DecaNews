//
//  Password_resetViewController.swift
//  DecaNews
//
//  Created by Decagon on 24/01/2022.
//

import UIKit

class PasswordResetViewController: UIViewController {
    var resetViewModel: ResetPasswordViewModel?
    @IBOutlet weak var passwordReset: UITextField!
    @IBOutlet weak var errorPage: UILabel!
    
    var navigatingToResetPasswordSent: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordResetProperties()
    }

    func passwordResetProperties() {
        passwordReset.layer.borderColor = UIColor(named: AppColors.deapPeach)?.cgColor
        passwordReset.layer.borderWidth = 1
        passwordReset.layer.cornerRadius = 10
    }

    @IBAction func resetLink(_ sender: Any) {
        if let text = passwordReset.text {
            resetViewModel?.newPassword(text, reset(_:))
        }
    }

    func reset(_ result: Result<Int, Error>) {
        switch result {
        case .success(_:):
            navigatingToResetPasswordSent?()
        case .failure(let error):
            errorPage.text = error.localizedDescription
        }
    }
}

extension PasswordResetViewController: Storyboardable {
    static var storyboard: Storyboard { .auth }
}
