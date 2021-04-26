//
//  JCFlowLayoutMenuViewController.swift
//  MySwiftProduct
//
//  Created by jiachen on 2021/4/26.
//  Copyright © 2021 jiachen. All rights reserved.
//

import Foundation
import UIKit
import HandyJSON

class BasicTypes: HandyJSON {
    var int: Int = 2
    var doubleOptional: String?
    var testStr = ""

    func mapping(mapper: HelpingMapper) {
        mapper <<<
            testStr <--  "stringImplicitlyUnwrapped"
    }
    
    func didFinishMapping() {
        testStr =  testStr.trimmingCharacters(in: .whitespaces)
    }
    
    required init() {}
}
class JCFlowLayoutMenuViewController: JCBaseController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let jsonString = "{\"doubleOptional\":\" ceshi\",\"stringImplicitlyUnwrapped\":\" hello\",\"int\":1}"
        
        print(jsonString)
        print("=========")
        if let object = BasicTypes.deserialize(from: jsonString) {
            print(object.int)
            print(object.doubleOptional!)
            print(object.testStr)
        }
        
        
        
    }
    
}
