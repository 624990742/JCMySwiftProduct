//
//  JCTextViewTestController.swift
//  MySwiftProduct
//
//  Created by jiachen on 2021/6/1.
//  Copyright © 2021 jiachen. All rights reserved.
//

import Foundation
import Kanna
class JCTextViewTestController: UIViewController, Searchable {

    @IBOutlet weak var textView: NewTextView!
    
    private enum Text {
        static let tableHTML = """
        <html>
        <head>
          这里是文档的头部
        </head>
        <scr>
        <body>
          这里是文档的主体
          <p><a id="runoob" href="https://www.runoob.com/">   <font size="10" color="red">菜鸟教程</font> </a></p>
          <p><a id="runoob" href="https://www.runoob.com/">菜鸟教程</a></p>
          <p><a id="runoob" href="https://www.runoob.com/">菜鸟教程</a></p>
          <p><button onclick="audio()"><font size="10" color="red">我是一个</font> <font size="2" color="black">按钮</font></button></p>
            <p onclick="alert('aaa')">
              <font size="10" color="red">我是一个点击时间</font>
              <font size="2" color="black">me</font>
            </p>
            <img src="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F035%2F063%2F726%2F3ea4031f045945e1843ae5156749d64c.jpg&refer=http%3A%2F%2Fyouimg1.c-ctrip.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625041177&t=66a726674a7e4d610281002d6a44204f"   width="170" height="110"/>
               <br> </br>
               <click  type="2" value="1622514526424" picture="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fd.lanrentuku.com%2Fdown%2Fpng%2F0904%2FM-v-Player%2FM-v-Player_13.png&refer=http%3A%2F%2Fd.lanrentuku.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625106762&t=ad3b4e68e88ec5e4d73775dcecfd82f2"><font size="10" color="red">老鼠爱大米</font> </click>
        </body>
        </html>
        """

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.testHTML()
    }
    
    
    
    func testHTML(){
        self.textView.isEditable = false
    
        
        guard let inputAsHTMLWithZeroWidthSpaceRemoved = Text.tableHTML.replaceAppropiateZeroWidthSpaces() else { return  }
        
        guard let htmlData = unescapeHTML(from: inputAsHTMLWithZeroWidthSpaceRemoved).data(using: .utf8) else { return  }
        
        let parsedAttributedString = self.getParsedHTMLAttributedString(fromData: htmlData)
    
        
        
        self.textView.attributedText = parsedAttributedString
        
        print("self.textView.textContainer:\(self.textView.textContainer)")
        
     
        
    }
    
    
    
    
    
    
    
    
    ///MARK - 测试解析
    func testsHTML(){
        
//        if let doc = try? HTML(html: Text.tableHTML, encoding: .utf8) {
//
//
//            print("doc.innerHTML::\(doc.innerHTML)")
//            print("===========================")
//
//            print("doc.tagName::\(doc.tagName)")
//            print("===========================")
//            print("doc.toHTML::\(doc.toHTML)")
//            print("===========================")
//            print("doc.toHTML::\(doc.className)")
//            print("===========================")
//
//            // Search for nodes by XPath
//            for link in doc.xpath("//a | //link") {
//                print(link.text)
//                print(link["href"])
//            }
//        }
        
        
        
    }
    
    
    
    
    ///MARK - 私有方法
    
    
    enum ParserConstants {
        static let interactiveElementTagName = "interactive-element"
        static let interactiveElementRegex = """
        \\[\(ParserConstants.interactiveElementTagName)\\sid=.+?\\].*?\\[\\/\(ParserConstants.interactiveElementTagName)\\]
        """
    }

    
    
