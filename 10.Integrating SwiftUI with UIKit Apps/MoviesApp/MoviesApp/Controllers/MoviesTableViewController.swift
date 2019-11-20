//
//  MoviesTableViewController.swift
//  MoviesApp
//
//  Created by Leyee.H on 2019/11/19.
//  Copyright © 2019 Leyee. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class MoviesTableViewController: UITableViewController, UITextFieldDelegate {
    
    private var movies: [Movie] = [Movie]()
    
    @IBOutlet weak var filmName_TF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func initView() {
        filmName_TF.delegate = self
        filmName_TF.placeholder = "Movie name"
        self.tableView.rowHeight = 80
    }
    
    @IBSegueAction func showDetails(_ coder: NSCoder) -> UIViewController? {
        
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("IndexPath is not defined")
        }
        let movie = self.movies[indexPath.row]
        
        let movieDetailsView = MovieDetailsView(movie: movie)
        return UIHostingController(coder: coder, rootView: movieDetailsView)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.text!.count > 2 {
            populateMovies()
        }
        
        return true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = self.movies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath)
        
        cell.textLabel?.text = movie.title
        
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: URL(string: movie.poster)!)
            if let imageData = imageData {
                DispatchQueue.main.async {
                    cell.imageView?.image = UIImage(data: imageData)
                    cell.imageView?.layer.cornerRadius = 16
                }
            }
        }
        
        return cell
    }
    
    private func populateMovies() {
        
        let keyWord = self.filmName_TF.text
        
        Webservice().loadMovies(keyWord: keyWord!) { movies in
            
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
            }
            
        }
        
    }
    
}
