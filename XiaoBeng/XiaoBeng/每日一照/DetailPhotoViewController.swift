//
//  DetailPhotoViewController.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/24.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import UIKit

class DetailPhotoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var detailPhoto: UIImageView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var item: PhotoItem! {
        didSet {
            navigationItem.title = item.title
        }
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    @IBAction func takePhoto(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        PhotoStore.photoStore.setImage(image, forKey: item.itemKey)
        
        detailPhoto.image = image
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleTextField.text = item.title
        dateLabel.text = dateFormatter.string(from: item.date)
    
        let key = item.itemKey
        
        let imageToDisplay = PhotoStore.photoStore.image(forKey: key)
        detailPhoto.image = imageToDisplay
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        item.title = titleTextField.text ?? ""
        
        PhotoItemStore.photoItemStore.saveChanges()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
