//
//  AboutView.swift
//  assign3
//
//  Created by Meisheng Liu on 10/16/21.
//

import SwiftUI

struct AboutView: View {
    @State private var isAnimate = false
    @State private var size = 50
    @State private var xOffset = -100
    @State private var yOffset = 0
    @State private var amount = 2
    @State private var color = Color.mint
    
    func changeColor() {
        let rand1 = Double.random(in: 0...255)
        let rand2 = Double.random(in: 0...255)
        let rand3 = Double.random(in: 0...255)
        
        let randomColor = Color(red: rand1/255, green: rand2/255, blue: rand3/255)
        
        self.color = randomColor
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Take a break from the game and watch the circle do some cool animation!")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.bottom, 200)
            
            Circle()
                .fill(isAnimate ? color : color)
                .frame(width: CGFloat(size), height: CGFloat(size))
                .offset(x: CGFloat(xOffset), y: CGFloat(yOffset))
                .rotationEffect(Angle.degrees(isAnimate ? 360 : -370))
                .padding(.top, 100)
                .animation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true))
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: true))
                .onAppear() {
                    self.isAnimate.toggle()
                    self.changeColor()
                    size = 150
                    xOffset = 100
                    yOffset = 150
                }
        }
    }
}
