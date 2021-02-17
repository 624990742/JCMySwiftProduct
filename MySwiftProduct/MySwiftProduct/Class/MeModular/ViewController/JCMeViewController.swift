//
//  JCMeViewController.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/3/9.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit
import HandyJSON

let kJCCreativeCenterCellID = "JCCreativeCenterCellID"
let kJCmyServiceCellID = "JCmyServiceCellID"

class JCMeViewController: JCBaseController {

    
    private  var customTableView: UITableView!
    private  var serviceArr:[JCMyserviceDataModel]?
      /// Mark: 懒加载
    private lazy var tableViewUITableView = { () -> UITableView in
        let tempTableView = UITableView.init(frame: CGRect(x: 0.0, y: CGFloat(JC_NavBarHeight), width: CGFloat(JC_SCREEN_WIDTH), height: CGFloat(JC_SCREEN_HEIGHT) - CGFloat(JC_TABBARHEIGHT)), style: UITableView.Style.plain)
        let customHeaderView = JCMeHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: JCScreeW, height: 150.5 * JC_RATIO))
        
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
        tempTableView.backgroundColor = UIColor.clear
        tempTableView.register(UINib.init(nibName: "JCCreativeCenterCell", bundle: nil), forCellReuseIdentifier: kJCCreativeCenterCellID)
        tempTableView.register(JCmyServiceCell.self, forCellReuseIdentifier: kJCmyServiceCellID)
      
        return tempTableView
    }()
    
    
    

///MARK: 生命周期
    override func viewDidLoad() {
        self.title = "我"
      super .viewDidLoad()
        self.setupUI()
        self.loadData()
        
    
    }
    
    
    
    ///MARK: 处理数据
    func loadData(){
        let iconPath : String? = Bundle.main.path(forResource: "myserviceData", ofType: "json")
               //2.获取文件内容
        let jsonString: String?  = try! String.init(contentsOfFile: iconPath!)
        
        let services = [JCMyserviceDataModel].deserialize(from: jsonString)
        self.serviceArr = services as? [JCMyserviceDataModel]
        
        
//        if let services = [JCMyserviceDataModel].deserialize(from: jsonString) {
//            services.forEach { (serverModel) in
//                debugPrint("serverModel?.title==>\(String(describing: serverModel?.title))")
//                 self.tableViewUITableView.reloadData()
//                debugPrint("Thread.current==>\(Thread.current)")
//            }
        }

    
        /// Mark: 配置界面
        func setupUI() {
            //四周均不延伸
    //     self.edgesForExtendedLayout = []
            self.view.backgroundColor = UIColor(r: 247, g: 247, b: 247)
            self.tableViewUITableView.separatorStyle = UITableViewCell.SeparatorStyle.none
//            self.tableViewUITableView.separatorColor = .white
            self.view.addSubview(self.tableViewUITableView)
            
        }
    }
    
    
extension JCMeViewController:JCmyServiceCellDelegate {
    func itemDidClick(rowIndex: NSInteger) {
      JCDebugLog(message: "da123")
    }

}







/// Mark: UITableViewDelegate  UITableViewDataSource
extension JCMeViewController: UITableViewDelegate, UITableViewDataSource{
  
    
    func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
   
    
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.row == 0 {
            var customCell = tableView.dequeueReusableCell(withIdentifier: kJCCreativeCenterCellID)
            if customCell == nil {
              customCell = JCCreativeCenterCell(style: .default, reuseIdentifier: kJCCreativeCenterCellID)
                 }
                customCell?.backgroundColor = .clear
            return customCell!
            
        }else{
            
         let cell:JCmyServiceCell = tableView.dequeueReusableCell(withIdentifier: kJCmyServiceCellID, for: indexPath) as! JCmyServiceCell
             cell.delegate = self
             cell.selectionStyle = .none
             cell.backgroundColor = .clear
             cell.serverData = self.serviceArr
   
           return cell
        }
        
    }
    
 
    func tableView(_ tableView: UITableView,heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
          return 128
        }else{
         return 200
        }
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



