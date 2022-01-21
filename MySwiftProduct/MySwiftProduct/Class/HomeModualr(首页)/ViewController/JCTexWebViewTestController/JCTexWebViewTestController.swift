//
//  JCTexWebViewTestController.swift
//  MySwiftProduct
//
//  Created by jiachen on 2021/6/2.
//  Copyright © 2021 jiachen. All rights reserved.
//

import Foundation
import WebKit
class JCTexWebViewTestController: UIViewController, WKUIDelegate, WKNavigationDelegate , WKScriptMessageHandler{
    
    
    @IBOutlet weak var web1: WKWebView!
 
  
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let tableHTML = """
//        <html>
//        <head>
//          就是测试玩一玩
//        </head>
//        <scr>
//        <body>
//          这里是文档的主体
//          <p><a id="runoob" href="https://www.runoob.com/">   <font size="10" color="red">码农晨仔</font> </a></p>
//          <p><button onclick="audio()"><font size="10" color="red">我是一个</font> <font size="2" color="black">按钮</font></button></p>
//            <img src="\(getImage())" width="20" height="20"/>
//               <br> </br>
//        </body>
//        </html>
//        """
        let  testHTM = """
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <title>Title</title>
              <style>
                        
                        body {
                            font-size:30px;
                            text-align:center;
                        }
                    
                    * {
                        margin: 30px;
                        padding: 0;
                    }
                    
                    h1{
                        color: red;
                    }
                    
                    button{
                        width: 300px;
                        height: 50px;
                        font-size: 30px;
                    }
                    
                        </style>
            </head>

            <body>
            <img onclick="handleClick(1,'qwertyu')" src="lego-link" style=" width:13px; height:13px;"></img>
            <img onclick="handleClick(1,'qwertyu')" src="lego-audio" style=" width:13px; height:13px;"></img>
            <img onclick="handleClick(1,'qwertyu')" src="lego-video" style=" width:13px; height:13px;"></img>
            <img onclick="handleClick(1,'qwertyu')" src="lego-picture" style=" width:13px; height:13px;"></img>
            <img onclick="handleClick(1,'qwertyu')" src="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F035%2F063%2F726%2F3ea4031f045945e1843ae5156749d64c.jpg&refer=http%3A%2F%2Fyouimg1.c-ctrip.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625041177&t=66a726674a7e4d610281002d6a44204f" style=" width:13px; height:13px;"></img>
            
              <button onclick="testA()">点击alert弹框</button>
              <button onclick="testB('我是弹窗内容')">点击alert有参弹窗</button>
              <button onclick="testConfrim()">点击confrim弹窗</button>
              <button onclick="buttonAction()">向iOS端传递数据</button>
            <script>
            
            function testA() {
                   alert("我是JS中的弹窗消息");
                  }
            
            function testB(value) {
                            alert(value);
                        }
            
            
            function comfirm(value) {
                    alert(value);
                }
               
            
            function testObject(name,age) {
                            var object = {name:name,age:age};
                            return object;
                        }
                    
                        function testConfrim() {
                            comfirm("确定修改数据吗？")
                        }
                    
                        function buttonAction(){
                            try {
                                <!-- js 向iOS 传递数据-->
                                window.webkit.messageHandlers.getMessage.postMessage("我是js传递过来的数据")
                            }catch (e) {
                                console.log(e)
                            }
                        }
            </script>
            </body>
            </html>
            """
    
        
        let imgPath = self.getImage()
        let legoLink  = testHTM.replacingOccurrences(of: "lego-link", with: imgPath )
        let legoAudio  = legoLink.replacingOccurrences(of: "lego-audio", with: imgPath )
        let legoVideo  = legoAudio.replacingOccurrences(of: "lego-video", with: imgPath )
        let legoPicture  = legoVideo.replacingOccurrences(of: "lego-picture", with: imgPath )
        
        
        
        
        
