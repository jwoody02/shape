//
//  CaptchaHarvester.swift
//  shape
//
//  Created by Jordan Wood on 1/2/20.
//  Copyright © 2020 jwood. All rights reserved.
//

import WebKit

public extension WKWebView {
    
    public func displayCaptcha(sitekey: String, baseUrl: String, googleLogin: Bool, taskid: Int) {
        self.isHidden = true
        if googleLogin {
            let googleUrl = URL(string: "https://accounts.google.com/ServiceLogin?service=lso&sacu=1&rip=1")
            let request = URLRequest(url: googleUrl!)
            self.load(request)
            
            
            
            self.checkGoogleTitle(sitekey: sitekey, baseUrl: baseUrl, taskid: taskid)
        } else {
            print("*DDDDD \(taskid)")
            self.isHidden = false
            self.loadCaptcha(sitekey: sitekey, baseUrl: baseUrl)
//            let aslkjasd = """
//                                                                                                                                                function sleep (time) {
//                                                                                                                                  return new Promise((resolve) => setTimeout(resolve, time));
//                                                                                                                                }
//                                                                                                                                function asldijaaudio(){
//                                                                                                                                                    if(document.getElementById("recaptcha-audio-button")){
//                                                                                                                                                        sleep(200).then(() => {
//                                                                                                                                            document.getElementById("recaptcha-audio-button").click();
//                                                                                                                                            });
//
//                                                                                                                                                    } else {
//                                                                                                                                sleep(100).then(() => {
//                                                                                                                                            clickcaptcha();
//                                                                                                                                            });
//                                                                                                                                                    }
//                                                                                                                                                }
//                                                                                                                                                function clickcaptcha(){
//                                                                                                                                                    if(document.getElementById("recaptcha-anchor")){
//                                                                                                                                                        sleep(200).then(() => {
//                                                                                                                                            document.getElementById("recaptcha-anchor").click();
//                                                                                                                                            });
//
//                                                                                                                                                    } else {
//                                                                                                                                sleep(100).then(() => {
//                                                                                                                                            clickcaptcha();
//                                                                                                                                            });
//                                                                                                                                                    }
//                                                                                                                                                }
//                                                                                                                                                clickcaptcha()
//            """
//            self.evaluateJavaScript(aslkjasd, completionHandler: nil)
            let js = "document.getElementById(\"recaptcha-anchor\").click();"
            self.evaluateJavaScript(js, completionHandler: nil)
            print("* Ran javascript")
            self.getToken(sitekey: sitekey, baseUrl: baseUrl, taskid: taskid)
        }
    }
    
    private func checkGoogleTitle(sitekey: String, baseUrl: String, taskid: Int) {
        //document.title
        //sign in -> google account
        self.isHidden = true
        
        self.evaluateJavaScript("document.title") { (response, error) in
            if let error = error {
                print(error)
            }
            
            let responseString = response as! String
//            print("response string:",responseString)
            
            if responseString.lowercased().range(of: "sign in") != nil || responseString.lowercased() == "" || responseString.lowercased().range(of: "accounts") != nil{
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.checkGoogleTitle(sitekey: sitekey, baseUrl: baseUrl, taskid: taskid)
                }
            } else {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                    self.isHidden = false
                    self.loadCaptcha(sitekey: sitekey, baseUrl: baseUrl)
                    self.getToken(sitekey: sitekey, baseUrl: baseUrl, taskid: taskid)
                })
                
            }
            
        }
        
    }
    
    private func getToken(sitekey: String, baseUrl: String, taskid: Int) {
        self.evaluateJavaScript("document.getElementById('g-recaptcha-response').value") { (response, error) in
            guard let response = response else {
                
                self.getToken(sitekey: sitekey, baseUrl: baseUrl, taskid: taskid)
                return
            }
            
            if let error = error {
                print(error)
            }
            
            
            
            if response as? String == "" || response as? String == nil{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    self.getToken(sitekey: sitekey, baseUrl: baseUrl, taskid: taskid)
                }
            } else {
                if Tokens.tokens.contains("\(taskid)\(response as! String)") {
                    
                } else {
                    print("* New token")
                    print("\(taskid)\(response as! String)")
                    Tokens.tokens.append("\(taskid)\(response as! String)")
//                    print(Tokens.tokens)
                }
                
//                uncomment if you want it to run forever
                self.loadCaptcha(sitekey: sitekey, baseUrl: baseUrl)
                self.getToken(sitekey: sitekey, baseUrl: baseUrl, taskid: taskid)
            }
        }
        
    }
    
    private func loadCaptcha(sitekey: String, baseUrl: String) {
        self.loadHTMLString("<html><meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\" />\r\n<head>\r\n<style>\r\nform {\r\n  text-align: center;\r\n}\r\nbody {\r\n  text-align: center;\r\n\r\n  \r\nbackground-color : rgb(36,36,48);\r\n}\r\n\r\nh1 {\r\n  text-align: center;\r\n}\r\nh3 {\r\n  text-align: center;\r\n}\r\ndiv-captcha {\r\n      text-align: center;\r\n}\r\n    .g-recaptcha {\r\n        display: inline-block;\r\n    }\r\n \r\n</style>\r\n\r\n<meta name=\"referrer\" content=\"never\"> <script type='text/javascript' src='https://www.google.com/recaptcha/api.js'></script><script>function sub() { window.webkit.messageHandlers.captchaReceived.postMessage(document.getElementById('g-recaptcha-response').value); }</script></head> <body bgcolor=\"#ffffff\"oncontextmenu=\"return false\"><div id=\"div-captcha\"><br><img width=\"50%\"/><br><br><div style=\"opacity: 0.9\" class=\"g-recaptcha\" data-sitekey=\"\(sitekey)\"  data-callback=\"sub\"></div></div><br>\r\n\r\n</body></html>", baseURL: URL(string: baseUrl))
//        let secondweb = "<html><meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'><head><script type='text/javascript' src='https://www.google.com/recaptcha/api.js'></script><script src='http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js' type='text/javascript'></script> <script>function sub() { window.webkit.messageHandlers.captchaReceived.postMessage(document.getElementById('g-recaptcha-response').value); }</script><title>Captcha Harvester</title> <style type='text/css'> body{margin: 1em 5em 0 5em; font-family: sans-serif;}fieldset{display: inline; padding: 1em; border: none!important;} #submit{display:none;}</style></head><body style='background-color: #23232c;'>   <form> <fieldset> <div class='g-recaptcha' data-sitekey='\(sitekey)' data-callback='sub' style='position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);'></div><p> <input type='submit' value='Submit' id='submit' style='display:none'> </p></fieldset> </form> <fieldset> <h5 style='width: 0vh;'>  </h5> </fieldset> </center>  </body></html>"
//        self.loadHTMLString(secondweb, baseURL: URL(string: baseUrl))
        
        
    }
    
    
    
}
