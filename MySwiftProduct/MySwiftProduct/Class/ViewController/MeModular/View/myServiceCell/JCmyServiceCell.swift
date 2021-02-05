//
//  JCmyServiceCell.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/4/14.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit

let kItemMargin = 10.0//item之间的间距
var  kItemPadding = 25.0//左右内边距


protocol JCmyServiceCellDelegate:NSObjectProtocol {
    func  itemDidClick(rowIndex:NSInteger)
}


class JCmyServiceCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource{
    weak var delegate: JCmyServiceCellDelegate?
    private let JCMyServiceCollectionCellID = "JCMyServiceCollectionCellIDID"
    private var currentH:CGFloat = 0.0
    
    private var serverDataArr:[JCMyserviceDataModel]?
    var serverData:[JCMyserviceDataModel]? {
        didSet {
            self.serverDataArr = serverData
            
        }
    }
    
    
  


    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
//        self.setupUI()
        self.collectionView.reloadData()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupUI()
         
    }
    

    
    ///MARK:配置界面
     func setupUI() {
        self.backgroundColor = UIColor.clear
        self.contentView.addSubview(self.bgView)
         
        self.bgView.snp.makeConstraints { ( make ) in
            make.top.equalTo(self.contentView.snp_top).offset(15)
            make.left.equalTo(self.contentView.snp_left).offset(15)
            make.right.equalTo(self.contentView.snp_right).offset(-15)
            make.bottom.equalTo(self.contentView.snp_bottom).offset(-15)
           }

      

        
          
          self.bgView.layoutIfNeeded()
          self.bgView.layer.cornerRadius = 10.0
          self.bgView.layer.masksToBounds = true
        //需要延迟才能获取到真正的frame 0.1秒后获取frame
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
             JCDebugLog(message: "当前北京的高度:\(self.bgView.frame.size.height)")
//        })
        
                 self.bgView.addSubview(self.timeLabel)
                  self.timeLabel.snp.makeConstraints { (make) in
                      make.top.equalTo(self.bgView.snp_top).offset(15)
                      make.left.equalTo(self.bgView.snp_left).offset(15)
                      make.right.equalTo(self.bgView.snp_right).offset(-15)
                      make.height.equalTo(20)
                  }

            self.timeLabel.layoutIfNeeded()
        
        let collectionViewH = JC_SCREEN_WIDTH - (self.timeLabel.frame.size.height + 15)
        
            self.bgView.addSubview(self.collectionView)
            self.collectionView.snp.makeConstraints { (make) in
              make.top.equalTo(self.timeLabel.snp_bottom).offset(10)
              make.centerX.equalTo(self.bgView.snp_centerX)
              make.width.equalTo(self.bgView.frame.size.width)
              make.height.equalTo(collectionViewH)
            }
        
    }
    
    
  
    
  
 ///MARK:UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.serverDataArr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:JCMyServiceCollectionCell = collectionView .dequeueReusableCell(withReuseIdentifier: JCMyServiceCollectionCellID, for: indexPath) as! JCMyServiceCollectionCell
        cell.serviceDataModel = self.serverDataArr?[indexPath.row]
    
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.itemDidClick(rowIndex: indexPath.row)
    }
    
    
    ///MARK: 懒加载
    
    
    private var bgView:UIView = {
        let bgView = UIView()

        bgView.backgroundColor = .white
        return bgView
    }()
    
    
    
          private var timeLabel:UILabel = {
              let label = UILabel()
              label.font = UIFont.systemFont(ofSize: 15)
              label.textColor = UIColor.black
              label.text = "我的服务"
              return label
          }()
          
      lazy var collectionView:UICollectionView = {

          let layut = UICollectionViewFlowLayout.init()
        
//         let collectviewY = self.timeLabel.frame.maxY
//         let collectionW = JC_SCREEN_WIDTH - 30
//         let collectionH = self.currentH - collectviewY
//         let collectRect = CGRect(x: 0, y: collectviewY, width: collectionW, height: collectionH)

        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layut)
          collectionView.backgroundColor = .clear
          collectionView.delegate = self
          collectionView.dataSource = self
          collectionView.register(JCMyServiceCollectionCell.self, forCellWithReuseIdentifier: JCMyServiceCollectionCellID)

      let viewW =  JC_SCREEN_WIDTH - 30
      let totalMargin:CGFloat = CGFloat(2*kItemMargin + 3*kItemPadding)
      let itemW = (viewW - totalMargin) / 4
      let itemH = 65.0
       layut.itemSize = CGSize(width: itemH, height: itemH)
        layut.minimumLineSpacing = CGFloat(kItemPadding)
        layut.sectionInset = UIEdgeInsets(top: 0, left: CGFloat(kItemMargin), bottom: 0, right: CGFloat(kItemMargin))
          return collectionView
      }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
