//
//  FavouriteHeader.swift
//  MVVMDemo
//
//  Created by Amit on 23/02/23.
//

import UIKit

class FavouriteHeader: UIView {
    private lazy var containerView: UIView = {
           let view = UIView()
//           view.backgroundColor = .blue
           view.translatesAutoresizingMaskIntoConstraints = false
           view.clipsToBounds = true
           return view
       }()
    
    private  lazy var lableTitle: UILabel = {
        let lable = UILabel()
        lable.text = "Favourites"
        lable.textColor = .gray
//        lable.backgroundColor = .systemPink
        lable.textAlignment = .left
        lable.font = .systemFont(ofSize: 25)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
     lazy var favCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
         collection.backgroundColor = .clear
        collection.isScrollEnabled = true
        collection.showsHorizontalScrollIndicator = false
        return collection
     }()
    
    override func draw(_ rect: CGRect) {
        self.configureUI()
    }
    func configureUI(){

        self.addSubview(containerView)
        containerView.addSubview(lableTitle)
        containerView.addSubview(favCollectionView)

        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        lableTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        lableTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
        lableTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
//        lableTitle.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: 40).isActive = true

        favCollectionView.topAnchor.constraint(equalTo: lableTitle.bottomAnchor, constant: 15).isActive = true
        favCollectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15).isActive = true
        favCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        favCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
    }

}