        self.web1.uiDelegate = self
        self.web1.navigationDelegate = self
        
        
        let config = WKWebViewConfiguration.init()
        let userController = WKUserContentController.init()
        config.userContentController = userController
        
        
    
        self.web1.loadHTMLString(legoPicture, baseURL: nil)
        self.web1.reload()
        
       
        ///1、iOS调用js中的方法进行并传参
        //案例1
        self.web1?.evaluateJavaScript("testInput('123')", completionHandler: { (data
                    , error) in
                    print(data as Any)
                })
        //案例2
        self.web1?.evaluateJavaScript("testObject('xjf',26)", completionHandler: { (data, err) in
                    print("\(String(describing: data)),\(String(describing: err))")
                })
       
    
    }
    
    
    
    ///获取本地图片转成html要用的字符串路径
    func getImage() -> String {
        let img  =  UIImage(named: "me_ic_dub")
        let imgData = img?.pngData()
        let imgBase64 = imgData?.base64EncodedData(options: Data.Base64EncodingOptions.endLineWithCarriageReturn)
        let str = String(data: imgBase64!, encoding: String.Encoding.utf8)
        let imgPath = "data:image/png;base64,\(str!)"
        return imgPath
    }
    
    
    
    
    
//    /　　2、js向iOS传递数据
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
          print("\(message.name)" + "\(message.body)")
  //        message.name 方法名
  //        message.body 传递的数据
      }
    

    
    
    
    
    //MARK:WKUIDelegate
        //此方法作为js的alert方法接口的实现，默认弹出窗口应该只有提示消息，及一个确认按钮，当然可以添加更多按钮以及其他内容，但是并不会起到什么作用
        //点击确认按钮的相应事件，需要执行completionHandler，这样js才能继续执行
        ////参数 message为  js 方法 alert(<message>) 中的<message>
        func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
            let alertViewController = UIAlertController(title: "提示", message:message, preferredStyle: UIAlertController.Style.alert)
            alertViewController.addAction(UIAlertAction(title: "确认", style: UIAlertAction.Style.default, handler: { (action) in
                completionHandler()
            }))
            self.present(alertViewController, animated: true, completion: nil)
        }
        
        // confirm
        //作为js中confirm接口的实现，需要有提示信息以及两个相应事件， 确认及取消，并且在completionHandler中回传相应结果，确认返回YES， 取消返回NO
        //参数 message为  js 方法 confirm(<message>) 中的<message>
        func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
            let alertVicwController = UIAlertController(title: "提示", message: message, preferredStyle: UIAlertController.Style.alert)
            alertVicwController.addAction(UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: { (alertAction) in
                completionHandler(false)
            }))
            alertVicwController.addAction(UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: { (alertAction) in
                completionHandler(true)
            }))
            self.present(alertVicwController, animated: true, completion: nil)
        }
        
        // prompt
        //作为js中prompt接口的实现，默认需要有一个输入框一个按钮，点击确认按钮回传输入值
        //当然可以添加多个按钮以及多个输入框，不过completionHandler只有一个参数，如果有多个输入框，需要将多个输入框中的值通过某种方式拼接成一个字符串回传，js接收到之后再做处理
        //参数 prompt 为 prompt(<message>, <defaultValue>);中的<message>
        //参数defaultText 为 prompt(<message>, <defaultValue>);中的 <defaultValue>
        func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
            let alertViewController = UIAlertController(title: prompt, message: "", preferredStyle: UIAlertController.Style.alert)
            alertViewController.addTextField { (textField) in
                textField.text = defaultText
            }
            alertViewController.addAction(UIAlertAction(title: "完成", style: UIAlertAction.Style.default, handler: { (alertAction) in
                completionHandler(alertViewController.textFields![0].text)
            }))
            self.present(alertViewController, animated: true, completion: nil)
        }
    
    
  
    
    
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        print(navigationResponse.response.url?.absoluteURL)
        decisionHandler(.allow)
    }
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
       
        decisionHandler(.allow)
    }
    
    
    
    
    
    
    
    
    
    
    
}
