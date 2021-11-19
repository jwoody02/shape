//
//  captchaSolverViewController.swift
//  shape
//
//  Created by Jordan Wood on 2/8/20.
//  Copyright © 2020 jwood. All rights reserved.
//

import UIKit
import Foundation
import WebKit

class captchaSolverViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var progView: InstagramActivityIndicator!
    @IBOutlet weak var waitingLabel: UILabel!
    @IBOutlet weak var singinButton: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    let defaults = UserDefaults.standard
    var currentTaskId = 0
    var iscurrentlySolvingCaptcha = false
    
    var currentlySigningIn = false
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        UIApplication.shared.isStatusBarHidden = true
        progView.animationDuration = 1
        progView.startAnimating()
        showWaiting()
        singinButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        singinButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        singinButton.layer.shadowOpacity = 1.0
        singinButton.layer.shadowRadius = 23
        singinButton.layer.masksToBounds = false
        singinButton.layer.shadowOffset = CGSize(width: 0.0, height: 7.0)
        webView.backgroundColor = UIColor(red: 36/255, green: 36/255, blue: 48/255, alpha: 0)
        self.navigationController?.navigationItem.hidesBackButton = true
//        webView.uiDelegate = self as! WKUIDelegate
        webView.navigationDelegate = self
        self.checkoIfCaptchaNeeded()
//        testThing()
        
//        checkIfCaptchaNeeded()
//        progView.startAnimating()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
//            self.startSolver()
//        }
//        usleep(1500000)
        
//        checkIfCaptchaNeeded()
        
    }
    func checkoIfCaptchaNeeded() {
        
//                    self.startSolver()
//                }
        if self.navigationController != nil {
            if(currentlySigningIn == false) {
            
            if self.defaults.array(forKey: "idsForNeededCaptchas") != nil {
                if((self.defaults.array(forKey: "idsForNeededCaptchas") as! [Int]).count != 0) {
                var ar = self.defaults.array(forKey: "idsForNeededCaptchas") as! [Int]
                print("* starting solver for id \(ar[0])")
                currentTaskId = ar[0]
                iscurrentlySolvingCaptcha = true
                self.startSolver()
                } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.showWaiting()
                    self.checkoIfCaptchaNeeded()
                }
                }
                
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.showWaiting()
                    self.checkoIfCaptchaNeeded()
                }
                
                
                }
            } else {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            //                        self.showWaiting()
                                    self.checkoIfCaptchaNeeded()
                                }
                            }

        } else {
            print("* stopping loop, controller is not opened")
        }
        
    }
    func checkIfCaptchaNeeded() {
//        print("* checkifcaptchaneeded called")
        if self.navigationController != nil {
            if self.defaults.array(forKey: "idsForNeededCaptchas") != nil {
//                let tempas = self.defaults.array(forKey: "tasksArray") as! [NSArray]
//                print()
                if((self.defaults.array(forKey: "idsForNeededCaptchas") as! [Int]).count != 0) {
                    var ar = self.defaults.array(forKey: "idsForNeededCaptchas") as! [Int]
                    print("* starting solver for id \(ar[0])")
                    currentTaskId = ar[0]
//                    DispatchQueue.main.async {
//                        self.webView.alpha = 1
//                                                    self.webView.isHidden = false
//                        //                            UIView.animate(withDuration: 0.3, animations: {
//                        //                                     self.webView.alpha = 1
//                        //                                }, completion:  nil)
//                                            //        progView.stopAnimating()
//                        self.progView.isHidden = true
//                        self.waitingLabel.isHidden = true
//                    }
                    DispatchQueue.main.async {
                         self.startSolver()
                    }
                   
                    repeat {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        }
                    } while Tokens.tokens.count == 0
                    print("* removing id from captchas array")
                    ar.remove(at: 0)
                    self.defaults.set(ar, forKey: "idsForNeededCaptchas")
                } else {
                    print("* idsForNeededCaptchas count == 0")
                    showWaiting()
                }
                
            } else {
//                print("* idsForNeededCaptchas is nil")
                showWaiting()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                print("* checking again")
                self.checkIfCaptchaNeeded()
            }
        } else {
            print("* stopping loop, controller is not opened")
        }
         
    }
    func testThing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
        if self.navigationController == nil {
       //view controller was dismissed
            print("* thing was dismissed")
        } else {
//            print("* still here")
            self.testThing()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        progView.animationDuration = 1
//        checkIfCaptchaNeeded()
//
        //navigation shit
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        let BarButtonItemAppearance = UIBarButtonItem.appearance()
        let attributes = [NSAttributedString.Key.font:  UIFont(name: "Helvetica-Bold", size: 0.1)!, NSAttributedString.Key.foregroundColor: UIColor.clear]

        BarButtonItemAppearance.setTitleTextAttributes(attributes, for: .normal)
        BarButtonItemAppearance.setTitleTextAttributes(attributes, for: .highlighted)
    }
