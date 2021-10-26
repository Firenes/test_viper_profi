//
//  MainTableViewCell.swift
//  test_viper_profi
//
//  Created by Nikita Shumilin on 26.10.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell, NibLoadable {
    private var _viewModel: MainViewModel?
    
    let filmImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .center
        imageView.backgroundColor = .green
        return imageView
    }()
    
    let filmTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let filmSubtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var descStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [filmTitleLabel, filmSubtitleLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        
        favoriteButton.addTarget(self, action: #selector(favoriteButtonAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func favoriteButtonAction() {
        self._viewModel?.setIsFavorite()
    }
    
    func configure(_ vm: MainViewModel) {
        self._viewModel = vm
        
        filmTitleLabel.text = vm.title
        filmSubtitleLabel.text = vm.subtitle
        filmImageView.image = vm.image
        
        favoriteButton.setImage(vm.isFavorite ? UIImage.init(systemName: "star.fill") : UIImage.init(systemName: "star"), for: .normal)
    }
    
    func setupViews() {
        self.contentView.addSubview(filmImageView)
        self.contentView.addSubview(descStackView)
        self.contentView.addSubview(favoriteButton)
        
        self.contentView.backgroundColor = .yellow
        
        NSLayoutConstraint.activate([
            filmImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            filmImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            filmImageView.widthAnchor.constraint(equalToConstant: 24),
            filmImageView.heightAnchor.constraint(equalToConstant: 24),
            
            favoriteButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            favoriteButton.widthAnchor.constraint(equalToConstant: 24),
            favoriteButton.heightAnchor.constraint(equalToConstant: 24),
            
            descStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            descStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            descStackView.leadingAnchor.constraint(equalTo: self.filmImageView.trailingAnchor, constant: 8),
            descStackView.trailingAnchor.constraint(equalTo: self.favoriteButton.leadingAnchor, constant: -8)
            
//            descStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
//            descStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
//            descStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
//            descStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
        ])
    }
}
