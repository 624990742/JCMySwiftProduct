//
//  JCListenListCell.swift
//  MySwiftProduct
//
//  Created by 未思语 on 2020/3/19.
//  Copyright © 2020 jiachen. All rights reserved.
//  列表cell 数据

import UIKit
import JXMarqueeView
import Kingfisher


class JCListenListCell: UITableViewCell {
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //重写init方法
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.`default`, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    //创建方法
    func setUpUI()  {
        self.contentView.addSubview(self.picView)
        self.picView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
        self.picView .addSubview(self.title)
        self.title.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(20)
            make.width.equalTo(150)
            make.height.equalTo(30)
            
        }
        self.picView .addSubview(self.playBtn)
        self.playBtn.snp.makeConstraints { (make) in
            make.bottom.right.equalToSuperview().offset(-15)
            make.width.height.equalTo(45)
        }
        
    }
    //懒加载控件都是闭包类型的
    //背景图
    private lazy var picView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
        
    }()
    //标题
    private lazy var title : UILabel = {
        let title : UILabel = UILabel()
        title.font = UIFont.systemFont(ofSize: 25)
        title.textColor = UIColor.white
        return title
        
        
    }()
//    //文字跑马灯
//    private let marqueeView = JXMarqueeView()
//    marqueeView.contentMargin = 10
//    marqueeView.marqueeType = .reverse
//    self.picView.addSubview(marqueeView)
//    marqueeView.snp.makeConstraints { (make) in
//        make.left.equalTo(self.titleLabel)
//        make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
//        make.height.equalTo(25)
//        make.left.equalTo(self.titleLabel)
//        make.right.equalToSuperview().offset(-70)
//    }
    private lazy var playBtn : UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setImage(UIImage.init(named: "whitePlay"), for: UIControl.State.normal)
    
        return button
    }()
    
    //控制数据
    //属性监听器
    var channelResult:ChannelResultsModel? {
        didSet {
            //可选链
            guard let model = channelResult else {
                return
            }
            self.picView.kf.setImage(with: URL(string: model.bigCover!))
            self.title.text = model.channelName
            
        }
    }
    //更多频道
    var channelInfoModel:ChannelResultsModel? {
        didSet {
            guard let model = channelInfoModel else {
                return
            }
            self.picView.kf.setImage(with: URL(string: model.bigCover!))
            self.title.text = model.channelName
            self.title.font = UIFont.systemFont(ofSize: 22)
        
        }
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
