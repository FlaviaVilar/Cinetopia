//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by Flavia Vilar on 12/07/25.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .white
        label.text = movie.title
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var  posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 32.0
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        let url = URL(string: movie.image)
        imageView.kf.setImage(with: url)
        return imageView
    }()
    
    private lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "Classificação dos usuários: \(movie.rate)"
        return label
    }()
    
    private lazy var synopsisLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .white.withAlphaComponent(0.75)
        label.numberOfLines = 0
        label.text = movie.synopsis
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubViews()
        setupConstraints()
    }
    
    
    private func addSubViews() {
        view.addSubview(titleLabel)
        view.addSubview(posterImageView)
        view.addSubview(rateLabel)
        view.addSubview(synopsisLabel)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            posterImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 34),
            posterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: 220),
            posterImageView.heightAnchor.constraint(equalToConstant: 300),
            
            rateLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 34),
            rateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         
            synopsisLabel.topAnchor.constraint(equalTo: rateLabel.bottomAnchor, constant: 43),
            synopsisLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            synopsisLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        
        ])
    }
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
