//
//  HomeViewController.swift
//  NGBL
//
//  Created by Amit on 23/02/23.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Outlets
    lazy var tableView: UITableView = {
        let table = UITableView(frame: CGRectZero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
//        table.backgroundColor = .red
        return table
    }()
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.layer.borderWidth = 1
        button.isUserInteractionEnabled = false
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        return button
    }()
    // MARK: - Variables
    var ViewModelFav = favouriteViewModel()
    var header : FavouriteHeader!
    var strTile = ""
    var strImg = ""
    var strDescription = ""
    var strRating = ""
    var strDate = ""
    var strLanguage = ""

    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configuration()
        
    }
    



    func printDays() {
        print("Wednesday")
        defer { print("Sunday") }
        defer { print("Saturday") }
        defer { print("Monday") }
        print("Tuesday")
    }
    func initViewModel(){
        self.ViewModelFav.fetchMovieList()
    }

    
    func observeEvents (){
        //observ movies response
        
        ViewModelFav.moviesListHandler = { [weak self] event in
            guard let self else { return }
            switch event{
            case .noInternet:
                print("No Internet...")
                self.hideIndicator()
                self.showAlert(Alert.title, message: Alert.NoInternet)
                break
            case .loading:
                print("Loading...")
                self.showIndicator()
            case .stopLoading:
                print("Stop Loading...")
            case .dataLoaded:
                self.ViewModelFav.fetchFavourites()
                print("Loading done")
            case .error(let error):
                self.hideIndicator()
                print(error?.localizedDescription ?? "")
            }
        }
        
        //observ favourite response
        ViewModelFav.favEventHandler = { [weak self] event in
            guard let self else { return }
            switch event{
            case .noInternet:
                print("No Internet...")
                self.hideIndicator()
                self.showAlert(Alert.title, message: Alert.NoInternet)
                break
            case .loading:
                print("Loading...")
            case .stopLoading:
                print("Stop Loading...")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.header.favCollectionView.reloadData()
                }
                self.hideIndicator()
            case .dataLoaded:
                print("Loading done")
            case .error(let error):
                self.hideIndicator()
                print(error?.localizedDescription ?? "")
              }
            }
        
        ViewModelFav.enableNextButton = { [weak self] event in
            guard let self else { return }
            switch event{
            case .enableNext:
                self.nextButton.isUserInteractionEnabled = true
                self.nextButton.backgroundColor = .blue
                self.nextButton.setTitleColor(.white, for: .normal)
            case .disableNext:
                self.nextButton.isUserInteractionEnabled = false
                self.nextButton.backgroundColor = colors.BGColor
                self.nextButton.setTitleColor(.lightGray, for: .normal)
            }
         }
        }
    }

