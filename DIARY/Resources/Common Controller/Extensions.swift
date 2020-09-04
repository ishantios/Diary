//
//  Extensions.swift
//  DIARY
//
//  Created by mac on 03/09/20.
//  Copyright © 2020 Ishant Tiwari. All rights reserved.
//

import Foundation
import UIKit
import CRNotifications


func failure(msg: String) {
       CRNotifications.showNotification(type: CRNotifications.error, title: "Error", message: msg, dismissDelay: 3)
       
   }

func success(msg : String) {
       CRNotifications.showNotification(type: CRNotifications.success, title: "Success!", message: msg, dismissDelay: 3)
       
       
}

 func setRoundRectAndBorderColor(view: UIView,color:UIColor,width:CGFloat,radious:CGFloat){
        view.clipsToBounds = true
        view.layer.cornerRadius = radious
        view.layer.borderColor = color.cgColor
        view.layer.borderWidth = width
        
}
