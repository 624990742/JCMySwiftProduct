//
//  JCListenFooterView.swift
//  MySwiftProduct
//
//  Created by 未思语 on 2020/3/19.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit
//代理
protocol JCListenFooterViewDelegate:NSObjectProtocol {
    func listenFooterAddBtnClick()
    
}
class JCListenFooterView: UIView {
    //声明类的代理对象
    weak var delegate : JCListenFooterViewDelegate?
    
    //重写构造器方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpUI()
        
    }
    func setUpUI() {
        self.addSubview(self.addBtn)
        self.addBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(40)
            make.width.equalTo(120)
            make.centerX.equalToSuperview()
        }
        self.addBtn.layer.masksToBounds = true //swift 中的BOOl 类型只有true 和 false两种
        self.addBtn.layer.cornerRadius = 5
    }
    //button闭包
    private var addBtn : UIButton = {
        let button : UIButton = UIButton.init(type: UIButton.ButtonType.custom)//enum 枚举类型数据获取
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.backgroundColor = UIColor.white
        button.addTarget(self, action: #selector(addBtnClick), for: UIControl.Event.touchUpInside)
        
        return button;

        
    }()
    
    var JSListenFooterTitle:String? {//给JSListenFooterTitle  属性添加属性监听器
        didSet {
            addBtn.setTitle(JSListenFooterTitle, for: UIControl.State.normal)
        }
    }
    
    @objc func addBtnClick() {
        delegate?.listenFooterAddBtnClick()
        
    }

    //归档反归档
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    

}
