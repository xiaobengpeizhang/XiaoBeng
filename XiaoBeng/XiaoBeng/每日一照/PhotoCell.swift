//
//  PhotoCell.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/24.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
    
//    @IBOutlet var titleLabel: UILabel！
//    @IBOutlet var photoImageView: UIImageView!
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        titileLabel.adjustsFontForContentSizeCategory = true
//    }
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var photoImageView: UIImageView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let begin = CGPoint(x: 10, y: 10)
        let end = CGPoint(x: 10, y: bounds.height - 10)
        
        UIColor.orange.setStroke()
        path.lineWidth = 3.0
        path.lineCapStyle = .round
        path.move(to: begin)
        path.addLine(to: end)
        path.stroke()
        path.close()
    }
    
}
