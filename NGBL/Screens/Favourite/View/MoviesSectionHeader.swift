//
//  MoviesSectionHeader.swift
//  AmitNeugelbAssignment
//
//  Created by Amit on 26/11/22.
//

import UIKit

class MoviesSectionHeader: UIView {
    lazy var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.font = UIFont.systemFont(ofSize: 24)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.textColor = UIColor.gray
        return headerLabel
    }()
    private lazy var containerView: UIView = {
           let view = UIView()
//           view.backgroundColor = .blue
           view.translatesAutoresizingMaskIntoConstraints = false
           view.clipsToBounds = true
           return view
       }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setUI()
//        self.backgroundColor = .red
    }
    
    func setUI(){
        self.addSubview(containerView)
        containerView.addSubview(headerLabel)

        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        headerLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        headerLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        headerLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
    }

}
