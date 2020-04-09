//
//  JCSubscibeCell.swift
//  MySwiftProduct
//
//  Created by 未思语 on 2020/3/30.
//  Copyright © 2020 jiachen. All rights reserved.
//
//swift中的cell中必须要是实现以后内容
/**
 required init?(coder: NSCoder) {
     super.init(coder: coder)
 }
 */
//如果是oc 只有尊循了NSCoder 协议后才要实现归档反归档方法

import UIKit
import SnapKit  //swift中的布局三方

class JCSubscibeCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //在cell中控件 都是类似这种private var 变量名 = {}()
    //cell中创建控件
    private var picView:UIImageView = {
        let imageview = UIImageView()
        imageview.layer.cornerRadius = 3
        imageview.layer.masksToBounds = true
        return imageview
    }()
    private var titleLabel:UILabel = {
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    private var subtitleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    private var timeLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.gray
        return label
    }()
    
    private var playBtn:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setTitle("...", for: UIControl.State.normal)
        button.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
        
    }()
    
    //重写创建方法
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        //创建绘制方法
        setupUI()
    }
    
    
    //声明方法
    func setupUI()  {
        self.addSubview(self.picView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.subtitleLabel)
        self.addSubview(self.timeLabel)
        self.addSubview(self.playBtn)
        self.picView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-15)
            make.width.equalTo(70)
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.picView)
            make.left.equalTo(self.picView.snp.right).offset(10)
            make.height.equalTo(20)
            make.right.equalToSuperview()
        }
        self.subtitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            make.left.right.height.equalTo(self.titleLabel)
        }
        self.timeLabel.snp.makeConstraints { (make) in
            make.left.height.right.equalTo(self.titleLabel)
            make.bottom.equalTo(self.picView)
        }
        self.playBtn.snp.makeConstraints { (make) in
            make.right.bottom.equalToSuperview().offset(-20)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
    }
    
    //给albumResults添加属性观察器
    //将model 赋值给cell model 属于计算属性 willset didset 就是属性观察器
    var albumResults:AlbumResultsModel? {
        didSet {
            //guard 类似条件选择器 只有guard条件满足之后才可以通过，否则直接返回
            guard let model = albumResults else {
                return
            }
            self.picView.kf.setImage(with: URL(string: model.albumCover!))
            self.titleLabel.text = model.albumTitle
            self.subtitleLabel.text = model.trackTitle
            //将NSInterger转化为Double
        
            self.timeLabel.text = updateTimeToCurrentTime(timeStamp: Double(model.lastUpdateAt))
        }
    
    }
    
    //在cell中自定义方法
    func updateTimeToCurrentTime(timeStamp:Double) -> String {
        //1.当前时间距离1970的秒数
        let currentTime = Date().timeIntervalSince1970
        //2.根据传进来的时间戳转化为那个时间点距离1970的秒数
        let timeSta:TimeInterval = TimeInterval(timeStamp / 1000)
        //3.计算时间差
        let reduceTime:TimeInterval = currentTime - timeSta
        //4.时间差<60s
        if reduceTime < 60 {
            return "刚刚"
        }
        //5.计算相差分钟数
        let mins = Int(reduceTime / 60)
        if mins < 60 {
            return "\(mins)分钟前"
        }
        //6.计算相差小时数 (将浮点数改为整数)
        let hours = Int(reduceTime / 3600)
        if hours < 60 {
            return "\(hours)小时前"
        }
        //7.计算相差天数
        let days = Int(reduceTime / 3600 / 24)
        if days < 30 {
            return "\(days)天前"
        }
        
        //将timesta 直接转化为时间
        //直接用Date 不需要用as 将NSDate 转化为Date
//        let datess = Date(timeIntervalSince1970: timeSta)
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
//        let dateString = formatter.string(from: datess)
        
        
        //用NSDate 需要用as 将NSDate 转化为Date  这里注意as as！ as？ 表示的意义
        let datess = NSDate(timeIntervalSince1970: timeSta)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        let dateString = formatter.string(from: datess as Date)
        
        
        return dateString
        
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
