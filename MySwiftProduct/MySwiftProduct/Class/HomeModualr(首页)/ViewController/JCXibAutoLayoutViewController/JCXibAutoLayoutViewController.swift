//
//  JCXibAutoLayoutViewController.swift
//  MySwiftProduct
//
//  Created by jiachen on 2021/4/27.
//  Copyright © 2021 jiachen. All rights reserved.
//

import Foundation
import UIKit

class JCXibAutoLayoutViewController: JCBaseController , UITableViewDelegate, UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        let tab = UITableView(frame: CGRect.zero, style: .grouped)
        tab.delegate = self
        tab.dataSource = self
//        tab.emptyDataSetSource = self
//        tab.emptyDataSetDelegate = self
        tab.backgroundColor = UIColor.init(displayP3Red: 246, green: 249, blue: 252, alpha: 1)
        tab.separatorStyle = .none
        tab.estimatedRowHeight = 200
        tab.rowHeight = UITableView.automaticDimension
//        self.emptyImage = "nodata"
//        self.emptyDescription = "还没有数据呢呢!"
 
        tab.register(UINib(nibName: String(describing: JCTestTableListCell.self), bundle: nil), forCellReuseIdentifier: JCTestTableListCell.cellID)
      
        return tab
    }()
    
    
    ///MARK - lify
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.snp.makeConstraints { (make) in
            make.left.equalTo(view.safeArea.left)
            make.top.equalTo(view.safeArea.top)
            make.right.equalTo(view.safeArea.right)
            make.bottom.equalTo(view.safeArea.bottom)
        }
        
    }
    
    
    
    
}


extension  JCXibAutoLayoutViewController {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.0000001
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 0.0000001
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//
//    }
    

   
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: JCTestTableListCell.cellID, for: indexPath) as! JCTestTableListCell
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    
}
