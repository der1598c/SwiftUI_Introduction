//
//  ImageLoader.swift
//  MoviesApp
//
//  Created by Leyee.H on 2019/11/19.
//  Copyright © 2019 Leyee. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    
    @Published var downloadedImage: UIImage?
    let didChange = PassthroughSubject<ImageLoader?, Never>()
    
    func load(url: String) {
        
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is not correct...")
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.didChange.send(nil)
                }
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedImage = UIImage(data: data)
                self.didChange.send(self)
            }
            
        }.resume()
    }
    
}
