//
//  UIImage+Extension.swift
//  JCMySwitfDemo
//
//  Created by jiachen on 2019/8/14.
//  Copyright © 2019 jiachen. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func imageColor(color: UIColor, size: CGSize) -> UIImage  {
        
        
        let rect = CGRect(origin: CGPoint.init(x: 0, y: 0), size: CGSize(width: size.width == 0 ? 1.0 : size.width, height: size.height == 0 ? 1.0 : size.height))

        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
         color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    func resetImageSize(newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: newWidth, height: newHeight)))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
    
    static func initImageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext();
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
           let tempImage = UIGraphicsGetImageFromCurrentImageContext();
           UIGraphicsEndImageContext();
        return tempImage!
    }
    
    
    
}
