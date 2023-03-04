//
//  HomeViewController+Extension.swift
//  NGBL
//
//  Created by Amit on 23/02/23.
//

import UIKit


extension HomeViewController : UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    
    func configuration(){
        self.navigationItem.title = "Movie App"
        self.view.addSubview(tableView)
        self.view.addSubview(nextButton)

        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        
        tableView.register(tableViewWatchCell.self, forCellReuseIdentifier: "tableViewWatchCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        header = FavouriteHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.height / 4.5))
        tableView.tableHeaderView = header
        header!.favCollectionView.register(FavouriteCollectionViewCell.self, forCellWithReuseIdentifier: "FavouriteCollectionViewCell")
        header!.favCollectionView.delegate = self
        header!.favCollectionView.dataSource = self

        nextButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true

        observeEvents()
        initViewModel()
        nextButton.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
    }
  
   @objc func nextAction(){
      let detailsControllet = MovieDetailsViewController()
//       detailsControllet.delegate?.update
       detailsControllet.strImage = strImg
       detailsControllet.strMovieTitle = strTile
       detailsControllet.strMovieDescription = strDescription
       detailsControllet.strMovieRating = strRating
       detailsControllet.strMovieLanguage = strLanguage
       detailsControllet.strMovieDate = strDate
       detailsControllet.view.backgroundColor = .white

       self.navigationController?.pushViewController(detailsControllet, animated: true)
    }
    
    //Pass data helper
    func setDataToPass(strTitle:String,strImg:String,rating:Float,strDescription:String,strDate:String,strLanguage:String){
        self.strTile = strTitle
        self.strImg = strImg
        self.strRating = String(rating)
        self.strDescription = strDescription
        self.strDate = strDate
        self.strLanguage = strLanguage
    }
    // MARK: - UITableView Data Source / Delegates
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return  ViewModelFav.moviesWatched.count
        }else{
            return  ViewModelFav.moviesToWatched.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewWatchCell") as? tableViewWatchCell else{
            return UITableViewCell()
        }
        if indexPath.section == 0{
            ViewModelFav.moviesWatched = ViewModelFav.filterDataAccordingToSelectedRow(indexPath.row, andSection: indexPath.section)
            let movies = ViewModelFav.moviesWatched[indexPath.row]
            cell.movies = movies
        }else{
            ViewModelFav.moviesToWatched = ViewModelFav.filterDataAccordingToSelectedRow(indexPath.row, andSection: indexPath.section)
            let movies = ViewModelFav.moviesToWatched[indexPath.row]
            cell.movies = movies
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ViewModelFav.selectMovieFromList(indexPath.row, andSection: indexPath.section)
        //        self.header?.favCV.reloadData()
        tableView.reloadData()
        self.header?.favCollectionView.reloadData()
        if indexPath.section == 0{
            self.setDataToPass(strTitle: ViewModelFav.moviesWatched[indexPath.row].title!, strImg: ViewModelFav.moviesWatched[indexPath.row].poster_path!, rating: ViewModelFav.moviesWatched[indexPath.row].rating!, strDescription: ViewModelFav.moviesWatched[indexPath.row].overview!, strDate: ViewModelFav.moviesWatched[indexPath.row].release_date ?? "", strLanguage: ViewModelFav.moviesWatched[indexPath.row].original_language!)

        }else{
            self.setDataToPass(strTitle: ViewModelFav.moviesToWatched[indexPath.row].title!, strImg: ViewModelFav.moviesToWatched[indexPath.row].poster_path!, rating: ViewModelFav.moviesToWatched[indexPath.row].rating!, strDescription: ViewModelFav.moviesToWatched[indexPath.row].overview!, strDate: ViewModelFav.moviesToWatched[indexPath.row].release_date ?? "", strLanguage: ViewModelFav.moviesToWatched[indexPath.row].original_language!)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let headerView = MoviesSectionHeader()
        switch (section){
        case 0:
            headerView.headerLabel.text = "Watched"
        case 1:
            headerView.headerLabel.text = "To Watch"
        default:
            break
           }
       return headerView
   }
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 40
   }
    
    
    // MARK: - UICollectionView Delegate

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return ViewModelFav.favouriteMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavouriteCollectionViewCell", for: indexPath) as? FavouriteCollectionViewCell else{
            return UICollectionViewCell()
        }
        ViewModelFav.favouriteMovies =  ViewModelFav.filterDataAccordingToSelectedGridCell(indexPath.row, andSection: indexPath.section)
        let movies = ViewModelFav.favouriteMovies[indexPath.row]
        cell.movies = movies
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ViewModelFav.selectMovieFromCollectionView(indexPath.row, andSection: indexPath.section)
        tableView.reloadData()
        self.header?.favCollectionView.reloadData()
        self.setDataToPass(strTitle: ViewModelFav.favouriteMovies[indexPath.row].title!, strImg: ViewModelFav.favouriteMovies[indexPath.row].poster_path!, rating: ViewModelFav.favouriteMovies[indexPath.row].rating!, strDescription: ViewModelFav.favouriteMovies[indexPath.row].overview!, strDate: ViewModelFav.favouriteMovies[indexPath.row].release_date ?? "", strLanguage: ViewModelFav.favouriteMovies[indexPath.row].original_language!)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsInRow = 3.8   //number of column you want
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSizeMake(CGFloat(size), collectionView.frame.size.height)
    }
}
