//
//  URLImage.swift
//  MoviesApp
//
//  Created by Leyee.H on 2019/11/19.
//  Copyright © 2019 Leyee. All rights reserved.
//

import Foundation
import SwiftUI

struct URLImage: View {
    
    @ObservedObject private var imageLoader = ImageLoader()
    
    var placeHolder: Image
    
    init(url: String, placeHolder: Image = Image(systemName: "photo")) {
        self.placeHolder = placeHolder
        self.imageLoader.load(url: url)
    }
    
    var body: some View {
        
        if let uiImage = self.imageLoader.downloadedImage {
            return Image(uiImage: uiImage)
        } else {
            return placeHolder
        }
    }
    
}
