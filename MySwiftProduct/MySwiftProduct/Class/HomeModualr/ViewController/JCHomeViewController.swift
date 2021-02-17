//
//  JCHomeViewController.swift
//  MySwiftProduct
//
//  Created by jiachen on 2020/3/9.
//  Copyright © 2020 jiachen. All rights reserved.
//

import UIKit
class JCHomeViewController: JCHomeBaseViewController{
    
   
  
    let JCHomeHeaderID = "JCHomeHeaderViewID"
    let JCHomeFooterID = "JCHomeFooterViewID"
    let JCHomeHeaderCellID = "JCHomeHeaderCellID"
    // MARK: 懒加载
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        let collection = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collection.delegate   = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.white
        // MARK -注册头视图和尾视图
        collection.register(JCHomeHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,withReuseIdentifier: JCHomeHeaderID)
        
        collection.register(JCHomeFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: JCHomeFooterID)
        // MARK -注册不同分区cell
        
        collection.register(JCHomeHeaderCell.self, forCellWithReuseIdentifier: JCHomeHeaderCellID)
        
        return collection
    }()
    
    
    // MARK: 声明周期
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    // MARK: 配置界面
    func setupUI() {
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
    
    // MARK: 加载数据
    func loadData(){
     
    }
    
}


extension JCHomeViewController: UICollectionViewDelegate,UICollectionViewDataSource{
  
    
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
     return 10
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell:JCHomeHeaderCell = collectionView.dequeueReusableCell(withReuseIdentifier: JCHomeHeaderCellID, for: indexPath) as! JCHomeHeaderCell
    
        
        return cell
    }

 
    
}

