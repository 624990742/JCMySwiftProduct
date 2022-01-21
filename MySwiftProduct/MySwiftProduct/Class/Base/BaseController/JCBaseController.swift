//
//  ViewController.swift
//  JCMySwitfDemo
//
//  Created by jiachen on 2019/4/24.
//  Copyright © 2019年 jiachen. All rights reserved.
//

import UIKit


private extension DMUserInterfaceStyle {
  var description: String {
    switch self {
    case .dark:
      return "dark"
    case .light:
      return "light"
    default:
      return "unspecified"
    }
  }

  var next: DMUserInterfaceStyle {
    switch self {
    case .light:
      return .dark
    case .dark:
      return .unspecified
    default:
      return .light
    }
  }
}

class JCBaseController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(.dm, light: .white, dark: .black)
    }
    
    
    
    
    //Mark: - 暗黑模式
    @objc  func refreshDarkStyle() {
      // Loop throught the available styles
      DMTraitCollection.setOverride(DMTraitCollection(userInterfaceStyle: DMTraitCollection.override.userInterfaceStyle.next), animated: true)
      showUserSetInterfaceStyle()
    }
     
    func showUserSetInterfaceStyle() {
      let alert = UIAlertController(title: DMTraitCollection.override.userInterfaceStyle.description, message: nil, preferredStyle: .alert)
      if alert.popoverPresentationController != nil {
        alert.popoverPresentationController?.sourceRect = .zero
        alert.popoverPresentationController?.sourceView = view
      }
      present(alert, animated: true, completion: nil)
      Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { [weak self] _ in
        self?.dismiss(animated: true, completion: nil)
      }
    }
    

}


