//
//  JCRecommendViewController.swift
//  MySwiftProduct
//
//  Created by 未思语 on 2020/4/9.
//  Copyright © 2020 jiachen. All rights reserved.
//  推荐页

import UIKit

class JCRecommendViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableview)
        glt_scrollView = self.tableview
        loadData()
        

        // Do any additional setup after loading the view.
    }
    //声明tableview
    private var cellID  = "recommendCellOD"
    private lazy var tableview : UITableView = {
        let tableview = UITableView.init(frame: CGRect(x: 0, y: 0, width:JC_SCREEN_WIDTH , height: JC_SCREEN_HEIGHT-JC_NavBarHeight-56), style: UITableView.Style.plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = UIColor.white
        tableview.register(JCRecommendCell.self, forCellReuseIdentifier: cellID)
        return tableview
    }()
    
    //声明viewmodel
    private lazy var viewmodel:JCRecommendViewModel = {
        return JCRecommendViewModel()
    }()
    
    func loadData()  {
        self.viewmodel.updateBlock = {[unowned self] in
            self.tableview.reloadData()
        }
        self.viewmodel.refreshDataSource()
    }
    

   
}
//通过extension 实现uitableviewdelegate
extension JCRecommendViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! JCRecommendCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none;
        cell.backgroundColor = UIColor.white
        cell.albums = self.viewmodel.albums?[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewmodel.numOfSection(section: section)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
