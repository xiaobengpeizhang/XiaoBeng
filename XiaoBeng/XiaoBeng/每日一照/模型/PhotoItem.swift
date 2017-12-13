//
//  PhotoItem.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/24.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import UIKit

class PhotoItem: NSObject, NSCoding {
    
    var date: Date
    var title: String = ""
    var itemKey: String
    
    init(title: String) {
        self.itemKey = UUID().uuidString
        self.date = Date()
        self.title = title
    }
    
    required init(coder aDecoder: NSCoder) {
        title = aDecoder.decodeObject(forKey: "title") as! String
        date = aDecoder.decodeObject(forKey: "date") as! Date
        itemKey = aDecoder.decodeObject(forKey: "itemKey") as! String
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        print(self.title, self.date, self.itemKey)
        aCoder.encode(title, forKey: "title")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(itemKey, forKey: "itemKey")
        
    }
}
