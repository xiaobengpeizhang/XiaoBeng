//
//  PhotoItemStore.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/24.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import Foundation

class PhotoItemStore {
    
    static let photoItemStore = PhotoItemStore()
    
    var allItems: [PhotoItem] = []
    
    let itemArchiveURL: URL = {
        let documentsDirectories =
            FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    init() {
        if let archivedItems =
            NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [PhotoItem] {
            allItems += archivedItems
        }
    }
    
    @discardableResult func createPhotoItem(title: String = "") -> PhotoItem {
        let newItem = PhotoItem(title: title)
        allItems.append(newItem)
        
        return newItem
    }
    
    func removeItem(_ item: PhotoItem) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
        saveChanges()
    }
    
    @discardableResult func saveChanges() -> Bool {
        print("Saving items to: \(itemArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path)
    }
}
