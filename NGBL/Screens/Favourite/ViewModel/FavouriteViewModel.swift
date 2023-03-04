//
//  FavouriteViewModel.swift
//  NGBL
//
//  Created by Amit on 24/02/23.
//

import Foundation

final class favouriteViewModel{
    var favouriteMovies = [moviesModel]()
    var moviesWatched = [moviesModel]()
    var moviesToWatched = [moviesModel]()
    var selectedIDs = [Int]()
    var favEventHandler: ((_ event : Event) -> Void)?
    var moviesListHandler: ((_ event : Event) -> Void)?
    var enableNextButton: ((_ event : NextButtonHighlight) -> Void)?
    let internetConnectivity =  InternetAvaiable()

    func fetchFavourites(){
        self.favEventHandler?(.loading)

        if  internetConnectivity.isInternetAvailable() == false{
            self.favEventHandler?(.noInternet)
            return
        }
        APIManager.shared.request(modelType: ResultsFav.self, type: APIEndPoint.favourites) { response in
            switch response{
            case .success(let fav):
                let favMovies = fav.results
                //filter all movies array according to favourites data
                self.favouriteMovies = self.favouriteMovies.filter { favMovies.map(\.id).contains($0.id) }
                //append favorite data in watched and towatch movies list
                for data in self.favouriteMovies {
                    if !self.moviesWatched.contains(where: { $0.id == data.id }) {
                        self.moviesWatched.append(data)
                    }
                    if !self.moviesToWatched.contains(where: { $0.id == data.id }) {
                        self.moviesToWatched.append(data)
                    }
                }
                self.favEventHandler?(.stopLoading)
                self.favEventHandler?(.dataLoaded)
            case .failure(let error):
                self.favEventHandler?(.error(error))
            }
        }
    }
    
    func fetchMovieList(){
        self.moviesListHandler?(.loading)
        if  internetConnectivity.isInternetAvailable() == false{
            self.moviesListHandler?(.noInternet)
            return
        }
        APIManager.shared.request(modelType: moviesResult.self, type: APIEndPoint.moivesList) { response in
            switch response{
            case .success(let movies):
                // add all movies data in favouriteMovies
                self.favouriteMovies = movies.results
                
                //sort accoridng to rating
                let moviesList = movies.results.sorted(by: {$0.rating! > $1.rating!})
                print(movies)
                
                ////    let userArrayForTableView = friendArray.compactMap({ excludeUsers.contains($0.userID) ? nil : $0.userID })
                self.moviesWatched = moviesList.filter({$0.isWatched == true})
                self.moviesToWatched = moviesList.filter({$0.isWatched == false})

//                print(self.moviesWatched)
//                print(self.moviesToWatched)

                self.moviesListHandler?(.stopLoading)
                self.moviesListHandler?(.dataLoaded)
            case .failure(let error):
                self.moviesListHandler?(.error(error))
            }
        }
    }
    
    //Tableview cellforrow Helper to highlight selected row
    func filterDataAccordingToSelectedRow(_ row :Int, andSection _section:Int) -> [moviesModel]{
        if _section == 0{
            var selected = false
            if self.selectedIDs.contains(where: { $0 == moviesWatched[row].id}) {
                selected =  true
            }else{
                selected =  false
            }
            var watched = moviesWatched[row]
            watched.isSelected = selected
            moviesWatched[row] = watched
            return moviesWatched
        }else{
            var selected = false
            if self.selectedIDs.contains(where: { $0 == moviesToWatched[row].id}) {
                selected =  true
            }else{
                selected =  false
            }
            var watched = moviesToWatched[row]
            watched.isSelected = selected
            moviesToWatched[row] = watched
            return moviesToWatched
        }
    }
    
    func filterDataAccordingToSelectedGridCell(_ row :Int, andSection _section:Int) -> [moviesModel]{
        var selected = false
        if selectedIDs.contains(where: { $0==favouriteMovies[row].id}) {
            selected =  true
        }else{
            selected =  false
        }
        var watched = favouriteMovies[row]
        watched.isSelected = selected
        favouriteMovies[row] = watched
        return favouriteMovies
    }
    
    func selectMovieFromList(_ row :Int, andSection _section:Int){
        if _section == 0{
            if let index = selectedIDs.firstIndex(of: moviesWatched[row].id!) {
                selectedIDs.remove(at: index)
               //disable user interction for next button if no item slected
                self.enableNextButton?(.disableNext)
            }else{
                selectedIDs.removeAll()
                selectedIDs.append(moviesWatched[row].id!)
                //enbale user interction for next button if item slected
                self.enableNextButton?(.enableNext)
                //set data to pass to detail view controller
            }
        }else{
            if let index = selectedIDs.firstIndex(of: moviesToWatched[row].id!) {
                selectedIDs.remove(at: index)
                self.enableNextButton?(.disableNext)
            }else{
                selectedIDs.removeAll()
                selectedIDs.append(moviesToWatched[row].id!)
                //enbale user interction for next button if item slected
                self.enableNextButton?(.enableNext)
            }
        }
    }
    
    func selectMovieFromCollectionView(_ row :Int, andSection _section:Int){
        // add or remove movie id from array to mark as highligh
        if let index = self.selectedIDs.firstIndex(of: self.favouriteMovies[row].id!) {
            self.selectedIDs.remove(at: index)
            //disable user interction for next button if no item slected
            self.enableNextButton?(.disableNext)
        }else{
            self.selectedIDs.removeAll()
            self.selectedIDs.append(self.favouriteMovies[row].id!)
            //enbale user interction for next button if item slected
            self.enableNextButton?(.enableNext)

//            self.setDataToPass(strTitle: self.arrMoviesList[indexPath.row].title!, strImg: self.arrMoviesList[indexPath.row].poster_path!, rating: self.arrMoviesList[indexPath.row].rating!, strDescription: self.arrMoviesList[indexPath.row].overview!, strDate: self.arrMoviesList[indexPath.row].release_date ?? "", strLanguage: self.arrMoviesList[indexPath.row].original_language!)
        }
    }
}

extension favouriteViewModel{
    enum Event{
        case noInternet
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
    enum NextButtonHighlight{
        case enableNext
        case disableNext
    }
}


