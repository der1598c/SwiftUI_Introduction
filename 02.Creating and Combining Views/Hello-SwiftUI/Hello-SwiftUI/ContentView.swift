//
//  ContentView.swift
//  Hello-SwiftUI
//
//  Created by cata on 8/11/19.
//  Copyright © 2019 cata. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello SwiftUI..")
    }
}

struct SecondView: View {
    var body: some View {
        VStack {
            Text("First line")
                .font(.largeTitle)
                .foregroundColor(.blue)
            
//            Spacer()
            
            Text("Second line")
                .font(.title)
                .foregroundColor(.green)
            
            Text("Third line")
            .foregroundColor(.orange)
            
            HStack {
                Text("Left side.")
                    .font(.subheadline)
                Text("Right side.")
                    .font(.subheadline)
                    .padding(.all)
            }
        }
    }
}

struct ThirdView: View {
    var body: some View {
        VStack(alignment: .center) {
            
            Image("Taroko_Taiwan")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(60)
                .padding(.all)
//                .clipShape(Circle())
            
            Text("First line")
            .font(.largeTitle)
            .foregroundColor(.blue)
//            Spacer()
            
            Text("Second line")
                .font(.title)
                .foregroundColor(.green)
            
            HStack {
                Text("Left side.")
                Text("Right side.")
                    .padding(.all)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
//        SecondView()
        ThirdView()
    }
}
#endif
