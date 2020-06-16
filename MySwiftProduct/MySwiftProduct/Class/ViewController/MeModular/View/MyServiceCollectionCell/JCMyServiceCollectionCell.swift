//
//  MyServiceCollectionCell.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/6/8.
//  Copyright © 2020 jiachen. All rights reserved.
//

import Foundation
import UIKit
class JCMyServiceCollectionCell:UICollectionViewCell {
    
    public  var serviceDataModel :JCMyserviceDataModel? {
        didSet {
            guard serviceDataModel != nil else { return }
            let model = serviceDataModel
            self.coverImageView.image = UIImage(named: model?.icon ?? "")
            self.pateTitleL.text = model?.title
        }
    }
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    
    
    func setupUI() {
        self.backgroundColor = .clear
        self.addSubview(self.coverImageView)
        self.coverImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp_centerX)
            make.size.equalTo(CGSize.init(width: 45, height: 45))
            make.top.equalToSuperview()
        }
        
        
        self.addSubview(self.pateTitleL)
        self.pateTitleL.snp.makeConstraints { (make) in
            make.top.equalTo(self.coverImageView.snp_bottom).offset(5)
            make.left.equalTo(self.snp_left)
            make.right.equalTo(self.snp_right)
            make.bottom.equalTo(self.snp_bottom)
        }
        
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    ///MARK: 懒加载
    
    private lazy var pateTitleL: UILabel = {
        let titleLabel = UILabel.init()
        titleLabel.text = ""
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        return titleLabel
    }()
    
    private lazy var coverImageView: UIImageView = {
        let coverImageView = UIImageView.init()
        coverImageView.image = UIImage.init(imageLiteralResourceName: "me_ic_child_open")
        return coverImageView
    }()
    
    ///
}
