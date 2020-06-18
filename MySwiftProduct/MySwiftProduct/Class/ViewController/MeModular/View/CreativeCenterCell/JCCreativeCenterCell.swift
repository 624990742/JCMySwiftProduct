//
//  JCCreativeCenterCell.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/3/13.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit

class JCCreativeCenterCell: UITableViewCell {
    
    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var bottomImageView: UIImageView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var soundRecordBtn: UIButton!
    @IBOutlet weak var liveBroadcastBtn: UIButton!
    @IBOutlet weak var worksBtn: UIButton!
    @IBOutlet weak var creationBtn: UIButton!
    
    
    
    //录音
    @IBAction func soundRecordAction(_ sender: UIButton) {
        
        
    }
    
    
    //我的直播
    @IBAction func liveBroadcastBtnAction(_ sender: Any) {
        
        
    }
    
    //我的作品
    @IBAction func worksBtnAction(_ sender: Any) {
        
        
        
    }
    
    
    //创作中心
    @IBAction func creationBtnAction(_ sender: UIButton) {
        
        
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        for   in self.subviews{
//            
//        }
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
        self.selectionStyle = .none
         self.setupShaowStyle()
          self.topImageView.layer.cornerRadius = 10
          self.topImageView.layer.masksToBounds = true
          self.bottomImageView.layer.cornerRadius = 10
          self.bottomImageView.layer.masksToBounds = true
//          self.BackView.layer.cornerRadius = 10
//          self.BackView.layer.masksToBounds = true
         self.creationBtn.titleLabel?.textAlignment = .center
         self.soundRecordBtn.titleLabel?.textAlignment = .center
         self.liveBroadcastBtn.titleLabel?.textAlignment = .center
         self.worksBtn.titleLabel?.textAlignment = .center
        
    }
    
    
    
   public func setupShaowStyle() {
    self.BackView.layoutIfNeeded()
      
       self.backgroundColor = UIColor.clear
        let  tempLayer  = self.BackView.layer
        tempLayer.cornerRadius = 10.0
        tempLayer.borderColor = UIColor.clear.cgColor
        tempLayer.masksToBounds  = true
//        tempLayer.shadowColor = UIColor.RGBA(0, g: 0, b: 0, a: 1).cgColor
//        tempLayer.shadowOffset = CGSize.init(width: 0, height: 0)
//        tempLayer.shadowRadius = 10.0
//        tempLayer.shadowOpacity = 0.05
//        tempLayer.masksToBounds = false
//    tempLayer.shadowPath = UIBezierPath(roundedRect: self.BackView.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
