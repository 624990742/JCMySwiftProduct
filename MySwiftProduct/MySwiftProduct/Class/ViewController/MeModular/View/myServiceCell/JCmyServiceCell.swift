//
//  JCmyServiceCell.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/4/14.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit

class JCmyServiceCell: UITableViewCell {

    
    
    
    
    
    private var timeLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        label.text = "我的服务"
        return label
    }()
    ///MARK: 懒加载
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    
    func setupUI() {
        
        
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
