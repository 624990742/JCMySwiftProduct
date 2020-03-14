//
//  JCSpecialImageView.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/3/13.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit

class JCSpecialImageView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self .addSubview(self.bgImageView)
        self.bgImageView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    
    
    var bgImageName: UIImage? {
        didSet {
            self.bgImageView.image = bgImageName
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private var bgImageView: UIImageView = {
            let iconImageView = UIImageView()
          iconImageView.contentMode = .scaleAspectFill //scaleAspectFit
             return iconImageView
         }()
         
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
