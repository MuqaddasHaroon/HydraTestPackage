//
//  EmailValidator.swift
//  HydraLearning
//
//  Created by Muqaddas Haroon on 24/01/2022.
//

import SwiftUI

public struct EmailValidator: View {
    @State var emailValidator = ""
    
    public init(){
    }
    public var body: some View {
        TextField("this is our test Project.", text: $emailValidator)
    }
}

public struct EmailValidator_Previews: PreviewProvider {
    public static var previews: some View {
        EmailValidator()
    }
}
