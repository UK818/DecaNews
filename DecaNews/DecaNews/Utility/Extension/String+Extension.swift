//
//  UITextField+Extension.swift
//  DecaNews
//
//  Created by Decagon on 30/01/2022.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return applyPredicationOnRegex(regexStr: emailRegEx)
    }

    var isValidPassword: Bool {
        let passRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d\\w\\W]{8,}$"
       
        return applyPredicationOnRegex(regexStr: passRegEx)
    }

    public func applyPredicationOnRegex(regexStr: String) -> Bool {
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateOtherString = NSPredicate(format: "SELF MATCHES %@", regexStr)
        let isvalidateOtherString = validateOtherString.evaluate(with: trimmedString)
        return isvalidateOtherString
    }
    
    func dateChanger() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: self) {
            return date
        }
        return Date()
    }
    
    var capitalizedFirstCharacter: String {
        prefix(1).uppercased() + self.dropFirst()
    }
}
