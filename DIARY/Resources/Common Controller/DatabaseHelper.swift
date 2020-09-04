//
//  DatabaseHelper.swift
//  DIARY
//
//  Created by mac on 04/09/20.
//  Copyright © 2020 Ishant Tiwari. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper {
    
    static var shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func saveContent(object:[String:String])
    {
        let diary = NSEntityDescription.insertNewObject(forEntityName: "Diary_content", into: context!) as! Diary_content
        diary.title = object["title"]
        diary.content = object["content"]
       
        do{
            try context?.save()
        }
        catch{
            print("Diary data is not save")
        }
        
    }
    
    func editData(object:[String:String],i:Int)
    {
        let arrConent = getContent()
         arrConent[i].title = object["title"]
         arrConent[i].content = object["content"]
        do{
            try context?.save()
        }catch{
            print("date not updated")
        }
    }
    
    func getContent
           () -> [Diary_content] {
           var arrConent = [Diary_content]()
           let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Diary_content")
           do {
               arrConent = try context?.fetch(fetchRequest) as! [Diary_content]
           }
           catch {
               print("can not get Data")
           }
           return arrConent
       }
}
