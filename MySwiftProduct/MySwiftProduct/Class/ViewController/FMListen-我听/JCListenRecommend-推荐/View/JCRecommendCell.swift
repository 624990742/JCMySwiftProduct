//
//  JCRecommendCell.swift
//  MySwiftProduct
//
//  Created by 未思语 on 2020/4/9.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit

class JCRecommendCell: UITableViewCell {

    //声明控件
    //图片
    private  var picView : UIImageView = {
        let imageview = UIImageView()
        imageview.layer.cornerRadius = 3
        imageview.layer.masksToBounds = true
        return imageview
    }()
    //标题
    private  var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
        
    }()
    //副标题
    private var subLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    //播放量
    private var playLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.gray
        return label
    }()
    //播放数量图片
    private var playImg : UIImageView  = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "playcount")
        return imageview
    }()
    //播放集数
    private var countLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.gray
        return label
    }()
    //播放集数图片
    private var countImg : UIImageView  = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "track")
        return imageview
    }()
    //订阅号
    private var recommendBtn : UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(named:"recxx_subscribe_56x28"), for: UIControl.State.normal)
//        button.addTarget(self, action: #selector(clickMethod), for: UIControl.Event.touchUpInside)

        return button
    }()
    
    
    //自定义方法
    func clickMethod()  {
        print("点击订阅button")
    }
    //自定义绘制方法
    func setupUI()  {
        self.addSubview(self.picView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.subLabel)
        self.addSubview(self.playImg)
        self.addSubview(self.playLabel)
        self.addSubview(self.countImg)
        self.addSubview(self.countLabel)
        self.addSubview(self.recommendBtn)
        self.picView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset((-15))
            make.width.equalTo(70)
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.picView)
            make.left.equalTo(self.picView.snp_right).offset(10)
            make.height.equalTo(20)
            make.right.equalToSuperview()
        }
        self.subLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            make.left.height.right.equalTo(self.titleLabel)
        }
        self.playImg.snp.makeConstraints { (make) in
            make.left.equalTo(self.subLabel)
            make.bottom.equalTo(self.picView)
            make.width.height.equalTo(17)
        }
        self.playLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.playImg.snp.right).offset(5)
            make.bottom.equalTo(self.playImg)
            make.width.equalTo(60)
        }
        self.countImg.snp.makeConstraints { (make) in
            make.left.equalTo(self.playLabel.snp.right).offset(5)
            make.bottom.equalTo(self.playLabel)
            make.width.height.equalTo(20)
        }
        
        self.countLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.countImg.snp.right).offset(5)
            make.bottom.equalTo(self.countImg)
            make.width.equalTo(80)
        }
        self.recommendBtn.snp.makeConstraints { (make) in
            make.right.bottom.equalToSuperview().offset(-20)
            make.width.equalTo(60)
            make.height.equalTo(24)
        }
    }
    
    //重写方法
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //属性观察器 (存储数据)
    var albums : albumsModel?  {
        didSet {
            guard let model = albums else {
                return
            }
            self.picView.kf.setImage(with: URL(string: model.coverMiddle!))
            self.titleLabel.text = model.title
            self.subLabel.text = model.recReason
            self.countLabel.text = "\(model.tracks)集"
            var string:String?
            if model.playsCounts > 100000000 {
                string = String(format: "%.1f亿", Double(model.playsCounts) / 100000000)
            } else if model.playsCounts > 10000{
                string = String(format: "%.1f万", Double(model.playsCounts) / 10000)
            } else {
                string = "\(model.playsCounts)"
            }
            self.playLabel.text = string
            
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
