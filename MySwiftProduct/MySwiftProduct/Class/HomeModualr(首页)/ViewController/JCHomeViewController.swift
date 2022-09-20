//
//  JCHomeViewController.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/3/9.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit

class JCHomeViewController: JCBaseController,UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate{
         
        var items:[String] = ["解析中过滤空字符串测试",
                              "菜单格子测试",
                              "Realm数据库测试",
                              "富文本加载html测试",
                              "web加载html测试",
                               "xib创建的collectionView"]
         
        var tableView:UITableView?
         
        override func loadView() {
            super.loadView()
        }
         
        override func viewDidLoad() {
            super.viewDidLoad()
             setupUI()
        }
         
    
    //Mark: - UI
    func setupUI(){
        
        let header = JCHomeHeaderView.loadFromNib()
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "白/夜切换",
            style: UIBarButtonItem.Style.plain,
            target: self, action: #selector(refreshDarkStyle)
        )
        //创建表视图
        self.tableView = UITableView(frame: self.view.frame, style:.plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self,                    forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
    }
   
    
 

    //Mark: -  UITableViewDelegate, UITableViewDataSource
        //在本例中，只有一个分区
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1;
        }
         
        //返回表格行数（也就是返回控件数）
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.items.count
        }
         
        //创建各单元显示内容(创建参数indexPath指定的单元）
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
            -> UITableViewCell {
            //为了提供表格显示性能，已创建完成的单元需重复使用
            let identify:String = "SwiftCell"
            //同一形式的单元格重复使用，在声明时已注册
            let cell = tableView.dequeueReusableCell(withIdentifier: identify,
                                                         for: indexPath)
            cell.textLabel?.text = self.items[indexPath.row]
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      
        
        switch indexPath.row {
        
        case 0:
            self.navigationController?.pushViewController(JCFlowLayoutMenuViewController.init(), animated: true)
            
        case 1:
          
            
         self.navigationController?.pushViewController(JCFlowLayoutMenuViewController.init(), animated: true)
        
        case 2:
            
            self.navigationController?.pushViewController(JCRealmViewController.init(), animated: true)
            
        case 3:
//            self.navigationController?.pushViewController(JCTextViewTestController.init(), animated: true)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            // Push
            let viewController = storyboard.instantiateViewController(withIdentifier: "JCTextViewTestController")
            self.navigationController?.pushViewController(viewController, animated: true)

        case 4:
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            // Push
            let viewController = storyboard.instantiateViewController(withIdentifier: "JCTexWebViewTestController")
            self.navigationController?.pushViewController(viewController, animated: true)

        case 5:
            
            let testVC = JCTestViewController(nibName: "JCTestViewController", bundle: nil)
            self.navigationController?.pushViewController(testVC, animated: true)
        default:
            print("测试数据")
        }
        
        
        
    }

}
     
 

