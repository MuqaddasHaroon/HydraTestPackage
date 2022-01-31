//
//  SwiftUIView.swift
//  
//
//  Created by Muqaddas Haroon on 25/01/2022.
//

import SwiftUI

public struct ProgressLoaderLinear: View {
    @State var value: Double
    @State var totalProgressValue: Double
    @State var widthPg: CGFloat
    @State var heightPg: CGFloat
    
    /// this is a simple linear progress view
    /// - Parameters:
    ///   - value: percent compelted yet.
    ///   - totalPgValue: total amoun to be compeleted.
    ///   - width: width of the progress view
    ///   - height: height of the progress view
    public init(value: Double, totalPgValue: Double, width: CGFloat = 300, height: CGFloat = 100){
        self.value = value
        self.totalProgressValue = totalPgValue
        self.widthPg = width
        self.heightPg = height
    }
    
    public var body: some View {
        ProgressView(value: value, total: totalProgressValue)
            .frame(width: widthPg, height: heightPg)
    }
}

public struct ProgressLoaderCircular: View {
    @State var colour: Color
    
    /// this is a simple circular progress view. You need to add a color to it.
    /// - Parameter color: Color to be kept in circular progress view.
    public init(color: Color = .blue){
        self.colour = color
    }
    public var body: some View {
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: self.colour))
            
    }
}

