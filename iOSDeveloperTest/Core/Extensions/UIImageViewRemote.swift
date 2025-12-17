//
//  UIImageViewRemote.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 15/12/25.
//

import Foundation
import UIKit

private let imageCache = NSCache<NSString, UIImage>()

extension  UIImageView {
    
    func loadImage(from url: URL) {
        
        let key = url.absoluteString as NSString
        
        if let cachedImage = imageCache.object(forKey: key) {
            self.image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: url) {[weak self] data, _, _ in
            guard let data, let  image = UIImage(data: data) else {return}
            
            imageCache.setObject(image, forKey: key)
            DispatchQueue.main.async {
                self?.image = image
            }
        }.resume()
    }
}
