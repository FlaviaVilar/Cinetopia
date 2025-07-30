//
//  MovieManager.swift
//  Cinetopia
//
//  Created by Flavia Vilar on 18/07/25.
//

import Foundation

class MovieManager {
    
    //MARK: - Attributes
    
    static let shared = MovieManager()
    var favotiteMovies: [Movie] = []
    
    // MARK: - Init
    
    private init() { }
    
    // MARK: - Class methods
    
    func add(_ movie: Movie) {
        if favotiteMovies.contains(where: {$0.id == movie.id}) {
            remove(movie)
        } else {
            favotiteMovies.append(movie)
        }
    }
    
    func remove(_ movie: Movie) {
        if let index = favotiteMovies.firstIndex(where: { $0.id == movie.id}) {
            favotiteMovies.remove(at: index)
        }
    }
    
}
