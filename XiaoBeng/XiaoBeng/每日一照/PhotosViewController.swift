//
//  PhotosViewController.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/2.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import Foundation
import UIKit

/// 每日一照模块控制器
class PhotosViewController: UITableViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem?.title = "编辑"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        let item = PhotoItemStore.photoItemStore.allItems[indexPath.row]
        
        cell.titleLabel.text = item.title
        cell.dateLabel.text = dateFormatter.string(from: item.date)
        if let image = PhotoStore.photoStore.image(forKey: item.itemKey) {
            cell.photoImageView?.image = image.roundCornersToCircle()
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PhotoItemStore.photoItemStore.allItems.count
    }
    
    @IBAction func addNew(barButtonItem: UIBarButtonItem) {
        print("test")
        let newPhotoItem = PhotoItemStore.photoItemStore.createPhotoItem()
        performSegue(withIdentifier: "showDetail", sender: newPhotoItem)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var item: PhotoItem!
        
        switch segue.identifier {
        case "showItem"?:
            if let row = tableView.indexPathForSelectedRow?.row {
                 item = PhotoItemStore.photoItemStore.allItems[row]
            }
        case "showDetail"?:
            item = sender as! PhotoItem
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
        
        let detailvc = segue.destination as! DetailPhotoViewController
        detailvc.item = item

    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = PhotoItemStore.photoItemStore.allItems[indexPath.row]
            
            let title = "删除 \(item.title)?"
            let message = "你确定你要删除 \(title) 吗?"
            
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
                                             handler: { (action) -> Void in
                                                PhotoItemStore.photoItemStore.removeItem(item)
                                                
                                                PhotoStore.photoStore.deleteImage(forKey: item.itemKey)
                                                
                                                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            
            // Present the alert controller
            present(ac, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
}
