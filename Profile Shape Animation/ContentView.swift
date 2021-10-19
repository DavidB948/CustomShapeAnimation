//
//  ContentView.swift
//  Profile Shape Animation
//
//  Created by David Bong Chung Hua on 18/10/2021.
//

import SwiftUI

struct ContentView: View {
    @State var resetStrokes: Bool = true
    @State var strokeStart: CGFloat = 0
    @State var strokeEnd: CGFloat = 0
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                ZStack {
                    ProfileShape()
                        .stroke(style: StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                        .foregroundColor(.gray)
                        .opacity(0.35)
                    ProfileShape()
                        .trim(from: strokeStart, to: strokeEnd)
                        .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                        .foregroundColor(.yellow)
                        .onAppear {
                            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { _ in
                                if self.strokeEnd >= 1 {
                                    if resetStrokes {
                                        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
                                            strokeStart = 0
                                            strokeEnd = 0
                                            resetStrokes.toggle()
                                        }
                                        resetStrokes = false
                                    }
                                }
                                withAnimation(.easeInOut(duration: 1.5)) {
                                    strokeEnd = 1
                                    strokeStart = strokeEnd - 1
                                }
                            }
                        }
                }
                .frame(width: 300, height: 300, alignment: .center)
                HStack{
                    Text("Custom Shape Animation")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .padding(.top, 20)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
