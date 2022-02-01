//
//  SwiftUIView.swift
//
//
//  Created by Muqaddas Haroon on 01/02/2022.
//

import SwiftUI

public struct AnimatedCircularProgressView: View {
     @State var progressView: Float
     var incrementValue: Float
     var colourCircle: Color
     var colourFraction: Color
    
    /// this component will show the progress view in an animated form.
    /// - Parameters:
    ///   - progressView: this shows the amount of progress
    ///   - incrementValue: the increment you would want to move your progress view with
    ///   - colourCircle: Colour for your circle.
    ///   - colourFraction: colour representing the fraction covered.
    
    public init(progressView: Float = 0.0, incrementValue: Float = 0.10, colourCircle: Color = .red, colourFraction: Color = .red) {
        self.progressView = progressView
        self.incrementValue = incrementValue
        self.colourCircle = colourCircle
        self.colourFraction = colourFraction
    }
    
   public var body: some View {
        ZStack {
            Color.yellow
                .opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            VStack {
                progressBar(progress: self.$progressView, fractionColor: colourFraction, circleColor: colourCircle)
                    .frame(width: 150.0, height: 150.0)
                    .padding(40.0)
                Button(action: {
                                   self.incrementProgress()
                               }) {
                                   HStack {
                                       Image(systemName: "plus.rectangle.fill")
                                       Text("Increment")
                                   }
                                   .padding(15.0)
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 15.0)
                                           .stroke(lineWidth: 2.0)
                                   )
                               }
                Spacer()
                
                 
            }
            
            
        }
    }
    func incrementProgress() {
        let randomValue = incrementValue
        self.progressView += Float(randomValue)
        }
}

struct progressBar: View {
    @Binding var progress: Float
    @State var fractionColor: Color
    @State var circleColor: Color
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(circleColor)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(fractionColor)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            
            Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                .font(.largeTitle)
                .bold()
            
            
        }
    }
}
