//
//  DetailPhotoViewController.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/24.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import UIKit

class DetailPhotoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate, UIScrollViewDelegate {
    
    
    @IBOutlet weak var detailPhoto: UIImageView!
    
    var titleTextField: UITextField = UITextField()
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var bigPhoto: UIImageView!
    
    var full: UIView!
    
    var item: PhotoItem! {
        didSet {
            navigationItem.title = item.title
        }
    }
    
    var isShouldHide = false
    
    var scroller: UIScrollView!
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
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

        self.navigationItem.titleView = titleTextField
        titleTextField.returnKeyType = .done
        titleTextField.placeholder = "为这张照片输入一个标题～"
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
        CommonClass.window.endEditing(true)
        return true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        CommonClass.window.endEditing(true)
    }
    
    @IBAction func detailImage(tap: UITapGestureRecognizer) {
        print("tap tap")
        
        full = UIView()
        full.backgroundColor = UIColor.black
        self.full.frame = detailPhoto.frame
        CommonClass.window.addSubview(full)
        
        //scroller
        scroller = UIScrollView()
        scroller.frame = full.bounds
        full.addSubview(scroller)
        scroller.backgroundColor = UIColor.clear
        scroller.contentSize = CGSize(width: CommonClass.screenWidth, height: CommonClass.screenHeight)
        scroller.contentOffset = CGPoint.zero
        
        scroller.delegate = self
        scroller.maximumZoomScale = 3.0
        scroller.minimumZoomScale = 1.0
        //image
        bigPhoto = UIImageView()
        scroller.addSubview(bigPhoto)
        bigPhoto.frame = scroller.bounds
        bigPhoto.image = detailPhoto.image
        bigPhoto.contentMode = .scaleAspectFit
        bigPhoto.isUserInteractionEnabled = true
        
        UIView.animate(withDuration: 0.2, animations: {
            if UIDevice.current.orientation == .portrait {
                self.full.frame = CommonClass.screenBounds
                self.scroller.frame = CommonClass.screenBounds
                self.bigPhoto.frame = CommonClass.screenBounds
            } else {
                self.full.frame = CommonClass.screenBoundsLand
                self.scroller.frame = CommonClass.screenBoundsLand
                self.bigPhoto.frame = CommonClass.screenBoundsLand
            }
            
        }, completion: nil)
        
        let disTap = UITapGestureRecognizer(target: self, action: #selector(DetailPhotoViewController.dismissFull(_:)))
        full.addGestureRecognizer(disTap)
        
        isShouldHide = true
        setNeedsStatusBarAppearanceUpdate()
        
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return isShouldHide
    }
    
    
    
    
    @objc func dismissFull(_ tap: UITapGestureRecognizer) {
        print("dismiss")
        
        UIView.animate(withDuration: 0.3, animations: {
            self.full.alpha = 0.0
        }) { (com) in
            self.full.removeFromSuperview()
        }

        isShouldHide = false
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return bigPhoto
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("transition")
        print("size: \(size)")
        coordinator.animate(alongsideTransition: { (test) in
            self.full.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            self.scroller.frame = self.full.bounds
            self.bigPhoto.frame = self.full.bounds
        }) { (test) in
            
        }
    }
}
