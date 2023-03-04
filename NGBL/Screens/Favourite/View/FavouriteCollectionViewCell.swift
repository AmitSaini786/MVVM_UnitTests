//
//  FavouriteCollectionViewCell.swift
//  NGBL
//
//  Created by Amit on 23/02/23.
//

import UIKit

class FavouriteCollectionViewCell: UICollectionViewCell {
     lazy var containerView: UIView = {
           let view = UIView()
           view.backgroundColor = colors.BGColor
           view.layer.cornerRadius = 10
         view.layer.borderWidth = 2
         view.layer.borderColor = UIColor.blue.cgColor
           view.translatesAutoresizingMaskIntoConstraints = false
           view.clipsToBounds = true
           return view
       }()
    private lazy var favImage: UIImageView = {
        let imageView = UIImageView()
//        imageView.backgroundColor = .green
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var favlable: UILabel = {
        let lable = UILabel()
//        lable.backgroundColor = .link
        lable.text = "Test sfsfsfsfsfsfsf"
        lable.textAlignment = .center
        lable.numberOfLines = 2
        lable.font = .systemFont(ofSize: 12)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    var movies: moviesModel? {
        didSet { // Property Observer
            moviesConfiguration()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.configureUI()
    }
    func configureUI(){
//        self.backgroundColor = .systemPink
        contentView.addSubview(containerView)
        containerView.addSubview(favImage)
        containerView.addSubview(favlable)
        
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        favImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        favImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -18).isActive = true

        favImage.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.8).isActive = true
        favImage.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.8).isActive = true
        
        favlable.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5).isActive = true
        favlable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true
        favlable.topAnchor.constraint(equalTo: favImage.bottomAnchor, constant: -5).isActive = true
        favlable.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true

        DispatchQueue.main.async {
            self.favImage.layer.cornerRadius = self.favImage.frame.size.width / 2
        }
    }
    
    func moviesConfiguration(){
        guard let movies else {return}
        favImage.setImage(with: API.imageBaseURL + movies.poster_path!)
        favlable.text = movies.title
        if movies.isSelected == true{
            containerView.layer.borderWidth = 2
            containerView.layer.borderColor = UIColor.blue.cgColor
        }else{
            containerView.layer.borderWidth = 0
            containerView.layer.borderColor = UIColor.clear.cgColor
        }
    }
}
