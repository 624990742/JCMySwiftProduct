//
//  JCmyServiceCell.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/4/14.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit

class JCmyServiceCell: UITableViewCell {
    private var serverDataArr:[JCMyserviceDataModel]?
    var serverData:[JCMyserviceDataModel]? {
        didSet {
            self.serverDataArr = serverData
        }
    }
    
    
    var model:JCMyserviceDataModel? {
        didSet {
              guard let tempModel = model else {return}
            JCDebugLog(message: tempModel.title)
            self.timeLabel.text = tempModel.title
            
        }
    }
    
    
    

    
    
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        
        var views: [UIView] = []
        for objIndex in 0..<5 {
            
            let testView = UIView()
            testView.backgroundColor = UIColor.randomColor()
            self.addSubview(testView)
            views.append(testView)
            
            
        }
        
        
        
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
