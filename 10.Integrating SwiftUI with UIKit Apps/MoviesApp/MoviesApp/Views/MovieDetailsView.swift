//
//  MovieDetailsView.swift
//  MoviesApp
//
//  Created by Leyee.H on 2019/11/19.
//  Copyright © 2019 Leyee. All rights reserved.
//

import Foundation
import SwiftUI

struct MovieDetailsView: View {
    
    @State private var selected: Bool = false
    let movie: Movie
    
    var body: some View {
        ZStack() {
            
            Color.gray
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                
                HStack {
                    Spacer()
                    StarViewRepresentation(selected: $selected)
                        .frame(width: 35, height: 35)
                        .padding()
                }
                
                URLImage(url: movie.poster)
                    .cornerRadius(16)
                
                Text(movie.title)
                .foregroundColor(Color.white)
                HStack {
                    Text("Year: \(movie.year)")
                        .background(Color.green)
                        .cornerRadius(8)
                        .padding(6)
                    Text("IMDB: \(movie.imdbId)")
                        .background(Color.orange)
                        .cornerRadius(8)
                        .padding(6)
                }.padding(12)
                
                Spacer()
            }
            
        }
    }
    
}

struct MovieDetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        let movie = Movie(title: "Batman",year:"2015", imdbId: "tt0372784", poster: "https://m.media-amazon.com/images/M/MV5BMTYwNjAyODIyMF5BMl5BanBnXkFtZTYwNDMwMDk2._V1_SX300.jpg")
        return MovieDetailsView(movie: movie)
    }
    
}
