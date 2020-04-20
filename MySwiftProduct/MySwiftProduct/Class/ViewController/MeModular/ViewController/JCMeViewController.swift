//
//  JCMeViewController.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/3/9.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit

let kJCCreativeCenterCellID = "JCCreativeCenterCellID"


class JCMeViewController: JCBaseController {
    private  var customTableView: UITableView!
       
      /// Mark: 懒加载
    private lazy var tableViewUITableView = { () -> UITableView in
        let tempTableView = UITableView.init(frame: CGRect(x: 0.0, y: CGFloat(JC_NavBarHeight), width: CGFloat(JC_SCREEN_WIDTH), height: CGFloat(JC_SCREEN_HEIGHT) - CGFloat(JC_TABBARHEIGHT)), style: UITableView.Style.plain)
        let customHeaderView = JCMeHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: JCScreeW, height: 150.5 * JC_RATIO))
        customHeaderView.backgroundColor = UIColor(hexString: "#f1f1f1")
        tempTableView.tableHeaderView = customHeaderView
        tempTableView.tableFooterView = UIView.init()
        tempTableView.delegate = self
        tempTableView.dataSource = self
        tempTableView.estimatedRowHeight = 0.0001
        tempTableView.sectionFooterHeight = 0.0001
        tempTableView.sectionHeaderHeight = 0.0001
        tempTableView.estimatedSectionHeaderHeight = 0.001
        
//        tableViewUITableView.separatorStyle = .none
//        tableViewUITableView.separatorInset = UIEdgeInsets.zero;
//        tempTableView.separatorColor = UIColor.clear
        tempTableView.backgroundColor = UIColor.white
        tempTableView.register(UINib.init(nibName: "JCCreativeCenterCell", bundle: nil), forCellReuseIdentifier: kJCCreativeCenterCellID)
      
        return tempTableView
    }()
    
    
    

///MARK: 生命周期
    override func viewDidLoad() {
        self.title = "我"
      super .viewDidLoad()
        self.loadData()
        self.setupUI()
    
    }
    
    
    
    ///MARK:
    
    func loadData(){
        let path : String? = Bundle.main.path(forResource: "myserviceData", ofType: "json")
               //2.获取文件内容
        let jsonData = NSData(contentsOfFile: path!)
        
        
        
    }
    
    
    /// Mark: 配置界面
    func setupUI() {
        //四周均不延伸
//     self.edgesForExtendedLayout = []
        self.tableViewUITableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableViewUITableView.separatorColor = .white
        self.view.addSubview(self.tableViewUITableView)
        
    }
    
}






/// Mark: UITableViewDelegate  UITableViewDataSource
extension JCMeViewController: UITableViewDelegate, UITableViewDataSource{
  
    
    func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
   
    
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        var customCell = tableView.dequeueReusableCell(withIdentifier: kJCCreativeCenterCellID)
                if customCell == nil {
                customCell = JCCreativeCenterCell(style: .default, reuseIdentifier: kJCCreativeCenterCellID)
                }
                customCell?.backgroundColor = .clear
            return customCell!
    
    }
    
 
    func tableView(_ tableView: UITableView,heightForRowAt indexPath: IndexPath) -> CGFloat {
        
     return 128
    }
  

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 10
        }
        return 0.000000000001
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let groupView  = UIView.init()
        groupView.backgroundColor = .clear
        return groupView
    }
    
   
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.000000000001
    }
    
  
    
    
    
    
    
}



