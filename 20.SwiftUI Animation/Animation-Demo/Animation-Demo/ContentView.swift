//
//  ContentView.swift
//  Animation-Demo
//
//  Created by Leyee.H on 2019/11/21.
//  Copyright © 2019 Leyee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showDetails: Bool = false
    
    var body: some View {
        VStack {
            
            /*
            *Combininging Animations
            */
            Spacer()
            Text("🐼")
                .font(.custom("Arial", size: 100))
                .scaleEffect(self.showDetails ? 2 : 1)
                .rotationEffect(.degrees(self.showDetails ? 360.0 : 0.0))
                .animation(.interpolatingSpring(mass: 1.0, stiffness: 100.0, damping: 10, initialVelocity: 0))
            
            Spacer()
            Button("Press me") {
                self.showDetails.toggle()
            }.padding()
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(20)
            
            /*
            *Notification View Spring Animation
            */
//            NotificationView()
//                .offset(y: self.showDetails ? -UIScreen.main.bounds.height / 3 : -UIScreen.main.bounds.height)
//                .animation(.interpolatingSpring(mass: 1.0, stiffness: 100.0, damping: 10, initialVelocity: 0))
            
//            Button("Press me") {
//                self.showDetails.toggle()
//            }
            
            /*
             *Basic Animation
             */
//            Button("Press me") {
//                self.showDetails.toggle()
//            }
            
//            HStack{
//                Text(self.showDetails ? "Hide Details" : "Show Details")
//                Image(systemName: "chevron.up.square")
//                    .rotationEffect(.degrees(self.showDetails ? 0 : 180))
//                    .animation(.default)
//            }
            
            /*
            *Spring Animation
            */
//            Button("Press me") {
//                self.showDetails.toggle()
//            }
            
//            HStack {
//                Text("🐼")
//                    .font(.custom("Arial", size: 100))
//                    .offset(x: self.showDetails ? UIScreen.main.bounds.width - 120 : 0)
////                    .animation(.spring())
//                    .animation(.interpolatingSpring(mass: 1.0, stiffness: 300.0, damping: 10, initialVelocity: 0))
//                Spacer()
//            }
            

            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
