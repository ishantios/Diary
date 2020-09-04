//
//  AddContentVC.swift
//  DIARY
//
//  Created by mac on 04/09/20.
//  Copyright © 2020 Ishant Tiwari. All rights reserved.
//

import UIKit




class AddContentVC: UIViewController {
    
    @IBOutlet var txtTitle: UITextField!
    @IBOutlet var txtDescription: UITextView!
    @IBOutlet var btnsave: UIButton!
    @IBOutlet var viewTxt: UIView!
 
    var content_data = NSDictionary()
    var strdata = String()
     

    override func viewDidLoad() {
        super.viewDidLoad()
        self.customDesign()
      
    }
}
extension AddContentVC{
private func customDesign(){
  
   txtTitle.text = content_data["title"] as? String
         txtDescription.text = content_data["content"] as? String
    setRoundRectAndBorderColor(view: btnsave, color: UIColor.clear, width: 0.0, radious: 5)
         setRoundRectAndBorderColor(view: viewTxt, color: UIColor.lightGray, width: 0.5, radious: 10)
  
}
 
    @IBAction func addContent(_ sender: Any) {
         let dict = ["title":txtTitle.text!,"content":txtDescription.text!]
        if txtTitle.text == "" {
             failure(msg: "Please Enter Title!")
        }
        else if txtDescription.text == ""{
             failure(msg: "Please Enter Description!")
        }
        else {
            if (content_data["isupdate"] != nil) {
                DatabaseHelper.shareInstance.editData(object: dict, i: content_data["indexvalue"] as! Int)
       }
        else {
            DatabaseHelper.shareInstance.saveContent(object: dict)
          }
        }
         self.navigationController?.popViewController(animated: true)
    }
}
 

