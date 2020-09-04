//
//  UIView_Extension.swift
//  DIARY
//
//  Created by mac on 03/09/20.
//  Copyright © 2020 Ishant Tiwari. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func asImage()-> UIImage{
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image {
            rendererContext in layer.render(in: rendererContext.cgContext)
        }
    }
}
