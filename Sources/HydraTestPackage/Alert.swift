//
//  SwiftUIView.swift
//  
//
//  Created by Muqaddas Haroon on 24/01/2022.
//



import SwiftUI

public struct BoddyAlert: View {
    
    var title: String
    
    var message: String
    var secondGrayMessage : String
    var secondMessage : String
    var buttonTitle : String
    var twoButtons : Bool
    
    @Binding var isPresented: Bool

    var confirmed: (Bool) -> Void
    
    public init (title: String, message: String, secondMessage: String, secondGrayMessage: String, buttonTitle: String, twoButton: Bool, isPresented: Binding<Bool>, _ confirmed : @escaping (Bool) -> ()) {
        self.title = title
        self.message = message
        self.secondMessage = secondMessage
        self.secondGrayMessage = secondGrayMessage
        self.buttonTitle = buttonTitle
        self.twoButtons = twoButton
        self._isPresented = isPresented
        self.confirmed = confirmed
  
    }
    public var body: some View {
        
        VStack {
            
            HStack {
                
                Button( action: {
                    isPresented = false
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .foregroundColor(.black)
                }
                .padding()
                
                Spacer()
                
                Text(title)
                    .font(.system(size: 20))
                    .padding()
                
                Spacer()
                Image(systemName: "xmark")
                    .font(.system(size: 15, weight: .bold, design: .default))
                    .foregroundColor(.clear)
                    .padding()
            }
            .padding(.top)
            
            Divider()
            
            Text(message)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .font(.system(size: 18))
                .padding(.horizontal, 20)
                .padding(.top, 30)
                .padding(.bottom, 20)
            
            if secondGrayMessage != "" {
            Text(secondGrayMessage)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .font(.system(size: 15))
                .foregroundColor(Color("gray_3"))
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
            
            if secondMessage != "" {
            Text(secondMessage)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .font(.custom("PTSans-Regular", fixedSize: 18))
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }

            Button(action: {
                //confirmed(true)
                isPresented = false
            }) {
                
                HStack {
                    
                    Spacer()
                    
                Text(buttonTitle)
                    .font(.custom("Industry-Demi", fixedSize: 18))
                    .foregroundColor(Color.white)
                    
                    Spacer()
                    
                }
                .padding()
                .background(Color.blue.cornerRadius(6))
                .padding(.horizontal)
                .padding(.bottom)
            }
            
            if twoButtons {
                Button(action: {
                   // confirmed(false)
                    isPresented = false
                }) {
                    
                    HStack {
                        Text("Maybe later")
                            .foregroundColor(Color("gray_1"))
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            
        }
        .padding(.bottom)
        .frame(width: UIScreen.main.bounds.width - 80)
        .background(Color.white.cornerRadius(24))
        
    }
}

