//
//  ViewController.swift
//  DIARY
//
//  Created by mac on 03/09/20.
//  Copyright © 2020 Ishant Tiwari. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
   
    @IBOutlet var tblContent: UITableView?
    @IBOutlet var btnAdd: UIButton!
      var diary_data = [Diary_content]()
   
   
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.customDesign()
    }
}

extension ViewController{
private func customDesign(){
   
  tblContent?.register(DairyDataCell.nib, forCellReuseIdentifier: DairyDataCell.identifier)
     setRoundRectAndBorderColor(view: btnAdd, color: UIColor.clear, width: 0.0, radious: 5)
    self.getGroup()
   
  
}
   
func getGroup()  {
 self.diary_data = DatabaseHelper.shareInstance.getContent()
  tblContent?.reloadData()
 }
    
@IBAction func addContent(_ sender: Any) {
       let storyBoard : UIStoryboard = UIStoryboard(name: SB_AddContent, bundle:nil)
    let nextViewController = storyBoard.instantiateViewController(withIdentifier: idAddConent) as! AddContentVC
     self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diary_data.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = ["title":diary_data[indexPath.row].title!,"content":diary_data[indexPath.row].content!,"indexvalue":indexPath.row,"isupdate":true] as [String : Any]
        print(dict)
        
        let storyBoard : UIStoryboard = UIStoryboard(name: SB_AddContent, bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: idAddConent) as! AddContentVC
        nextViewController.content_data = dict as NSDictionary
       self.navigationController?.pushViewController(nextViewController, animated: true)
  
     }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DairyDataCell.identifier) as! DairyDataCell
        cell.lblTitle.text = diary_data[indexPath.row].title
        cell.lblDescription.text = diary_data[indexPath.row].content
               cell.selectionStyle = .none
        return cell
    }
}

