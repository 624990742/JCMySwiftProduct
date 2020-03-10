//
//  JCMeViewController.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/3/9.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit

class JCMeViewController: JCBaseController {
    private  var customTableView: UITableView!
   
    private lazy var tableViewUITableView = { () -> UITableView in
        let tempTableView = UITableView.init(frame: CGRect.zero, style: UITableView.Style.plain)
        
        let customHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: JCScreeW, height: JCScreeH))
             customHeaderView.backgroundColor = .red
        tempTableView.tableHeaderView?.addSubview(customHeaderView)
        tempTableView.tableFooterView = UIView.init()
        tempTableView.delegate = self
        tempTableView.dataSource = self
        return tempTableView
    }()
    
    
    
    override func viewDidLoad() {
        self.title = "我"
      super .viewDidLoad()
        self.view.addSubview(tableViewUITableView)
      
        tableViewUITableView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: JCScreeW, height: JCScreeH))
        }
    }
    
}

extension JCMeViewController: UITableViewDelegate, UITableViewDataSource{
  
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         var customCell = tableView.dequeueReusableCell(withIdentifier: "cellID")
              if customCell == nil {
                  customCell = UITableViewCell(style: .default, reuseIdentifier: "cellID")
              }
        customCell?.textLabel?.text = "测试"
           
        return customCell!
    }
    
 
    func tableView(_ tableView: UITableView,
                          heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    return 50
    }
  

}



