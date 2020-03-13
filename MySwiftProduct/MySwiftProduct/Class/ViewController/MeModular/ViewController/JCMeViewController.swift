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
    
    
    private lazy var tableViewUITableView = { () -> UITableView in
        let tempTableView = UITableView.init(frame: CGRect(x: 0.0, y: CGFloat(JC_NavBarHeight), width: CGFloat(JC_ScreenWidth), height: CGFloat(JC_ScreenHeight)), style: UITableView.Style.plain)
        let customHeaderView = JCMeHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: JCScreeW, height: 170))
        customHeaderView.backgroundColor = .clear
        tempTableView.tableHeaderView = customHeaderView
        tempTableView.tableFooterView = UIView.init()
        tempTableView.delegate = self
        tempTableView.dataSource = self
        tempTableView.estimatedRowHeight = 44
        tempTableView.rowHeight = 44
        tempTableView.register(UINib.init(nibName: "JCCreativeCenterCell", bundle: nil), forCellReuseIdentifier: kJCCreativeCenterCellID)
        return tempTableView
    }()
    
    
    
    override func viewDidLoad() {
        self.title = "我"
      super .viewDidLoad()
        self.setupUI()
    }
    
    
    /// Mark: 配置界面
    func setupUI() {
        self.view.backgroundColor = .gray
      self.view.addSubview(tableViewUITableView)
    }
    
}





/// Mark:




/// Mark: UITableViewDelegate  UITableViewDataSource
extension JCMeViewController: UITableViewDelegate, UITableViewDataSource{
  
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         var customCell = tableView.dequeueReusableCell(withIdentifier: kJCCreativeCenterCellID)
              if customCell == nil {
                  customCell = JCCreativeCenterCell(style: .default, reuseIdentifier: kJCCreativeCenterCellID)
              }
       
        return customCell!
    }
    
 
    func tableView(_ tableView: UITableView,heightForRowAt indexPath: IndexPath) -> CGFloat {
        
     return 150
    }
  

}



