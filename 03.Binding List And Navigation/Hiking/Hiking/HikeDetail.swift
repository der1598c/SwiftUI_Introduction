//
//  HikeDetail.swift
//  Hiking
//
//  Created by cata on 8/11/19.
//  Copyright © 2019 cata. All rights reserved.
//

import Foundation
import SwiftUI

struct HikeDetail: View {
    
    let hike: Hike
    @State var zoomed = false
    
    var body: some View {
        VStack {
            Image(hike.imageURL)
                .resizable()
                .aspectRatio(contentMode: self.zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation(.easeIn(duration: 0.8)) {
                        self.zoomed.toggle()
                    }
            }
            
            Text(hike.location)
                .font(.largeTitle)
        }.navigationBarTitle(Text(hike.name), displayMode: .inline)
    }
}


#if DEBUG
struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: Hike.all()[0])
    }
}
#endif
