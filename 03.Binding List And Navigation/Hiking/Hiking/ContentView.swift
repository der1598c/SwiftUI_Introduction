//
//  ContentView.swift
//  Hiking
//
//  Created by cata on 8/11/19.
//  Copyright © 2019 cata. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let hikes = Hike.all()
    
    var body: some View {
        
        NavigationView {
        
        List(hikes) {hike in
            HikeCell(hike: hike)
        }
            .navigationBarTitle(Text("Hikings"))
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

struct HikeCell: View {
    
    let hike: Hike
    
    var body: some View {
//        return NavigationButton(destination: Text(hike.name)) {
//        return NavigationLink(destination: Text(hike.name)) {
        return NavigationLink(destination: HikeDetail(hike: hike)) {
            HStack {
                Image(hike.imageURL)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(16)
                
                VStack(alignment: .leading) {
                    Text(hike.name)
                    Text(hike.location)
                }
            }
        }
    }
}
