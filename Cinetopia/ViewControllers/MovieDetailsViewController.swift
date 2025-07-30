//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by Flavia Vilar on 12/07/25.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
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
        setupScrollView()
        addSubViews()
        setupConstraints()
    }
    
    private func setupScrollView() {
           scrollView.translatesAutoresizingMaskIntoConstraints = false
           contentView.translatesAutoresizingMaskIntoConstraints = false
           
           view.addSubview(scrollView)
           scrollView.addSubview(contentView)
           
           NSLayoutConstraint.activate([
               scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
               scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
               
               contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
               contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
               contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
               contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
               contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor) // isso é essencial pro scroll funcionar verticalmente
           ])
       }
    
    private func addSubViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(posterImageView)
        contentView.addSubview(rateLabel)
        contentView.addSubview(synopsisLabel)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            posterImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 34),
            posterImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: 220),
            posterImageView.heightAnchor.constraint(equalToConstant: 300),
            
            rateLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 34),
            rateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
         
            synopsisLabel.topAnchor.constraint(equalTo: rateLabel.bottomAnchor, constant: 43),
            synopsisLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            synopsisLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            synopsisLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32)
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
