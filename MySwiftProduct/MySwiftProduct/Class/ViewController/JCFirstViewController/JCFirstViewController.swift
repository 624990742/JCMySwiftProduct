//
//  JCFirstViewController.swift
//  JCMySwitfDemo
//
//  Created by jiachen on 2019/8/14.
//  Copyright © 2019 jiachen. All rights reserved.
//

import UIKit

class JCFirstViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate {
    

    private let  dataScource = ["轮播图","UITableView","demo3"]
    
    
       override func viewDidLoad() {
           super.viewDidLoad()
           self .setupUI()
       }
       
    
    func setupUI() {
           self.title = "首页"
           baseTableView.delegate = self
           baseTableView.dataSource = self
           baseTableView.backgroundColor = UIColor.white
           self.view .addSubview(baseTableView)
       }
       
    
    
    
    
    
    
    let baseTableView = UITableView(frame: CGRect.init(x: 0, y: 0, width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: UITableView.Style.plain)
    
    
//    #pramar mark -    UITableViewDataSource, UITabBarDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataScource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        var cell = (tableView.dequeueReusableCell(withIdentifier: "cellID"))
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cellID")
        }
        cell?.textLabel?.text = self.dataScource[indexPath.row]
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 55.0
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let rowIndex = indexPath.row
        
        
        if rowIndex == 0 {
            let  baseVC = JCSwiftUIViewController.init()
            baseVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(baseVC, animated: true)
        }

    }
    
    
    //头部视图
    class TableHeaderView: UIView {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
        }
        
        required init?(coder aDecoder: NSCoder) {
              super.init(coder: aDecoder)
              setupView()
          }
        func setupView() {
            
            
        }
        
        
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