//    func checkIfCaptchaNeeded() {
//        if(currentTaskId != 0) {
//            print("* need captcha")
//            if(webView.isHidden == true) {
//                print("* Need to unhide")
//                startSolver()
//            } else {
//                print("* already solving captcha")
//            }
//        } else {
//            webView.isHidden = true
//            showWaiting()
//            print("* No captcha needed")
//        }
////        usleep(1500000)
////        checkIfCaptchaNeeded()
//    }
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    func startSolver() {
//        webView.isHidden = false
        print("* starting solver with task id: \(currentTaskId)")
        showeyCaptcha()
        let sitekey = "6LeWwRkUAAAAAOBsau7KpuC9AV-6J8mhw4AjC3Xz"
        let supdomain = "https://www.supremenewyork.com/"
        
        displayCaptcha(sitekey: sitekey, baseUrl: supdomain, googleLogin: false, taskid: currentTaskId)
//        loadCaptcha(sitekey: sitekey, baseUrl: supdomain)
//        getToken(sitekey: sitekey, baseUrl: supdomain, taskid: currentTaskId)
//        var hasCaptchaForCurrentTask = false
//        repeat {
//            for i in 0...Tokens.tokens.count {
//                if(Tokens.tokens.count != 0) {
//                    if(Tokens.tokens[i].contains("\(currentTaskId)")) {
//                        print("* THing for current taskidFound")
//                        hasCaptchaForCurrentTask = true
//                    }
//                }
//
//            }
//            usleep(1000000)
//        } while hasCaptchaForCurrentTask == false
//        showWaiting()
//        webView.isHidden = true
    }
    @IBAction func signIn(sender: UIButton){
        currentlySigningIn = true
        print("Sign in pressed")
        webView.isHidden = false
        let googleUrl = URL(string: "https://accounts.google.com/ServiceLogin?service=lso&sacu=1&rip=1")
        let request = URLRequest(url: googleUrl!)
        hideWaiting()
        print("* loading request")
        webView.load(request)
        checkGoogleTitle(sitekey: "6LeWwRkUAAAAAOBsau7KpuC9AV-6J8mhw4AjC3Xz", baseUrl: "https://www.supremenewyork.com/", taskid: currentTaskId)
    }
    private func displayCaptcha(sitekey: String, baseUrl: String, googleLogin: Bool, taskid: Int) {
        webView.fadeIn(0.3, onCompletion: {
            print("done with fade in")
        })
//        webView.isHidden = false
//            webView.isHidden = true
            if googleLogin {
                let googleUrl = URL(string: "https://accounts.google.com/ServiceLogin?service=lso&sacu=1&rip=1")
                let request = URLRequest(url: googleUrl!)
                webView.load(request)
                
                
                
                self.checkGoogleTitle(sitekey: sitekey, baseUrl: baseUrl, taskid: taskid)
            } else {
                print("*DDDDD \(taskid)")
//                webView.isHidden = false
                loadCaptcha(sitekey: sitekey, baseUrl: baseUrl)
    
                let js = "document.getElementById(\"recaptcha-anchor\").click();"
                webView.evaluateJavaScript("document.getElementsByClassName(\"recaptcha-checkbox-checkmark\")[0].click()") { (response, error) in
                    print("* clicked captcha")
                }
                webView.evaluateJavaScript(js, completionHandler: nil)
//                print("* Ran javascript")
                getToken(sitekey: sitekey, baseUrl: baseUrl, taskid: taskid)
//                webView.isHidden = true
//                print("* out of getToken")
            }
        }
    private func getToken(sitekey: String, baseUrl: String, taskid: Int) {
        
            webView.evaluateJavaScript("document.getElementById('g-recaptcha-response').value") { (response, error) in
                guard let response = response else {
                    
                    self.getToken(sitekey: sitekey, baseUrl: baseUrl, taskid: self.currentTaskId)
                    return
                }
                
                if let error = error {
                    print(error)
                }
                
                
                
                if response as? String == "" || response as? String == nil{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                        self.getToken(sitekey: sitekey, baseUrl: baseUrl, taskid: self.currentTaskId)
                    }
                } else {
                    if Tokens.tokens.contains("\(self.currentTaskId)\(response as! String)") {
                        
                    } else {
                        print("* New token")
//
                        print("\(taskid)\(response as! String)")
                        let sitekey = "6LeWwRkUAAAAAOBsau7KpuC9AV-6J8mhw4AjC3Xz"
                        let supdomain = "https://www.supremenewyork.com/"
//                        self.displayCaptcha(sitekey: sitekey, baseUrl: supdomain, googleLogin: false, taskid: self.currentTaskId)
//                        self.loadCaptcha(sitekey: sitekey, baseUrl: supdomain)
//                        self.webView.reload()
                        self.currentTaskId = 0
                        DispatchQueue.main.async() {
                            print("* calling showWaiting()")
                            Tokens.tokens.append("\(taskid)\(response as! String)")
                            self.iscurrentlySolvingCaptcha = false
                            var ar = self.defaults.array(forKey: "idsForNeededCaptchas") as! [Int]
                            let tempar = ar.remove(at: 0)
//                            tempar = tempar as! [Int]
                            print("* new ar: \(ar)")
                            self.defaults.set(ar, forKey: "idsForNeededCaptchas")
                            
                                    
//                            self.displayCaptcha(sitekey: sitekey, baseUrl: supdomain, googleLogin: false, taskid: self.currentTaskId)
                            //        loadCaptcha(sitekey: sitekey, baseUrl: supdomain)
                            
                         if((self.defaults.array(forKey: "idsForNeededCaptchas") as! [Int]).count == 0) {
                            print("* new array count is 0")
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.showWaitingAfterCaptcha()
                                
//                            }
                         }
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.webView.evaluateJavaScript("document.getElementById('g-recaptcha-response').value = \"\";") { (response, error) in
                            }
                            self.checkoIfCaptchaNeeded()
//                            }
                             
                        }
                        
                        
                        
                        
                        
    //                    print(Tokens.tokens)
                    }
                    
    //                uncomment if you want it to run forever
//                    self.loadCaptcha(sitekey: sitekey, baseUrl: baseUrl)
//                    self.getToken(sitekey: sitekey, baseUrl: baseUrl, taskid: taskid)
                }
            }
            
        }
        
        private func loadCaptcha(sitekey: String, baseUrl: String) {
            print("* loading captcha with sitekey \(sitekey)")
//            webView.isHidden = false
//            webView.alpha = 0
           
            webView.loadHTMLString("<html><meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\" />\r\n<head>\r\n<style>\r\nform {\r\n  text-align: center;\r\n}\r\nbody {\r\n  text-align: center;\r\n\r\n  \r\nbackground-color : rgb(36,36,48);\r\n}\r\n\r\nh1 {\r\n  text-align: center;\r\n}\r\nh3 {\r\n  text-align: center;\r\n}\r\ndiv-captcha {\r\n      text-align: center;\r\n}\r\n    .g-recaptcha {\r\n        display: inline-block;\r\n    }\r\n \r\n</style>\r\n\r\n<meta name=\"referrer\" content=\"never\"> <script type='text/javascript' src='https://www.google.com/recaptcha/api.js'></script><script>function sub() { window.webkit.messageHandlers.captchaReceived.postMessage(document.getElementById('g-recaptcha-response').value); }</script></head> <body bgcolor=\"#ffffff\"oncontextmenu=\"return false\"><div id=\"div-captcha\"><br><img width=\"50%\"/><br><br><div style=\"opacity: 0.9\" class=\"g-recaptcha\" data-sitekey=\"\(sitekey)\"  data-callback=\"sub\"></div></div><br>\r\n\r\n</body></html>", baseURL: URL(string: baseUrl))
            webView.evaluateJavaScript("document.getElementsByClassName(\"recaptcha-checkbox-checkmark\")[0].click()") { (response, error) in
                print("* clicked captcha")
            }
//            webView.fadeIn(0.3, onCompletion: {
//                           print("done with fade in")
//                       })
    //        let secondweb = "<html><meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'><head><script type='text/javascript' src='https://www.google.com/recaptcha/api.js'></script><script src='http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js' type='text/javascript'></script> <script>function sub() { window.webkit.messageHandlers.captchaReceived.postMessage(document.getElementById('g-recaptcha-response').value); }</script><title>Captcha Harvester</title> <style type='text/css'> body{margin: 1em 5em 0 5em; font-family: sans-serif;}fieldset{display: inline; padding: 1em; border: none!important;} #submit{display:none;}</style></head><body style='background-color: #23232c;'>   <form> <fieldset> <div class='g-recaptcha' data-sitekey='\(sitekey)' data-callback='sub' style='position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);'></div><p> <input type='submit' value='Submit' id='submit' style='display:none'> </p></fieldset> </form> <fieldset> <h5 style='width: 0vh;'>  </h5> </fieldset> </center>  </body></html>"
    //        self.loadHTMLString(secondweb, baseURL: URL(string: baseUrl))
            
            
        }
    private func checkGoogleTitle(sitekey: String, baseUrl: String, taskid: Int) {
            //document.title
            //sign in -> google account
            webView.isHidden = false
//        webView.fadeIn(0.3, onCompletion: {
//            print("done with fade in")
//        })
            
            webView.evaluateJavaScript("document.title") { (response, error) in
                if let error = error {
                    print(error)
                }
                
                let responseString = response as! String
                print("response string:",responseString)
                
                if responseString.lowercased().range(of: "sign in") != nil || responseString.lowercased() == "" || responseString.lowercased().range(of: "accounts") != nil{
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        print("* Checking title again")
                        if self.navigationController != nil {
                        self.checkGoogleTitle(sitekey: sitekey, baseUrl: baseUrl, taskid: taskid)
                        }
                    }
                } else {
                    self.currentlySigningIn = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
//                        self.webView.isHidden = true
                        self.webView.fadeOut()
                        self.showWaiting()
//                        self.isHidden = false
//                        self.loadCaptcha(sitekey: sitekey, baseUrl: baseUrl)
//                        self.getToken(sitekey: sitekey, baseUrl: baseUrl, taskid: taskid)
                    })
                    
                }
                
            }
            
        }
    func hideWaiting() {
            progView.isHidden = true
            waitingLabel.isHidden = true
            webView.isHidden = false
    //        progView.stopAnimating()
        }
        func showWaiting() {
//            print("* showwainting walcle")
            progView.animationDuration = 1
            progView.isHidden = false
            webView.isHidden = true
            
            
            waitingLabel.isHidden = false
        }
    func showWaitingAfterCaptcha() {
        UIView.animate(withDuration: 0.3/*Animation Duration second*/, animations: {
             self.webView.alpha = 0
        }, completion:  {
           (value: Bool) in
            self.webView.isHidden = true
        })
        progView.animationDuration = 1
        progView.isHidden = false
        
        
        progView.startAnimating()
        waitingLabel.isHidden = false
    }
    func showeyCaptcha() {
        print("* displaying captcha")
        self.webView.alpha = 0
        self.webView.isHidden = false
        UIView.animate(withDuration: 0.3, animations: {
                 self.webView.alpha = 1
            }, completion:  nil)
//        progView.stopAnimating()
        progView.isHidden = true
        waitingLabel.isHidden = true
//        webView.isHidden = false
        
    }
}
extension UIView {

    func fadeIn(_ duration: TimeInterval? = 0.2, onCompletion: (() -> Void)? = nil) {
        self.alpha = 0
        self.isHidden = false
        UIView.animate(withDuration: duration!,
                       animations: { self.alpha = 1 },
                       completion: { (value: Bool) in
                          if let complete = onCompletion { complete() }
                       }
        )
    }

    func fadeOut(_ duration: TimeInterval? = 0.2, onCompletion: (() -> Void)? = nil) {
        UIView.animate(withDuration: duration!,
                       animations: { self.alpha = 0 },
                       completion: { (value: Bool) in
                           self.isHidden = true
                           if let complete = onCompletion { complete() }
                       }
        )
    }

}
