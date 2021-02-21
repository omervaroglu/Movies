//
//  setImg.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import Foundation
import Kingfisher

func setImg(image: UIImageView?, imgLink: String) -> (){
    let url = URL(string: imgLink)
    
    image!.kf.indicatorType = .activity
    image!.kf.setImage(
        with: url,
        options: [
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage
    ])
}
func setImgWithCompletion(image: UIImageView?, imgLink: String, success: @escaping (_ isEmpty: Bool? )->()) -> (){
    //    let url = URL(string: imgLink)
    let url : String = imgLink
    let urlStr : String = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let convertedURL : URL = URL(string: urlStr)!
    print(convertedURL)
    
    image!.kf.indicatorType = .activity
    image!.kf.setImage(
        with: convertedURL,
        placeholder: nil,
        options: [
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage
    ])
}
