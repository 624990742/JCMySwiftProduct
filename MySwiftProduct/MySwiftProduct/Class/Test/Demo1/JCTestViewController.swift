//
//  JCTestViewController.swift
//  MySwiftProduct
//
//  Created by jcmac on 2022/7/24.
//  Copyright © 2022 jiachen. All rights reserved.
//

class JCTestModel: Equatable {
    static func == (lhs: JCTestModel, rhs: JCTestModel) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
    var  name: String = ""
    var  age: Int = 0
    init(name: String,age: Int) {
        self.name = name
        self.age = age
    }
}




import UIKit

class JCTestViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionFlowLayout: UICollectionViewFlowLayout!
    var itemCellSize: CGSize!
    let testeTotalNum = 12
    let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.isPagingEnabled = false
        
        
//        self.collectionFlowLayout.scrollDirection = .vertical
        self.collectionView.register(UINib.init(nibName: "JCTestCell", bundle: nil), forCellWithReuseIdentifier: JCTestCell.kTestCellID)
        
        let verticalRows = testeTotalNum % 3 ///竖着的行数间隙
        let margin = 20.0
        let space  = 12.0
        let itemW  = (SCREEN_WIDTH - margin * 2 - space * 2) / 3.0
        let itemH  = (SCREEN_HEIGHT - (margin * CGFloat(verticalRows) + 64)) / 3.0
        collectionView.contentInset = UIEdgeInsets(top: 0, left: margin, bottom: 0,right: margin)
        itemCellSize = CGSize(width: itemW, height: itemH)
//        self.collectionFlowLayout.itemSize = itemCellSize
//        self.collectionFlowLayout.minimumLineSpacing = space
//        self.collectionFlowLayout.minimumInteritemSpacing = space
        self.collectionView.reloadData()
        
        testDemo1()
    }
    // MARK: - 数组去重测试
    func testDemo1(){
        let t1 = JCTestModel.init(name: "1111",age: 10)
        let t2 = JCTestModel.init(name: "1111",age: 10)
        let r1 = JCTestModel.init(name: "2222",age: 20)
        let r2 = JCTestModel.init(name: "2222",age: 20)
        let testArr: [JCTestModel] = [t1,r2,t2,r1]
        let arr = testArr.filterDuplicatesElement({$0})
    
        arr.forEach { model in
            JCDebugLog(message: "测试数据--\(model.name)")
        }
        
        
    }
    
    
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 3
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return testeTotalNum
    }
    
    
 
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JCTestCell.kTestCellID, for: indexPath) as! JCTestCell
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return itemCellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
    }
    
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return  12.0
    }

 
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
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
