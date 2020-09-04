//
//  UtilityFunctions.swift
//  DIARY
//
//  Created by mac on 03/09/20.
//  Copyright © 2020 Ishant Tiwari. All rights reserved.
//

import UIKit
import Foundation

//MARK: Get VC

public func getStoryboard(storyboardName:String) -> UIStoryboard {
    
    return UIStoryboard(name: storyboardName, bundle: nil)
}

public func loadVC(strStoryboardID:String,strVCID:String) -> UIViewController {
    let vc = getStoryboard(storyboardName: strStoryboardID).instantiateViewController(withIdentifier:strVCID)
    return vc
}
