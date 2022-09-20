//
//  JCTestCell.swift
//  MySwiftProduct
//
//  Created by jcmac on 2022/7/24.
//  Copyright © 2022 jiachen. All rights reserved.
//

import UIKit

class JCTestCell: UICollectionViewCell {
  static let kTestCellID = "JCTestCellID"
    @IBOutlet weak var bgView: UIView!
    
   
    @IBOutlet weak var satrtTestView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bgView.backgroundColor = .red
        

//        CGAffineTransformMakeRotation(M_PI*0.38)
//        self.satrtTestView.transform = CGAffineTransformMakeRotation
         

    }
    
    func changeStringStyle(strArray: Array<Any>,fontArray: Array<Any>,colorArray: Array<Any>) -> NSAttributedString {
        let totalStr = NSMutableString.init()
        strArray.forEach { str in
            totalStr.append(str as! String)
        }
        
        let paragStyle = NSMutableParagraphStyle.init()
        paragStyle.alignment = .center
        let attributes = [NSAttributedString.Key.paragraphStyle: paragStyle]
        let totalAttr = NSMutableAttributedString.init(string: totalStr as String, attributes: attributes)
        for (idx, str) in strArray.enumerated() {
            let tempStr = (str as! String)
            let range = totalStr.range(of: tempStr)
            if idx < fontArray.count {
                totalAttr.addAttribute(
                   .font,
                   value: fontArray[idx],
                   range: range)
            }
            
            if idx < colorArray.count {
                totalAttr.addAttribute(
                   .foregroundColor,
                   value: colorArray[idx],
                   range: range)
            }
        }
       return  totalAttr
   }

    
}


 
