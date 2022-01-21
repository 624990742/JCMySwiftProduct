//
//  JCListenSubscibeViewController.swift
//  MySwiftProduct
//
//  Created by 未思语 on 2020/3/30.
//  Copyright © 2020 jiachen. All rights reserved.
//  订阅

import UIKit

class JCListenSubscibeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellD, for: indexPath) as! JCSubscibeCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        let model = self.viewmodel.resultArr![indexPath.row]
        cell.albumResults = model
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewmodel.numberOfRowsInSection(section: section)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    private  let cellD = "cellID"
    private lazy var tableview : UITableView = {
        let tableview = UITableView.init(frame: CGRect(x: 0, y: 0, width: JC_SCREEN_WIDTH, height: JC_SCREEN_HEIGHT-JC_NavBarHeight), style: UITableView.Style.plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(JCSubscibeCell.self, forCellReuseIdentifier: cellD)
        tableview.tableFooterView = self.footerView
        tableview.backgroundColor = UIColor.init(r: 240, g: 241, b: 244)
        return tableview
        
    }()
    private lazy var footerView:JCListenFooterView = {
        let view = JCListenFooterView.init(frame: CGRect(x: 0, y: 0, width: JC_SCREEN_WIDTH, height: 120))
        view.delegate = self
        view.JSListenFooterTitle = "+ 添加频道"
        return view
    }()
    //延迟存储属性
    private lazy var viewmodel : JCSubscibeViewModel = {
        return JCSubscibeViewModel()
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableview)
        glt_scrollView = self.tableview
        //#available 用于提交判断 系统版本号
        //@available 用于函数或者方法中判断系统版本号
        if #available(iOS 11.0, *) {
            tableview.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
         print("我是订阅号页面的子view \(self.view.subviews)")
        
        loadData()
    }
    
    
    func loadData()  {
        //定义属性
        viewmodel.updateBlock = {[unowned self] in
            self.tableview.reloadData()
        }
        viewmodel.refreshDataSource()
    }
}
//点击+号 为底部添加单击事件
extension JCListenSubscibeViewController : JCListenFooterViewDelegate {
    func listenFooterAddBtnClick() {
        let vc = JCListenChannelViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
