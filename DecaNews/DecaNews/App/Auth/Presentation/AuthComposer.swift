//
//  AuthComposer.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 18/02/2022.
//

import Foundation
import UIKit

final class AuthComposer {
    
    static func makeEmailSigninController() -> EmailSiginInViewController {
        let viewController = EmailSiginInViewController.instantiate()
        viewController.viewModel = DIContainer.makeEmailSignInViewModel()
        return viewController
    }
    
    static func makePasswordResetController() -> PasswordResetViewController {
        let viewController = PasswordResetViewController.instantiate()
        viewController.resetViewModel = DIContainer.makeResetPasswordViewModel()
        return viewController
    }
    
    static func makeEmailSignupController() -> EmailSignUpViewController {
        let viewController = EmailSignUpViewController.instantiate()
        viewController.viewModel = DIContainer.makeSignUpViewModel()
        return viewController
    }
    
    static func makeSelectTopicsController() -> SelectedTopicsViewController {
        let viewController = SelectedTopicsViewController.instantiate()
        return viewController
    }
}
