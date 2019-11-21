//
//  ContentView.swift
//  Grid-Demo
//
//  Created by cata on 8/22/19.
//  Copyright © 2019 Naila Sheikh. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    let landscape = Landscape.all()
    
    var body: some View {
        
        let chunkedLandscape = landscape.chunked(into: 1)
        return List {
            // rows
            ForEach(0..<chunkedLandscape.count) { index in
                HStack {
                    ForEach(chunkedLandscape[index]) { landscape in
                        VStack {
                            Text(landscape.name)
                                .bold()
                            Image(landscape.imageURL)
                                .resizable()
                               // .frame(width: 150, height: 150)
                                .scaledToFit()
                                .cornerRadius(12)
                            Text(landscape.description)
                                .italic()
                        }
                    }
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

