//
//  BaseViewController.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/8.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var topBar: UIView!
    var oneBarButton: UIButton!
    var secondBarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    /*自定义导航条*/
    func setupNavBar() {
        hideSystemBar()
        customTopBar()
    }
        
    /*隐藏系统导航条*/
    func hideSystemBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    /*自定义自己的导航条*/
    func customTopBar() {
        
        topBar = UIView()
        topBar.backgroundColor = UIColor.white
        view.addSubview(topBar)
        
        topBar.snp.makeConstraints { (make) in
            make.height.equalTo(64)
            make.leading.trailing.top.equalToSuperview()
        }

        oneBarButton = UIButton(type: .system)
        topBar.addSubview(oneBarButton)
        oneBarButton.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.bottom.equalToSuperview()
        }
        oneBarButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        oneBarButton.setTitle("", for: .normal)
        print("height: \(oneBarButton.bounds.height)")
        oneBarButton.addTarget(self, action: #selector(clickOneButton), for: .touchUpInside)
    }
    
    @objc func clickOneButton() {
        print("test")
    }
}
