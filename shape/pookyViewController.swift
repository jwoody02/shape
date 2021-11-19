//
//  pookyViewController.swift
//  shape
//
//  Created by Jordan Wood on 2/16/20.
//  Copyright © 2020 jwood. All rights reserved.
//

import Foundation
import UIKit
import WebKit
import AVFoundation

class pookyViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var stepNum: UILabel!
    @IBOutlet weak var currentStatus: UILabel!
//    @IBOutlet weak var webView: WKWebView!
    var player: AVAudioPlayer?
    var webView2: WKWebView!
    
    var tempas: [NSArray] = []
    let defaults = UserDefaults.standard
    var currentStep = 0
    var amountOfSteps = 0
    var name = "Jordan Wood"
    var phone = "8582811541"
    var email = "jordan.wood@tannywood.com"
    var zipcode = "92130"
    var address = "3826 Quarter Mile Drive"
    var city = "San Diego"
    var state = "California"
    var mm = "11"
    var yy = "20"
    var cvv = "420"
    var cardnum = "4242424242424242"
    
    var isDoneLoadingProductPage = false
    var doneAddingToCart = false
    
//    var productAndSizeIds : [[Int:Int]]
    let supremeBaseURL = "https://www.supremenewyork.com/mobile"
//    @IBOutlet weak var consoleView: UITextView!
//    func webView(webView: WKWebView!, didFinishNavigation navigation: WKNavigation!) {
//      print("Finished navigating to url \(webView.url)");
//    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    //      print("loaded")
//            print("* webview loaded: \(webView.url?.absoluteString)")
       
        }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath == "estimatedProgress" {
//        progressView.progress = Float(webView.estimatedProgress)
        if Float(webView2.estimatedProgress) == 1.0 {
            print("* done loading - \(webView2.url?.absoluteString)")
            
                        if(webView2.url?.absoluteString == supremeBaseURL) {
                            print("* recognized as baseURL")
                            removebyId(id: "sizing")
                            removebyId(id: "terms")
                            removebyId(id: "privacy")
                            removebyId(id: "faq")
                            removebyId(id: "lookbook-footer-link")
                            removebyId(id: "full-site-link")
                            
            //                print("Webview loading? -- \(self.webView.isLoading)")
                            
                        } else if((webView2.url?.absoluteString.contains("https://www.supremenewyork.com/mobile/#products/"))!) {
                            print("* recognized as productPage")
                            
                            self.isDoneLoadingProductPage = true
//                            let css = "*{background-color : #282937; color:#fff}body { background-color : #282937; color:#fff;} .section ul li span{background-color: #282937; color: #fff;}#full-site-link{display:none;} footer ul li a, footer ul li span{color:white;}.first-loaded{background-color:#282937;} .clearfix{background-color:#282937;color:#fff;} #products.section ul li{background-color:#282937;color:#fff; }#product{background-color:rgb(7,7,9);} .swipe-wrap{background-color:rgb(15,15,17);} #mobile_checkout_form{background-color:black;} .form-wrap {background-color:#282937;color:#fff;} .checkout-form{background-color:#282937; color:white;} #notice{background-color:black;} #size-options{background-color:#282937;} #totals {background-color:#282937;color:#fff;} #totals_response{background-color:#282937;color:#fff;} #order-terms-label{background-color:#282937;color:#fff;} #order-terms-label-blurb{background-color: #282937; color:#fff;} #g-recaptcha{background-color: #282937; color:#fff;} #checkout-buttons{background-color: #282937; color:#fff;} #cccccccc{background-color: #282937; color:#ffffff;}"
//
//                            let js = "var style = document.createElement('style'); style.innerHTML = '\(css)'; document.head.appendChild(style);"
//
//                            webView2.evaluateJavaScript(js, completionHandler: nil)
                            
                            
                        } else if(webView2.url?.absoluteString as! String == "http://www.supremenewyork.com/mobile/#categories/new") {
                            print("* on new, finding products")
                            
                            
                        } else if((webView2.url?.absoluteString.contains( "https://www.supremenewyork.com/mobile/#checkout"))!) {
                            print("* recognized as checkout page, autofilling")
           
                            currentStep = currentStep + 1
                            self.stepNum.text = "\(currentStep)/\(amountOfSteps)"
                            self.progressView.setProgress(Float(Float(currentStep)/Float(amountOfSteps)), animated: true)
                            self.setCurrentStat(stat: "Auto-Filling...")
                            self.inputCheckoutData()
                            currentStep = currentStep + 1
                            self.stepNum.text = "\(amountOfSteps)/\(amountOfSteps)"
                            self.progressView.setProgress(Float(Float(amountOfSteps)/Float(amountOfSteps)), animated: true)
                            self.setCurrentStat(stat: "Done.")
                    }
        }
        }
    }
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
    override func viewDidLoad() {
            super.viewDidLoad()
//        progressView.setProgress(0.3, animated: false)
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 2)
        webView2 = WKWebView(frame: CGRect(x: 0, y: 125, width: self.view.frame.size.width, height: self.view.frame.size.height-125))
        self.view.addSubview(webView2!)
        webView2.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        let url = URL(string: "https://www.supremenewyork.com/mobile")
        webView2!.load(URLRequest(url: url!))
        webView2.navigationDelegate = self
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared.diskCapacity = 0
        URLCache.shared.memoryCapacity = 0
        webView2.backgroundColor = hexStringToUIColor(hex: "#282937")
