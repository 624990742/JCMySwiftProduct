//
//  JCListenChannelViewController.swift
//  MySwiftProduct
//
//  Created by 未思语 on 2020/3/20.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit
import LTScrollView


class JCListenChannelViewController: UIViewController,LTTableViewProtocal,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableview)
        glt_scrollView = tableview
        loadData()

        // Do any additional setup after loading the view.
    }
    private lazy var footerView:JCListenFooterView = {
        let view = JCListenFooterView.init(frame: CGRect(x: 0, y: 0, width: JC_SCREEN_WIDTH, height: 120))
        view.delegate = self
        view.JSListenFooterTitle = "+ 添加频道"
        return view
    }()
    private var ListenchannelCellID = "ListenchannelCellID"
    private lazy var tableview : UITableView = {
        let tableview = UITableView.init(frame: CGRect(x: 0, y: 5, width: JC_SCREEN_WIDTH, height: JC_SCREEN_HEIGHT-64), style: UITableView.Style.plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(JCListenListCell.self, forCellReuseIdentifier: ListenchannelCellID)
//        tableview.separatorStyle = UITableViewCellSeparatorStyle.none
        tableview.tableFooterView = self.footerView
        tableview.backgroundColor = UIColor.init(r: 240, g: 241, b: 244)
        return tableview
        
    }()
    
    lazy var viewModel:JCListenChannelViewModel = {
        return JCListenChannelViewModel()
    }()
    
    //加载数据
    func loadData()  {
        viewModel.updateBlock = {[unowned self] in
            //更新数据表
            self.tableview.reloadData()
        }
        viewModel.refreshDataSource()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection(section: section)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell:JCListenListCell = tableView.dequeueReusableCell(withIdentifier: ListenchannelCellID, for: indexPath) as! JCListenListCell
        myCell.selectionStyle = UITableViewCell.SelectionStyle.none
        myCell.backgroundColor = UIColor.white
        myCell.channelResult = viewModel.channelResults?[indexPath.row]
        return myCell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("一键听惦记的是第\(indexPath.row)个")
    }

    

}
    
//点击+号 为底部添加单击事件
extension JCListenChannelViewController : JCListenFooterViewDelegate {
    func listenFooterAddBtnClick() {
        let vc = JCListenChannelViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
