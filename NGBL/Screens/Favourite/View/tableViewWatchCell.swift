//
//  tableViewWatchCell.swift
//  NGBL
//
//  Created by Amit on 23/02/23.
//

import UIKit

class tableViewWatchCell: UITableViewCell {
    private lazy var containerView: UIView = {
           let view = UIView()
           view.backgroundColor = colors.BGColor
           view.layer.cornerRadius = 5
           view.translatesAutoresizingMaskIntoConstraints = false
           view.clipsToBounds = true
           return view
       }()
    
    lazy var MovieNamelable: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font =  .systemFont(ofSize: 15)
        label.text = "Test"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()

    lazy var MovieImage: UIImageView = {
        let imageView = UIImageView()
//        imageView.backgroundColor = .green
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
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
        self.selectionStyle = .none
//        self.backgroundColor = .systemPink
        contentView.addSubview(containerView)
        containerView.addSubview(MovieImage)
        containerView.addSubview(MovieNamelable)

        containerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true

        MovieImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        MovieImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5).isActive = true
//        MovieImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
//        MovieImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5).isActive = true
        MovieImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        MovieImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        MovieNamelable.topAnchor.constraint(equalTo: MovieImage.topAnchor, constant: 0).isActive = true
        MovieNamelable.bottomAnchor.constraint(equalTo: MovieImage.bottomAnchor, constant: 0).isActive = true
        MovieNamelable.leadingAnchor.constraint(equalTo: MovieImage.trailingAnchor, constant: 5).isActive = true
        MovieNamelable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true

        DispatchQueue.main.async {
            self.MovieImage.layer.cornerRadius = self.MovieImage.frame.size.width / 2
        }
    }
    
    func moviesConfiguration(){
        guard let movies else {return}
        MovieImage.setImage(with: API.imageBaseURL + movies.poster_path!)
        MovieNamelable.text = movies.title
        if movies.isSelected == true{
            containerView.layer.borderWidth = 2
            containerView.layer.borderColor = UIColor.blue.cgColor
        }else{
            containerView.layer.borderWidth = 0
            containerView.layer.borderColor = UIColor.clear.cgColor
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
