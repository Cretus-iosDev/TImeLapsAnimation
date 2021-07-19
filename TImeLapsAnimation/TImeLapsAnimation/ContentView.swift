//
//  ContentView.swift
//  TImeLapsAnimation
//
//  Created by rutik maraskolhe on 19/07/21.
//

import SwiftUI
struct ContentView: View {
    @State var rotateHandle = false
    @State var drawStroke = false
    @State var eraseStroke = false
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.black, Color.black]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/)
                .scaleEffect(1.2)
            Image("twelve")
            
            Circle() // Erasing the dashed stroke
                .trim(from: 0, to: eraseStroke ? 0 : 1)
                .stroke(style: StrokeStyle(lineWidth: 5, dash: [1,2], dashPhase: 1.0))
                .frame(width: 66, height: 66)
                .foregroundColor(.white)
                .rotationEffect(.degrees(90))
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .onAppear() {
                    withAnimation(Animation.linear(duration: 8).delay(1).repeatCount(1, autoreverses: false)) {
                        self.eraseStroke.toggle()
                    }
            }
            
            Circle() // Dashed stroke
                .trim(from: drawStroke ? 0 : 1, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 5, dash: [1,2], dashPhase: 1.0))
                .frame(width: 66, height: 66)
                .foregroundColor(.white)
                .rotationEffect(.degrees(90))
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .onAppear() {
                    withAnimation(Animation.linear(duration: 8).delay(9).repeatCount(1, autoreverses: false)) {
                        self.drawStroke.toggle()
                    }
            }
        
            Rectangle() // Handle: the part that revolves
                .offset(y: -30)
                .frame(width: 2, height: 10)
                .foregroundColor(.white)
                .rotationEffect(.degrees(rotateHandle ? 360 : 0))
                .animation(Animation.linear(duration: 8).repeatCount(2, autoreverses: false).delay(1))
                .onAppear() {
                    self.rotateHandle.toggle()
            }
            
            Rectangle()
                .frame(width: 25, height: 25)
                .foregroundColor(.red)
                .cornerRadius(4)
            
        }.scaleEffect(2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
