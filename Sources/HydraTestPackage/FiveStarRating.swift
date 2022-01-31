//
//  SwiftUIView.swift
//  
//
//  Created by Muqaddas Haroon on 31/01/2022.
//

import SwiftUI

public struct RatingView: View {
    
    @Binding var rating: Int?
    var max: Int = 5
    
    /// this module will help you in creating a 5 start rating for
    /// - Parameters:
    ///   - rating: this variable will help you monitor the current rating you have selected..
    ///   - maxStart: this is to show the maximum amount of variable.
    public init(rating: Binding<Int?>, maxStart: Int) {
        self._rating = rating
        self.max = maxStart
    }
    
    
    public var body: some View {
        HStack {
            ForEach(1..<(max + 1), id: \.self) { index in
                Image(systemName: self.starType(index: index))
                    .foregroundColor(Color.red).onTapGesture {
                        self.rating = index
                    }
            }
        }
    }
    private func starType(index: Int) -> String {
           
           if let rating = self.rating {
               return index <= rating ? "star.fill" : "star"
           } else {
               return "star"
           }
           
       }
}
