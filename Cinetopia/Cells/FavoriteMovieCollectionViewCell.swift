//
//  FavoriteMoviesViewController.swift
//  Cinetopia
//
//  Created by Flavia Vilar on 13/07/25.
//

import UIKit

protocol FavoriteMovieCollectionViewCellDelegate: AnyObject {
    func didSelectFavoriteButton(_ sender: UIButton)
}

class FavoriteMovieCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let iconImage = UIImage(systemName: "heart.fill")?.withTintColor(.buttonBackground, renderingMode: .alwaysOriginal)
        button.setImage(iconImage, for: .normal)
        button.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        return button
    }()
    
   weak var delegate: FavoriteMovieCollectionViewCellDelegate?
    
    // MARK: - View life cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Class methods
    
    private func addSubviews() {
        addSubview(moviePosterImageView)
        addSubview(movieTitleLabel)
        addSubview(favoriteButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            moviePosterImageView.topAnchor.constraint(equalTo: topAnchor),
            moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            moviePosterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 140),
            
            movieTitleLabel.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 12),
            movieTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            favoriteButton.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 7),
            favoriteButton.heightAnchor.constraint(equalToConstant: 25),
            favoriteButton.widthAnchor.constraint(equalToConstant: 25),
            favoriteButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            ])
    }
    
    func setupView(_ movie: Movie) {
        let url = URL(string: movie.image)
        moviePosterImageView.kf.setImage(with: url)
        
       movieTitleLabel.text = movie.title
    }
    
    // MARK: - IBAction
    
    @objc
    func didTapFavoriteButton(_ sender: UIButton) {
        delegate?.didSelectFavoriteButton(sender)
    }
    
}
