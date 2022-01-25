//
//  EmailValidator.swift
//  HydraLearning
//
//  Created by Muqaddas Haroon on 24/01/2022.
//

import SwiftUI

public struct EmailValidator {
    
    
    /// "this is a function to check if the email is valid or not. "
    /// - Parameter string: send in your email to check if it is valid or not.
    /// - Returns: returns a true value if email is valid.
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
    
    /// The function is used to check if the password is valid or not. If there is one upper case letter, one lower case, less than 8 characters and if a special character is involved or not.
    /// - Parameter pass: password in string format is required.
    /// - Returns: value will be in a form of Bool. False indicates that password is invalid.
    func passwordIsValid(_ pass: String) -> Bool {
        @State var password = pass
        let password2 = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
        let check = password2.evaluate(with: password)
        let specialChar = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        
        if check == false || password.rangeOfCharacter(from: specialChar.inverted) == nil {
            return false
        } else {
            return true
        }
        
      
    }
}


