//
//  MovieDetailsViewController.swift
//  NGBL
//
//  Created by Amit on 28/02/23.
//

import UIKit
import SwiftUI

class MovieDetailsViewController: UIViewController {

    // MARK: - Variables
     var strImage :String?
     var strMovieTitle :String?
     var strMovieDescription :String?
     var strMovieRating :String?
     var strMovieLanguage :String?
    var strMovieDate :String?


    lazy var movieDetailsBG: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = colors.BGColor
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var movieImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.backgroundColor = .systemPink
        return image
    }()
    
    lazy var movieTitle:UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.textAlignment =  .center
        label.numberOfLines = 2
        return label
    }()
    
    lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy  var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .systemFont(ofSize: 18)
        label.textAlignment =  .left
        label.numberOfLines = 3
        return label
    }()
    
    lazy  var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.textAlignment =  .left
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 2
        return label
    }()
    
    lazy  var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.textAlignment =  .left
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 2
        label.text = "fsdfdffdgdgdgdgdsgd"
        return label
    }()
    
    lazy  var languageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.textAlignment =  .left
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 2
        return label
    }()
    var numbers = [1, 2, 3]

    

    //MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
 
        reverseAppend(&numbers)
        print(numbers)
    }
    
    func reverseAppend(_ array: inout [Int]) {
        var temp = array
        temp.reverse()
        array.append(contentsOf: temp)
    }
    
    

    func configuration(){
        self.navigationItem.title = "Movie Details"

        //movieImageBackground view
        self.view.addSubview(movieDetailsBG)
        movieDetailsBG.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        movieDetailsBG.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        movieDetailsBG.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        movieDetailsBG.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.movieDetailsBG.addSubview(movieImage)

        //movie image
        movieImage.centerXAnchor.constraint(equalTo: movieDetailsBG.centerXAnchor, constant: 0).isActive = true
        movieImage.topAnchor.constraint(equalTo: self.movieDetailsBG.topAnchor, constant: 10).isActive = true
        movieImage.widthAnchor.constraint(equalTo: self.movieDetailsBG.widthAnchor, multiplier: 0.7).isActive = true
        
        movieImage.heightAnchor.constraint(equalTo: self.movieImage.widthAnchor, constant: 0).isActive = true
        DispatchQueue.main.async {
            self.movieImage.layer.cornerRadius = self.movieImage.frame.size.width / 2
        }
        
        self.movieDetailsBG.addSubview(movieTitle)
        movieTitle.leadingAnchor.constraint(equalTo: movieDetailsBG.leadingAnchor, constant: 5).isActive = true
        movieTitle.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 5).isActive = true
        movieTitle.trailingAnchor.constraint(equalTo: movieDetailsBG.trailingAnchor, constant: -5).isActive = true
        movieTitle.bottomAnchor.constraint(equalTo: movieDetailsBG.bottomAnchor, constant: -5).isActive = true
        
        self.view.addSubview(verticalStack)
        
        verticalStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        verticalStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
        verticalStack.topAnchor.constraint(equalTo: self.movieDetailsBG.bottomAnchor, constant: 15).isActive = true

        verticalStack.addArrangedSubview(descriptionLabel)
        verticalStack.addArrangedSubview(ratingLabel)
        verticalStack.addArrangedSubview(dateLabel)
        verticalStack.addArrangedSubview(languageLabel)

        DispatchQueue.main.async {
            self.movieImage.setImage(with: API.imageBaseURL + self.strImage!)
        }
        movieTitle.text = strMovieTitle
        descriptionLabel.text = strMovieDescription
        ratingLabel.text = strMovieRating
        dateLabel.text = strMovieDate

    }
    

}

//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//
//struct MainViewController_Previews: PreviewProvider {
//
//static var previews: some View {
//        return ContentView()
//    }
//
//    struct ContentView: UIViewControllerRepresentable {
//
//        func makeUIViewController(context: Context) -> MovieDetailsViewController {
//            return MovieDetailsViewController()
//        }
//
//        func updateUIViewController(_ uiViewController: MovieDetailsViewController, context: Context) {
//            //
//        }
//    }
//}
//#endif
