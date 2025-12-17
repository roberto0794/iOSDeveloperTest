//
//  ImageViewRounded.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 15/12/25.
//

import Foundation
import UIKit

extension UIImageView {
    
    func rounded(_ radius: CGFloat)  {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    func circle() {
        layoutIfNeeded()
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
    }
}
