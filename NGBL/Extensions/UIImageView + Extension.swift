//
//  UIImageView + Extension.swift
//  MVVMPractiseDemo
//
//  Created by Amit on 18/02/23.
//

import UIKit
import Kingfisher


extension UIImageView {
    func setImage(with urlString: String){
        guard let url = URL.init(string: urlString) else{return}
        let resource  = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource,placeholder: UIImage(named: "nopreview"))
        }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 0.4
        )
    }
}
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
