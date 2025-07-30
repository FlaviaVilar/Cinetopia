//
//  Movie.swift
//  Cinetopia
//
//  Created by Flavia Vilar on 12/07/25.
//

import Foundation

class Movie: Decodable {
    let id: Int
    let title: String
    let image: String
    let synopsis: String
    let rate: Double
    let releaseDate: String
    private(set) var isSelected: Bool? = false
    
    // MARK: - Class method
    
    func changeSelectionStatus() {
        isSelected = !(isSelected ?? false)
    }
}

//let movies: [Movie] = [
//    Movie(id: 1, title: "O Rei do Show", image: "https://github.com/alura-cursos/movie-api/blob/main/images/vingadores-era-de-ultron.jpg?raw=true", synopsis: "P. T. Barnum, um homem que tem uma tendência natural de enganar seu público, decide montar um circo na esperança de ficar famoso. Durante sua saga, ele ainda precisa lidar com uma questão pendente em sua vida: a paixão cega pela cantora Jenny Lind.", rate: 9.4 , releaseDate: "28/12/2017"),
//    Movie(id: 2, title: "Carol", image: "https://github.com/alura-cursos/movie-api/blob/main/images/mario-bros.jpg?raw=true", synopsis: "Therese Belivet tem um emprego entediante em uma loja de departamentos. Um dia, ela conhece Carol, uma elegante e misteriosa cliente. Rapidamente, as duas mulheres desenvolvem um vínculo amoroso que terá consequências sérias.", rate: 9.9, releaseDate: "14/01/2016"),
//    Movie(id: 3, title: "Vingadores: Ultimato", image: "https://github.com/alura-cursos/movie-api/blob/main/images/pantera-negra.jpg?raw=true", synopsis: "Após Thanos eliminar metade das criaturas vivas, os Vingadores têm de lidar com a perda de amigos e entes queridos. Com Tony Stark vagando perdido no espaço sem água e comida, Steve Rogers e Natasha Romanov lideram a resistência contra o titã louco.", rate: 9.7, releaseDate: "25/04/2019")
//    ]