//        webView2.uiDelegate = self as! WKUIDelegate
        doEverything()
//        webView.navigationDelegate = self
//        webView.isHidden = false
////        webView.UIDelegate = self
////           webView.navigationDelegate = self
//        webView.load(URLRequest(url: URL(string: "https://www.supremenewyork.com/mobile")!))
//        doEverything()
    //        progView.animationDuration = 1
    //        checkIfCaptchaNeeded()
    //
            //navigation shit
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true
            self.navigationController?.view.backgroundColor = .clear
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        self.navigationItem.setHidesBackButton(true, animated: false)
            let BarButtonItemAppearance = UIBarButtonItem.appearance()
        let attributes = [NSAttributedString.Key.font:  UIFont(name: "Helvetica-Bold", size: 0.1)!, NSAttributedString.Key.foregroundColor: UIColor.clear, NSAttributedString.Key.strokeColor: UIColor.black]

            BarButtonItemAppearance.setTitleTextAttributes(attributes, for: .normal)
            BarButtonItemAppearance.setTitleTextAttributes(attributes, for: .highlighted)
        }
    func doEverything() {
        webView2!.isHidden = false
        webView2!.alpha = 1.0
                print("* Loading product Queue")
                
        //        usleep(10000000)
                self.stepNum.text = "0/1"
                
                 self.progressView.setProgress(Float(Float(0)/Float(1)), animated: true)
                self.setCurrentStat(stat: "Loading Queue...")
                if (self.defaults.array(forKey: "tasksArray") != nil){
                            
                       tempas = self.defaults.array(forKey: "tasksArray") as! [NSArray]
                    print(tempas)
                            print("* There are tasks:",tempas.count)
                    amountOfSteps = (3*tempas.count) + 3
                    self.stepNum.text = "0/\(amountOfSteps)"
                    self.progressView.setProgress(Float(Float(0)/Float(amountOfSteps)), animated: true)
        //            print(tempas)
                    
        //           var tmp = true
        //            repeat {
        //                autoreleasepool {
        //                    print("* repeat called")
        //                }
        //            } while tmp == true
                    self.setCurrentStat(stat: "Parsing Products...")
                    if let url = URL(string: "https://www.supremenewyork.com/mobile_stock.json") {
                                        let sess = URLSession.init(configuration: .ephemeral)
                    //                        .dataTask
                                           sess.dataTask(with: url) { data, response, error in
                                              if let data = data {
                                                 if let jsonString = String(data: data, encoding: .utf8) {
                    //                                print(jsonString)
                                                    do{
                                                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
                                                        // try to read out a string array
                                                        print("* Parsing data")
//                                                        go through all tasks
                                                        for k in 0...self.tempas.count-1 {
                                                            var found = false
                                                            var tassk = self.tempas[k][6]
        //                                                    let cell = self.tasksTable.cellForRow(at: indexPath as IndexPath) as! tasksCell
        //                                                    cell.statusLabel.text = "• Finding item"
                                                            //TASK ID: tempas[sender.tag][6]
                                                            print(self.tempas[k][6])
                                                            //#8c96e9
        //                                                    cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
                                                            var catetogo = self.tempas[k][7]
                                                            if(catetogo as! String == "T-shirts") {
                                                                catetogo = "T-Shirts"
                                                            }
                                                            var nammeee = self.tempas[k][0]
                                                            var category = json["products_and_categories"]![catetogo]
        //                                                    print(category)
                                                            //                                    captchaSolverViewController.currentTaskId = self.tempas[sender.tag][6] as! Int
                                                                                                
                                                            //                                    var capSolver = captchaSolverViewController()
                                                            //                                    captchaSolverViewController.currentTaskId = self.tempas[sender.tag][6] as! Int
                                                            //                                    capSolver.startSolver()
                                                                                                
                                                             if let alksjdlaks = category as? NSArray{
                                                                  print("* valid nsarray")
                                                                  var items = category as! NSArray
                                                                for i in 0...items.count-1 {
                                                                                                                    
                                                                if(found == false) {
                                                                    var item = items[i] as! [String: AnyObject]
                                                                    if(i == items.count-1 && (item["name"] as! String).lowercased() != (nammeee as! String).lowercased() && found == false) {
                                                                        print("* somehow isnt drop yet/item not found?")
                                                                    } else {
                                                                        if((item["name"] as! String).lowercased() == (nammeee as! String).lowercased()) {
                                                                                print("Found item")
                                                                                found = true
                                                                                let founditemid = item["id"] as! Int
                                                                            let found_id = founditemid
                                                                            print("Downloading: https://www.supremenewyork.com/shop/\(found_id).json")
                                                                            guard let idurl = URL(string: "https://www.supremenewyork.com/shop/\(found_id).json") else {return}
                                                                            URLSession.shared.dataTask(with: idurl) { (data2, response2, error2) in
                                                                                guard let data2 = data2 else {return}
                                                                                do {
                                                                                    var indexofcolor = 0
                                                                    if let jsonString = String(data: data2, encoding: .utf8) {
                                                                    //                                                                        print(jsonString)
        //                                                                                                                                    do{
                                                                                            let itemjson = try JSONSerialization.jsonObject(with: data2, options: []) as! [String: AnyObject]
                                                                                                               let styles = itemjson["styles"]
                                                                                    var st = 0
                                                                                     var s = 0
                                                                                   if((self.tempas[k][1] as! String).lowercased() == "n/a" && (self.tempas[k][2] as! String).lowercased() == "n/a") {
                                                                                            st = ((styles as! NSArray)[0] as! [String: AnyObject])["id"] as! Int
                                                                                           s = ((((styles as! NSArray)[0] as! [String: AnyObject])["sizes"] as! NSArray)[0] as! [String: AnyObject])["id"] as! Int
                                                                                   } else {
                                                                                    if((self.tempas[k][1] as! String).lowercased() == "n/a"){
        //                                                                                choosing first color
                                                                                        st = ((styles as! NSArray)[0] as! [String: AnyObject])["id"] as! Int
                                                                                        
                                                                                    } else if ((self.tempas[k][2] as! String).lowercased() == "n/a") {
                                                                                        s = ((((styles as! NSArray)[i] as! [String: AnyObject])["sizes"] as! NSArray)[0] as! [String: AnyObject])["id"] as! Int
                                                                                    }
                                                                                    else if((self.tempas[k][2] as! String).lowercased() != "n/a" && (self.tempas[k][1] as! String).lowercased() != "n/a") {
                                                                                        print("* both color and size not n/a")
                                                                                        for j in 0...(styles as! NSArray).count-1 {
                                                                                            if(((((styles as! NSArray)[j]) as! [String: AnyObject])["name"] as! String).lowercased().contains((self.tempas[k][1] as! String).lowercased())) {
                                                                                                print("* Found color:",((((styles as! NSArray)[j]) as! [String: AnyObject])["name"] as! String))
                                                                                                print("* StyleID:",((((styles as! NSArray)[j]) as! [String: AnyObject])["id"]) as! Int)
                                                                                                st = ((((styles as! NSArray)[j]) as! [String: AnyObject])["id"]) as! Int
                                                                                                indexofcolor = j
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                    print("* checking color etc")
                                                                                    if(st != 0) {
        //                                                                                style was found, go to page
                                                                                        DispatchQueue.main.async {
                                                                                            self.currentStep = self.currentStep + 1
                                                                                            self.stepNum.text = "\(self.currentStep)/\(self.amountOfSteps)"
                                                                                            self.progressView.setProgress(Float(Float(self.currentStep)/Float(self.amountOfSteps)), animated: true)
                                                                                            self.setCurrentStat(stat: "Loading Product page...")
                                                                                        }
                                                                                        let request3 = URLRequest(url: URL(string: "https://www.supremenewyork.com/mobile/#products/\(found_id)/\(st)")!)
        //                                                                                    print("Webview loading? -- \(self.webView.isLoading)")
        //                                                                                    print("* choosing size")
                                                                                            print("* new request: \(request3)")
                                                                                        DispatchQueue.main.async {
                                                                                            self.webView2!.load(request3)
//                                                                                            self.webView2.reload()
                                                                                            self.currentStep = self.currentStep + 1
                                                                                            self.stepNum.text = "\(self.currentStep)/\(self.amountOfSteps)"
                                                                                            self.progressView.setProgress(Float(Float(self.currentStep)/Float(self.amountOfSteps)), animated: true)
//                                                                                            self.setCurrentStat(stat: "Finding Size...")
                                                                                        }
        //                                                                                    parse size while website loads if its not n/a
                                                                                            if(s == 0) {
        //                                                                                        find size in json
                                                                                                for o in 0...((((itemjson["styles"] as! NSArray)[i]) as! [String: AnyObject])["sizes"] as! NSArray).count-1 {
                                                                                                //                                                                                                    check to see if size is same
                                                                                                    if((((((((((itemjson["styles"] as! NSArray)[i]) as! [String: AnyObject])["sizes"] as! NSArray)[o]) as! [String: AnyObject])["name"] as! String).lowercased() as AnyObject) as! String) == ((self.tempas[k][2] as! String).lowercased())) {
                                                                                                        
                                                                                                        s = ((((((itemjson["styles"] as! NSArray)[i]) as! [String: AnyObject])["sizes"] as! NSArray)[o]) as! [String: AnyObject])["id"] as! Int
                                                                                                        print("* Found size: \(s)")
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        
                                                                                            repeat {
                                                                                                usleep(500000)
                                                                                            } while self.isDoneLoadingProductPage == false
                                                                                        self.isDoneLoadingProductPage = false
                                                                                            print("* page done loading, selecting size")
                                                                                        
                                                                                            
                                                                                        DispatchQueue.main.async {
                                                                                            self.injectValueForID(id: "size-options", value: "\(s)")
                                                                                            self.currentStep = self.currentStep + 1
                                                                                            self.stepNum.text = "\(self.currentStep)/\(self.amountOfSteps)"
                                                                                            self.progressView.setProgress(Float(Float(self.currentStep)/Float(self.amountOfSteps)), animated: true)
                                                                                           self.setCurrentStat(stat: "Adding to cart...")
                                                                                        }
//                                                                                            self.addToCart()
//                                                                                            repeat {
//                                                                                                usleep(500000)
//                                                                                            } while self.doneAddingToCart == false
//                                                                                            self.doneAddingToCart = false
//                                                                                            self.setCurrentStat(stat: "Added to cart!")
                                                                                            var alksjdlkasjd = false
                                                                                           
//
                                                                                            self.addToCart(completion: { (completed, error) in
//                                                                                                guard error == nil, let weather = weather else {
//                                                                                                    if weather == nil { print("No Weather") }
//                                                                                                    if error != nil { print(error!.localizedDescription) }
//                                                                                                    return
//                                                                                                }
                                                                                                print("* add to cart finished, continuing")
                                                                                                usleep(250000)
                                                                                                                                                                                    print("* Done, moving to next thing(\(k) : \(self.tempas.count-1)")
                                                                                                                                                                                    if(k == self.tempas.count-1) {
                                                                                                //                                                                                        if this is the last item, go to checkout
                                                                                                                                                                                        DispatchQueue.main.async {
                                                                                                                                                                                        self.currentStep = self.currentStep + 1
                                                                                                                                                                                        self.stepNum.text = "\(self.currentStep)/\(self.amountOfSteps)"
                                                                                                                                                                                        self.progressView.setProgress(Float(Float(self.currentStep)/Float(self.amountOfSteps)), animated: true)
                                                                                                                                                                                        self.setCurrentStat(stat: "Going to checkout...")
                                                                                                                                                                                        }
                                                                                                                                                                                        
                                                                                                                                                                                        
                                                                                                                                                                                        let supremeURL3 = URL(string: "https://www.supremenewyork.com/mobile/#checkout")
                                                                                                                                                                                        let request3 = URLRequest(url: supremeURL3!)
                                                                                                                                                                                        DispatchQueue.main.async {
                                                                                                                                                                                            usleep(1500000)
                                                                                                                                                                                         self.webView2.load(request3)
                                                                                                                                                                                        }
                                                                                          
                                                                                                                                                                                    }
                                                                                                //Do something with your weather result
//                                                                                                print(weather)
                                                                                            })
                                                                                            
                                                                                            
                                                                                        //find the size while page is loading
                                                                                        }
                                                                                        
        //                                                                                webView.load("https://www.supremenewyork.com/mobile/#products/\(found_id)/\(st)")
                                                                                    
                                                                        }
        //                                                                }
                                                                                    }
                                                                                } catch {
                                                                                    print("* error downloading product json")
                                                                                }
                                                                            }.resume()
                                                                        
                                                                        }
                                                                    }
                                                                        
                                                                    }
                                                                    
                                                                }
                                                                                                                                        
                                                             } else {
                                                                print("* invalid array")
        //                                                        let amountOfSteps = (3*tempas.count) + 4
                                                                DispatchQueue.main.async {
                                                                    self.stepNum.text = "0/\(self.amountOfSteps)"
                                                                    self.progressView.setProgress(Float(Float(0)/Float(self.amountOfSteps)), animated: true)
                                                                    self.setCurrentStat(stat: "Error Parsing Products")
                                                                }
                                                                
                                                                
                                                            }
                                                        }
                                                        
                                                    } catch {
                                                        print("* error with mobile_stock")
                                                    }
                                                }
                                            }
                        }.resume()
                    }
                    
        //            self.progressView.setProgress(Float(Float(7)/Float(amountOfSteps)), animated: true)
                //            print(tempas.count)
        //                    noTasks.isHidden = true
        //                    playpauseView.isHidden = false
                   } else {
        //                    playpauseView.isHidden = true
                            print("* No tasks")
                    DispatchQueue.main.async {
                        self.stepNum.text = "0/0"
                        self.progressView.setProgress(Float(Float(0)/Float(0)), animated: true)
                        self.setCurrentStat(stat: "No Tasks")
                    }
                        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    func addToCart(completion: @escaping(Bool?, Error?) -> Void) {
        print("* addtocart called")
        DispatchQueue.main.async {
            if(self.webView2.url?.absoluteString != "https://www.supremenewyork.com/mobile/#checkout" && self.webView2.url?.absoluteString != "https://www.supremenewyork.com/mobile/" && self.webView2.url?.absoluteString != "https://www.supremenewyork.com/mobile/#cart" && (self.webView2.url?.absoluteString.contains("https://www.supremenewyork.com/mobile/#products/"))!) {
        self.webView2.evaluateJavaScript("if(document.getElementsByClassName('cart-button')[0].innerHTML == 'add to cart') {document.getElementsByClassName('cart-button')[0].click();}", completionHandler: nil)
        self.webView2.evaluateJavaScript("document.getElementsByClassName('cart-button')[0].innerText") { (response, error) in
        guard let response = response else {
            print("* error adding to cart")
            usleep(250000)
//            self.getToken(sitekey: sitekey, baseUrl: baseUrl, taskid: self.currentTaskId)
            self.addToCart(completion: { (completed, error) in
                print("* completion")
                completion(true, error)
            })
            return
            
        }
        
        if let error = error {
            print(error)
        }
            print("* cart-button - \(response)")
            if(response as! String != "remove") {
                if(response as! String == "sold out") {
                    self.doneAddingToCart = true
                    print("* item is sold out, moving on")
                    completion(true, error)
                } else {
                    print("* add to cart did not work, retrying")
                    usleep(250000)
//                    self.addToCart(completion: nil)
                    self.addToCart(completion: { (completed, error) in
                        print("* completion")
                        completion(true, error)
                    })
                }
                
            } else {
                self.doneAddingToCart = true
                print("* successfully added to cart")
                 completion(true, error)
                
            }
        }
        }
        }
    }
    func inputCheckoutData() {
        DispatchQueue.main.async {
//            self.webView2.evaluateJavaScript("window.scrollTo(0,document.body.scrollHeight); document.getElementById('order_bn').value = \"\(self.name)\";document.getElementById('credit_card_month').value = \"\(self.mm)\";document.getElementById('credit_card_year').value = \"\(self.yy)\";document.getElementById('order_terms').click();var elements = document.getElementById('mobile_checkout_form').elements; for (var i = 0, element; element = elements[i++];) {if (element.placeholder === 'email'){element.value = \"\(self.email)\";} else if (element.placeholder === 'address'){element.value = \"\(self.address)\";} else if (element.placeholder === 'telephone'){element.value = \"\(self.phone)\";} else if (element.placeholder === 'zip'){element.value = \"\(self.zipcode)\";} else if (element.placeholder === 'city'){element.value = \"\(self.city)\";}else if (element.placeholder === 'name'){element.value = \"\(self.name)\";}else if (element.placeholder === 'credit card number'){element.value = \"\(self.cardnum)\";} else if (element.placeholder === 'cvv'){element.value = \"\(self.cvv)\";}else if (element.placeholder === 'state'){element.value = \"\(self.state)\";}}", completionHandler: nil)
            self.webView2.evaluateJavaScript("window.scrollTo(0,document.body.scrollHeight); document.getElementById('order_bn').value = \"\(self.name)\";document.getElementById('order_email').value = \"\(self.email)\";document.getElementById('order_tel').value = \"\(self.phone)\";document.getElementById('credit_card_month').value = \"\(self.mm)\";document.getElementById('credit_card_year').value = \"\(self.yy)\";document.getElementById('order_terms').click();var elements = document.getElementById('mobile_checkout_form').elements; for (var i = 0, element; element = elements[i++];) {if (element.placeholder === 'email'){element.value = \"\(self.email)\";} else if (element.placeholder === 'address'){element.value = \"\(self.address)\";} else if (element.placeholder === 'telephone'){element.value = \"\(self.phone)\";} else if (element.placeholder === 'zip'){element.value = \"\(self.zipcode)\";} else if (element.placeholder === 'city'){element.value = \"\(self.city)\";}else if (element.placeholder === 'name'){element.value = \"\(self.name)\";}else if (element.placeholder === 'credit card number'){element.value = \"\(self.cardnum)\";} else if (element.placeholder === 'cvv'){element.value = \"\(self.cvv)\";}else if (element.placeholder === 'state'){element.value = \"\(self.state)\";}}", completionHandler: nil)
        }
    }
    func injectValueForID(id: String, value: String) {
        if((webView2.url?.absoluteString.contains("https://www.supremenewyork.com/mobile/#products/"))!) {
        DispatchQueue.main.async {
        self.webView2.evaluateJavaScript("document.getElementById(\'\(id)\').value = \'\(value)\';", completionHandler: {(value2, error) in
            print(value2)
            if(value2 == nil) {
                
                usleep(500000)
                self.injectValueForID(id: id, value: value)
            }
//            print("Error: \(error)")
        })
            }
//            self.webView2.evaluateJavaScript("document.getElementsByClassName(\'\(id)\')[0].value") { (response, error) in
//                    guard let response = response else {
//            //            print("* error adding to cart")
////                        usleep(250000)
//            //            self.getToken(sitekey: sitekey, baseUrl: baseUrl, taskid: self.currentTaskId)
////                        self.addToCart()
//                        return
//                    }
//                print("* new size value - \(response)")
//
//                    if let error = error {
//                        print(error)
//                    }
//        }
    }
    }
    func playSuccessSound() {
        guard let url = Bundle.main.url(forResource: "payment_success", withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    func loadQueue() {
        
    }
    func stressTest() {
        print("* starting stress test")
//stressTest()
    }
//    func addStatus(stat: String) {
//            consoleView.text = "\(consoleView.text as! String)\n\(stat)"
//            let stringLength:Int = self.consoleView.text.count
//            self.consoleView.scrollRangeToVisible(NSMakeRange(stringLength-1, 0))
//    //        consoleView.scrollRangeToVisible(NSRange(location: consoleView.text.count, length: 0))
//    //        consoleView.allowsEditingTextAttributes = false
//
//        }
//    override func viewDidLoad() {
//    super.viewDidLoad()
//
//
//    }
    func removebyId(id: String) {
        let js = "var myelement = document.getElementById(\"\(id)\");myelement.style.display= \"none\";"
        webView2.evaluateJavaScript(js, completionHandler: nil)
    }
    func setProgress(prog: Float) {
           DispatchQueue.main.async() {
               self.progressView.setProgress(prog, animated: true)
           }
       }
       func resetEverything(){
           self.currentStatus.text = "Ready to Start"
           progressView.setProgress(0, animated: false)
           self.stepNum.text = "0/33"
       }
       func setCurrentStat(stat: String) {
           self.currentStatus.text = stat
       }
       func setStep(step: Int) {
           self.stepNum.text = "\(step)/33"
           self.progressView.setProgress(Float(Float(step)/Float(33)), animated: true)
       }
}