    private func extractPositions(fromRanges ranges: [Range<String.Index>]) -> [String.Index] {
        return ranges.flatMap { [$0.lowerBound, $0.upperBound] }.sorted()
    }
    
    
    private func unescapeHTML(from input: String) -> String {
        return input.replacingOccurrences(of: "&amp;", with: "&")
            .replacingOccurrences(of: "&lt;", with: "<")
            .replacingOccurrences(of: "&gt;", with: ">")
            .replacingOccurrences(of: "&quot;", with: "\"")
            .replacingOccurrences(of: "&#39;", with: "'")
            .replacingOccurrences(of: "&nbsp;", with: " ")
    }

    
    ///获取
    private func getParsedHTMLAttributedString(fromData data: Data) -> NSAttributedString? {
        var attributedString: NSAttributedString?
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        if Thread.isMainThread {
            attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil)
        } else {
            DispatchQueue.main.sync {
                attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil)
            }
        }
        
        return attributedString
    }
}
















///MARK - 禁止菜单选中
class NewTextView: UITextView {
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if #available(iOS 10, *) {
            if action == #selector(UIResponderStandardEditActions.paste(_:))
                || action == #selector(UIResponderStandardEditActions.select(_:))
                || action == #selector(UIResponderStandardEditActions.selectAll(_:))
                || action == #selector(UIResponderStandardEditActions.copy(_:))
                || action == #selector(UIResponderStandardEditActions.cut(_:))
                || action == #selector(UIResponderStandardEditActions.delete(_:))
            {
                OperationQueue.main.addOperation {
                    UIMenuController.shared.setMenuVisible(false, animated: false)
                }
                self.selectedRange = NSRange.init(location: 0, length: 0)

                return false
            }
        } else {
            if action == #selector(paste(_:))
                || action == #selector(select(_:))
                || action == #selector(selectAll(_:))
                || action == #selector(copy(_:))
                || action == #selector(cut(_:))
                || action == #selector(delete(_:))
            {
                OperationQueue.main.addOperation {
                    UIMenuController.shared.setMenuVisible(false, animated: false)
                }
                return false
            }
        }
        
        //return true : this is not correct
        return super.canPerformAction(action, withSender: sender)
    }
    
    // required to prevent blue background selection from any situation
       override var selectedTextRange: UITextRange? {
           get { return nil }
           set {}
       }
       
       override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
           if gestureRecognizer is UIPanGestureRecognizer {
               // required for compatibility with isScrollEnabled
               return super.gestureRecognizerShouldBegin(gestureRecognizer)
           }
           if let tapGestureRecognizer = gestureRecognizer as? UITapGestureRecognizer,
               tapGestureRecognizer.numberOfTapsRequired == 1 {
               // required for compatibility with links
               return super.gestureRecognizerShouldBegin(gestureRecognizer)
           }
           // allowing smallDelayRecognizer for links
           // https://stackoverflow.com/questions/46143868/xcode-9-uitextview-links-no-longer-clickable
           if let longPressGestureRecognizer = gestureRecognizer as? UILongPressGestureRecognizer,
               // comparison value is used to distinguish between 0.12 (smallDelayRecognizer) and 0.5 (textSelectionForce and textLoupe)
               longPressGestureRecognizer.minimumPressDuration < 0.325 {
               return super.gestureRecognizerShouldBegin(gestureRecognizer)
           }
           // preventing selection from loupe/magnifier (_UITextSelectionForceGesture), multi tap, tap and a half, etc.
           gestureRecognizer.isEnabled = false
           return false
       }
    
    
}

extension UITextView {
    
    override open func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer.isKind(of: UILongPressGestureRecognizer.self) {
            do {
                let array = try gestureRecognizer.value(forKey: "_targets") as! NSMutableArray
                let targetAndAction = array.firstObject
                let actions = ["action=oneFingerForcePan:",
                               "action=_handleRevealGesture:",
                               "action=loupeGesture:",
                               "action=longDelayRecognizer:"]
                
                for action in actions {
//                    print("targetAndAction.debugDescription: \(targetAndAction.debugDescription)")
                    if targetAndAction.debugDescription.contains(action) {
                        gestureRecognizer.isEnabled = false
                    }
                }
                
            } catch let exception {
                print("TXT_VIEW EXCEPTION : \(exception)")
            }
            defer {
                super.addGestureRecognizer(gestureRecognizer)
            }
        }
    }
    
}
