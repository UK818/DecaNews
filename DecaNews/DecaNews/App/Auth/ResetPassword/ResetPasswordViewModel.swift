//
//  resetPassword.swift
//  DecaNews
//
//  Created by Decagon on 02/02/2022.
//

import Foundation

final class ResetPasswordViewModel {
    func newPassword(_ text: String?, _ completionHandler: @escaping (Result<Int, Error>) -> Void) {
        if let text = text, text.isValidEmail {
            FirebaseService().resetPassword(text, completionHandler)
        }
    }
}
