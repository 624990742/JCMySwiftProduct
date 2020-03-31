//
//  JCListenSubscibeViewController.swift
//  MySwiftProduct
//
//  Created by 未思语 on 2020/3/30.
//  Copyright © 2020 jiachen. All rights reserved.
//  订阅

import UIKit

class JCListenSubscibeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //tableviewdelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    private  let cellD = "cellID"
    private lazy var tableview : UITableView = {
        let tableview = UITableView.init(frame: CGRect(x: 0, y: 0, width: JCScreenWidth, height: JCScreenHeight-JCNaviBarHeight), style: UITableView.Style.plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(JCSubscibeCell.self, forCellReuseIdentifier: cellD)
        tableview.backgroundColor = UIColor.white
        return tableview
        
    }()
    private lazy var viewmodel : JCSubscibeViewModel = {
        return JCSubscibeViewModel()
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableview)
        glt_scrollView = tableview
        //#available 用于提交判断 系统版本号
        //@available 用于函数或者方法中判断系统版本号
        if #available(iOS 11.0, *) {
            tableview.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        loadData()
    }
    
    //方法
    func loadData()  {
        self.viewmodel.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
