//
//  Webservice.swift
//  MoviesApp
//
//  Created by Leyee.H on 2019/11/19.
//  Copyright © 2019 Leyee. All rights reserved.
//

import Foundation

class Webservice {
    
    @UrlEncode
    var keyWord: String
    
    func loadMovies(keyWord: String, completion: @escaping ([Movie]?) -> ()) {
        
        self.keyWord = keyWord
        
        guard let url = URL(string: "http://www.omdbapi.com/?s=\(self.keyWord)&apikey=564727fa") else {
            fatalError("URL is incorrect")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let moviesResponse = try? JSONDecoder().decode(MoviesResponse.self, from: data)
            
            if let moviesResponse = moviesResponse {
                
                DispatchQueue.main.async {
                    completion(moviesResponse.search)
                }
            }
            
        }.resume()
        
    }
    
}

@propertyWrapper
class UrlEncode {
    
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get { value }
        set {
            if let url = newValue.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                self.value = url
            }
        }
    }
    
}
