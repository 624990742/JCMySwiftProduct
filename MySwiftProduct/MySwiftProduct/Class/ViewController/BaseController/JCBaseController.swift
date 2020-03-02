//
//  ViewController.swift
//  JCMySwitfDemo
//
//  Created by jiachen on 2019/4/24.
//  Copyright © 2019年 jiachen. All rights reserved.
//

import UIKit

class JCBaseController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  
    private let dataScource = ["轮播图","demo2","demo3"]
    
    
    let baseTableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: UITableView.Style.plain)
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataScource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = (tableView.dequeueReusableCell(withIdentifier: "CELLID"))
       
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CELLID")
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
        
        switch rowIndex {
        case 0:
            
            break
        default:
            print("错误")
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "demo列表"
        baseTableView.delegate = self
        baseTableView.dataSource = self
        baseTableView.backgroundColor = UIColor.white
        self.view .addSubview(baseTableView)
        
    }

}


