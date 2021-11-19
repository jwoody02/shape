//
//  tasksBackup.swift
//  shape
//
//  Created by Jordan Wood on 3/7/20.
//  Copyright © 2020 jwood. All rights reserved.
//

//
//  tasksViewController.swift
//  shape
//
//  Created by Jordan Wood on 12/30/19.
//  Copyright © 2019 jwood. All rights reserved.
//

import Foundation
//import UIKit
//import Alamofire
//import SwiftyJSON
//import WebKit
//import AVFoundation
//import SwiftKeychainWrapper
//import NotificationCenter


//enum CardType: String {
//    case Unknown, Amex, visa, master, Diners, Discover, JCB, Elo, Hipercard, UnionPay
//
//    static let allCards = [Amex, visa, master, Diners, Discover, JCB, Elo, Hipercard, UnionPay]
//
//    var regex : String {
//        switch self {
//        case .Amex:
//           return "^3[47][0-9]{5,}$"
//        case .visa:
//           return "^4[0-9]{6,}([0-9]{3})?$"
//        case .master:
//           return "^(5[1-5][0-9]{4}|677189)[0-9]{5,}$"
//        case .Diners:
//           return "^3(?:0[0-5]|[68][0-9])[0-9]{4,}$"
//        case .Discover:
//           return "^6(?:011|5[0-9]{2})[0-9]{3,}$"
//        case .JCB:
//           return "^(?:2131|1800|35[0-9]{3})[0-9]{3,}$"
//        case .UnionPay:
//           return "^(62|88)[0-9]{5,}$"
//        case .Hipercard:
//           return "^(606282|3841)[0-9]{5,}$"
//        case .Elo:
//           return "^((((636368)|(438935)|(504175)|(451416)|(636297))[0-9]{0,10})|((5067)|(4576)|(4011))[0-9]{0,12})$"
//        default:
//           return ""
//        }
//    }
//}
//class tasksCellBackup: UITableViewCell {
//    @IBOutlet weak var productLabel: UILabel!
//    @IBOutlet weak var playButton: UIButton!
////    @IBOutlet weak var productURLLabel: UILabel!
//    @IBOutlet weak var productImageView: UIImageView!
//    @IBOutlet weak var profilenameLabel: UILabel!
//    @IBOutlet weak var colorsizeLabel: UILabel!
//    @IBOutlet weak var backgroundViewzz: UIView!
//    @IBOutlet weak var statusLabel: UILabel!
//    @IBOutlet weak var progressView: UIProgressView!
//}
//class tasksBackup: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    @IBOutlet weak var topView: UIView!
//    @IBOutlet weak var playpauseView: UIView!
//    @IBOutlet weak var newTaskButton: UIButton!
//    @IBOutlet weak var currentTimeLabel: UILabel!
//    @IBOutlet weak var noTasks: UILabel!
//    @IBOutlet weak var tasksTable: UITableView!
//    @IBOutlet weak var captchaView: WKWebView!
//
//    @IBOutlet weak var recaptchaButton: UIButton!
//    var iscurrentlysolvingcaptchas = false
//    var othershavetogo = true
//    var timer = Timer()
//    let defaults = UserDefaults.standard
//    var tempas: [NSArray] = []
//    var needcaptcharn = false
//    var player: AVAudioPlayer?
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
////        self.defaults.set(nil, forKey: "tasksArray")
//        // Do any additional setup after loading the view.
//        let number = "4242 4242 4242 4242"
//
//        let v = CreditCardValidator()
//        if let type = v.type(from: number) {
//            print(type.name) // Visa, Mastercard, Amex etc.
//        } else {
//            // I Can't detect type of credit card
//            print("* not valid card")
//        }
//        tasksTable.delegate = self
//        tasksTable.dataSource = self
//        tasksTable.separatorStyle = .none
//        tasksTable.rowHeight = 150
//        captchaView.isHidden = true
//        captchaView.layer.cornerRadius = 28.5
//        captchaView.layer.masksToBounds = false
//
//        topView.layer.cornerRadius = 25;
////        topView.layer.masksToBounds = true;
//        newTaskButton.layer.cornerRadius = 24;
//        recaptchaButton.layer.cornerRadius = 24;
//
//
//
//        // Shadow and Radius
//        topView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
//        topView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//        topView.layer.shadowOpacity = 1.0
//        topView.layer.shadowRadius = 28.5
//        topView.layer.masksToBounds = false
//        topView.layer.cornerRadius = 28.5
//
////        topView.layer.masksToBounds = true;
////        newTaskButton.layer.cornerRadius = 28.5;
//        // Shadow and Radius
//        playpauseView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
//        playpauseView.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
//        playpauseView.layer.shadowOpacity = 1.0
//        playpauseView.layer.shadowRadius = 23
//        playpauseView.layer.masksToBounds = false
//        playpauseView.layer.shadowOffset = CGSize(width: 0.0, height: 7.0)
//        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController!.navigationBar.shadowImage = UIImage()
//        self.navigationController!.navigationBar.isTranslucent = true
//        navigationController?.setNavigationBarHidden(true, animated: false)
//        self.navigationController?.navigationItem.hidesBackButton = true
////        playpauseView.layer.cornerRadius = 28.5
//        self.modalPresentationCapturesStatusBarAppearance = true
//        print("* Finished viewDidLoad()")
//        getCurrentTime()
//        self.defaults.set(nil, forKey: "idsForNeededCaptchas")
//
////        captchaController()
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//         if (self.defaults.array(forKey: "tasksArray") != nil){
//
//                    tempas = self.defaults.array(forKey: "tasksArray") as! [NSArray]
//                    print("* There are tasks:",tempas.count)
//        //            print(tempas.count)
//                    noTasks.isHidden = true
//                    playpauseView.isHidden = false
//                } else {
//            noTasks.isHidden = false
//                    playpauseView.isHidden = true
//                    print("* No tasks")
//                }
//
//    }
//    private func getCurrentTime() {
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.currentTime) , userInfo: nil, repeats: true)
//    }
//
//    @objc func currentTime() {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "hh:mm:ss a"
//        currentTimeLabel.text = formatter.string(from: Date())
//    }
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//        tasksTable.delegate = self
//                tasksTable.dataSource = self
//                tasksTable.separatorStyle = .none
//                tasksTable.rowHeight = 135
//
//                if (self.defaults.array(forKey: "tasksArray") != nil){
//
//                    tempas = self.defaults.array(forKey: "tasksArray") as! [NSArray]
//                    print("* There are tasks:",tempas.count)
//                    tasksTable.reloadData()
//        //            print(tempas.count)
//                    noTasks.isHidden = true
//                } else {
//                    print("* No tasks")
//                }
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
////    func tableView(_ tableView: UITableView,
////                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
////    {
////        let closeAction = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
////            print("OK, marked as Closed at index:",indexPath.row)
////                success(true)
////            })
////            closeAction.image = UIImage(named: "trash")
////            closeAction.backgroundColor = .clear
////
////            return UISwipeActionsConfiguration(actions: [closeAction])
////
////    }
//    func scheduleNotification(title: String, body: String) {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) {
//            (granted, error) in
//            if granted {
//                print("notifications granted")
//                let content = UNMutableNotificationContent()
//                content.title = title
////                content.subtitle = "from ioscreator.com"
//                content.body = body
//
//                // 2
////                let imageName = "applelogo"
////                guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
//
////                let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
//
////                content.attachments = [attachment]
//
//                // 3
//                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1000, repeats: false)
//                let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
//
//                // 4
//                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
//            } else {
//                print("notifications not granted")
//            }
//        }
//    }
//    func playCaptchaSound() {
//        print("* playing captcha sound")
//        guard let url = Bundle.main.url(forResource: "payment_failure", withExtension: "wav") else { return }
//
//        do {
//            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//            try AVAudioSession.sharedInstance().setActive(true)
//
//            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
//            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
//
//            /* iOS 10 and earlier require the following line:
//            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
//
//            guard let player = player else { return }
//
//            player.play()
//
//        } catch let error {
//            print(error.localizedDescription)
//        }
////        let pathToSound = Bundle.main.path(forResource: "payment_failure.m4a", ofType: nil)!
////        let url = URL(fileURLWithPath: pathToSound)
////
////        do {
////            player = try AVAudioPlayer(contentsOf: url)
////            player?.play()
////        } catch {
////
////        }
//    }
//    func playSuccessSound() {
//        guard let url = Bundle.main.url(forResource: "payment_success", withExtension: "wav") else { return }
//
//        do {
//            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//            try AVAudioSession.sharedInstance().setActive(true)
//
//            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
//            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
//
//            /* iOS 10 and earlier require the following line:
//            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
//
//            guard let player = player else { return }
//
//            player.play()
//
//        } catch let error {
//            print(error.localizedDescription)
//        }
//    }
//    func tableView(_ tableView: UITableView,
//                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
//    {
//        let modifyAction = UIContextualAction(style: .normal, title:  "", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
//            print("Delete at index:",indexPath.row)
////            defaults.set("Jackets", forKey: "category")
//            self.defaults.set(nil, forKey: "taskid-\(self.tempas[indexPath.row][6])")
//            self.tempas.remove(at: indexPath.row)
//            if(self.tempas.count == 0) {
//
//                self.defaults.set(nil, forKey: "tasksArray")
//                self.noTasks.isHidden = false
//                self.playpauseView.isHidden = true
//            } else {
//                self.defaults.set(self.tempas, forKey: "tasksArray")
//            }
//
////            self.tasksTable.reloadRows(at: indexPath.row, with: .automatic)
//            self.tasksTable.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
//            self.tasksTable.reloadData()
//            success(true)
//        })
////        modifyAction.image = UIImage(named: "trash")
//        let trashimage = UIImage(systemName: "trash")
//        modifyAction.image = trashimage?.withTintColor(hexStringToUIColor(hex: "#ed6361"), renderingMode: .alwaysOriginal)
////        modifyAction.image = UIImage(systemName: "trash")
////        modifyAction.
//        modifyAction.backgroundColor = UIColor(white: 1, alpha: 0.0)
//
//        return UISwipeActionsConfiguration(actions: [modifyAction])
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            print("tempas.count for numberOfRowsInSection: ",tempas.count)
//            return tempas.count
//        }
//
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "taskCellz", for: indexPath) as! tasksCell
//            //[[nnnn, coll, sizzs, profinam, capby, self.imageURLs[sender.tag]]]
////            make it look kinda nice
//            cell.productLabel.text = tempas[indexPath.row][0] as? String
//            if((tempas[indexPath.row][1] as! String).lowercased() != "n/a" && (tempas[indexPath.row][2] as! String).lowercased() != "n/a") {
//                cell.colorsizeLabel.text = "\(tempas[indexPath.row][1] as! String)/\(tempas[indexPath.row][2] as! String)"
//            } else if((tempas[indexPath.row][1] as! String).lowercased() != "n/a" && (tempas[indexPath.row][2] as! String).lowercased() == "n/a") {
//                cell.colorsizeLabel.text = "\(tempas[indexPath.row][1] as! String)"
//            } else if((tempas[indexPath.row][1] as! String).lowercased() == "n/a" && (tempas[indexPath.row][2] as! String).lowercased() != "n/a") {
//                cell.colorsizeLabel.text = "\(tempas[indexPath.row][2] as! String)"
//            } else if((tempas[indexPath.row][1] as! String).lowercased() == "n/a" && (tempas[indexPath.row][2] as! String).lowercased() == "n/a") {
//                cell.colorsizeLabel.text = "N/A"
//            }
//
//            cell.profilenameLabel.text = tempas[indexPath.row][3] as? String
//            cell.backgroundViewzz.layer.cornerRadius = 10;
//            cell.playButton.tag = indexPath.row
////            cell.progressView.setProgress(0, animated: false)
//            cell.progressView.transform = cell.progressView.transform.scaledBy(x: 1, y: 2)
//            cell.progressView.layer.masksToBounds = true
//            cell.progressView.isHidden = true
//            cell.playButton.addTarget(self, action: #selector(playTapped(_:)), for: .touchUpInside)
//            let backgroundView = UIView()
//            backgroundView.backgroundColor = .clear
//            cell.selectedBackgroundView = backgroundView
//                   cell.backgroundViewzz.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
//                   cell.backgroundViewzz.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
//                   cell.backgroundViewzz.layer.shadowOpacity = 1.0
//                   cell.backgroundViewzz.layer.shadowRadius = 8
//                   cell.backgroundViewzz.layer.masksToBounds = false
////            cell.productImageView.image = tempas[indexPath.row][3] as! String
//
//            print("Download Started")
//            //        let url = NSURL(string: "https://assets.supremenewyork.com/174597/zo/teldeNW25s1.jpg") as! URL
//                    print(tempas[indexPath.row][5] as! String)
//                    let urlls = "https://www.supremecommunity.com\(tempas[indexPath.row][5] as! String)"
//                    let url = NSURL(string: urlls) as! URL
//                    getData(from: url) { data, response, error in
//                        guard let data = data, error == nil else { return }
//                        print(response?.suggestedFilename ?? url.lastPathComponent)
//                        print("Download Finished")
//                        DispatchQueue.main.async() {
//                            cell.productImageView.image = UIImage(data: data)
//                            cell.productImageView.layer.cornerRadius = 7;
//                        }
//                    }
//
//
//
//        return cell
//        }
//    @IBAction func recaptchaClicked(sender: UIButton) {
//        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "captchaSolverViewController") as? captchaSolverViewController {
//                        if let navigator = navigationController {
//
//                            navigator.pushViewController(viewController, animated: true)
//
//                        }
//                    }
//    }
//    @IBAction func playAll(sender: UIButton){
////      println("You pressed me")
//        if (defaults.array(forKey: "tasksArray") != nil){
//
//                    let tempas22 = defaults.array(forKey: "tasksArray") as! [NSArray]
//                    print("* There are tasks:",tempas22.count)
//
//        //            print(tempas.count)
////                    noTasks.isHidden = true
//            print("there are this many rows: \(tasksTable.numberOfRows(inSection: 0))")
//            for i in 0...tasksTable.numberOfRows(inSection: 0)-1 {
//                let index = NSIndexPath(item: i, section: 0)
//                let cell = tasksTable.cellForRow(at: index as IndexPath) as! tasksCell
//                if(cell.playButton.currentImage != UIImage(systemName: "pause")) {
//                    cell.playButton.sendActions(for: .touchUpInside)
//                } else {
//                    print("Task is already running")
//                }
//
//            }
//                } else {
//                    print("* No tasks")
//                }
//    }
//    @IBAction func stopAll(sender: UIButton){
//    //      println("You pressed me")
//            if (defaults.array(forKey: "tasksArray") != nil){
//
//                        let tempas22 = defaults.array(forKey: "tasksArray") as! [NSArray]
//                        print("* There are tasks:",tempas22.count)
//
//            //            print(tempas.count)
//    //                    noTasks.isHidden = true
//                print("there are this many rows: \(tasksTable.numberOfRows(inSection: 0))")
//                for i in 0...tasksTable.numberOfRows(inSection: 0)-1 {
//                    let index = NSIndexPath(item: i, section: 0)
//                    let cell = tasksTable.cellForRow(at: index as IndexPath) as! tasksCell
//                    if(cell.playButton.currentImage == UIImage(systemName: "pause")) {
//                        cell.playButton.sendActions(for: .touchUpInside)
//                    } else {
//                        print("Task is not running")
//                    }
//
//                }
//                    } else {
//                        print("* No tasks")
//                    }
//        }
//    func capcap() {
//
//    }
//
//    func hexStringToUIColor (hex:String) -> UIColor {
//        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
//
//        if (cString.hasPrefix("#")) {
//            cString.remove(at: cString.startIndex)
//        }
//
//        if ((cString.count) != 6) {
//            return UIColor.gray
//        }
//
//        var rgbValue:UInt64 = 0
//        Scanner(string: cString).scanHexInt64(&rgbValue)
//
//        return UIColor(
//            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
//            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
//            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
//            alpha: CGFloat(1.0)
//        )
//    }
////    func luhnCheck(number: String) -> Bool {
////        var sum = 0
////        let digitStrings = number.characters.reverse().map { String($0) }
////
////        for tuple in digitStrings.enumerate() {
////            guard let digit = Int(tuple.element) else { return false }
////            let odd = tuple.index % 2 == 1
////
////            switch (odd, digit) {
////            case (true, 9):
////                sum += 9
////            case (true, 0...8):
////                sum += (digit * 2) % 9
////            default:
////                sum += digit
////            }
////        }
////
////        return sum % 10 == 0
////    }
//    func submitCheckout(sess: URLSession!, pure_carto: String!, cell: tasksCell!, sender: UIButton!, start: DispatchTime!, captchaatoken: String!, fullname: String!, email: String!, tel: String!, billing_address: String!, zip: String!, state: String!, city: String!, cardtype: String!, cardnum: String!, expiremonth: String!, expireyear: String!, cvc: String!, checkoutdelay: Float!) {
//        print("* Sending post req")
//        DispatchQueue.main.async {
//          cell.statusLabel.text = "• Going to checkout"
//     cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//      }
//
//    var checkoutparameters: DictionaryLiteral = ["":""]
//     if(captchaatoken != "") {
//      print("* Not an  captcha")
//       checkoutparameters = [
//                                                                                                                                                                                                                                                                                   "store_credit_id": "",
//                                                                                                                                                                                                                                                                         "from_mobile": "1",
//                                                                                                                                                                                                                                                                         "cookie-sub": pure_carto,
//                                                                                                                                                                                                                                                                         "same_as_billing_address":  "1",
//                                                                                                                                                                                                                                                                         "order[billing_name]":      "\(fullname ?? "")",
//                                                                                                                                                                                                                                                                         "order[email]":      "\(email ?? "")",
//                                                                                                                                                                                                                                                                         "order[tel]":      "\(tel ?? "")",
//                                                                                                                                                                                                                                                                         "order[billing_address]": "\(billing_address ?? "")",
//                                                                                                                                                                                                                                                                         "order[billing_address_2]": "",
//                                                                                                                                                                                                                                                                         "order[billing_zip]":      "\(zip ?? "")",
//                                                                                                                                                                                                                                                                         "order[billing_city]":      "\(city ?? "")",
//                                                                                                                                                                                                                                                                         "order[billing_state]":      "\(state ?? "")",
//                                                                                                                                                                                                                                                                         "order[billing_country]": "USA",
//                                                                                                                                                                                                                                                 "store_address":      "1",
//                                                                                                                                                                                                                                                 "credit_card[type]": "\(cardtype ?? "")",
//                                                                                                                                                                                                                                                                         "credit_card[carn]": "\(cardnum ?? "")",
//                                                                                                                                                                                                                                                                         "credit_card[month]": "\(expiremonth ?? "")",
//                                                                                                                                                                                                                                                                         "credit_card[year]": "20\(expireyear ?? "")",
//                                                                                                                                                                                                                                                                         "credit_card[vvv]": "\(cvc ?? "")",
//                                                                                                                                                                                                                                                                         "order[terms]": "0",
//                                                                                                                                                                                                                                                                         "order[terms]": "1",
//                                                                                                                                                                                                                                                                         "g-recaptcha-response": "\(captchaatoken ?? "")"
//
//                                                                                                                                                                                                                                                ]
//                                                                                                                                                                                                                                            } else {
//                                                                                                                                                                                                                                                print("* Empty Captcha")
//                                                                                                                                                                                                                                                checkoutparameters = [
//                                                                                                                                                                                                                                                                                   "store_credit_id": "",
//                                                                                                                                                                                                                                                                         "from_mobile": "1",
//                                                                                                                                                                                                                                                                         "cookie-sub": pure_carto,
//                                                                                                                                                                                                                                                                         "same_as_billing_address":  "1",
//                                                                                                                                                                                                                                                                         "order[billing_name]":      "\(fullname ?? "")",
//                                                                                                                                                                                                                                                                         "order[email]":      "\(email ?? "")",
//                                                                                                                                                                                                                                                                         "order[tel]":      "\(tel ?? "")",
//                                                                                                                                                                                                                                                                         "order[billing_address]": "\(billing_address ?? "")",
//                                                                                                                                                                                                                                                                         "order[billing_address_2]": "",
//                                                                                                                                                                                                                                                                         "order[billing_zip]":      "\(zip ?? "")",
//                                                                                                                                                                                                                                                                         "order[billing_city]":      "\(city ?? "")",
//                                                                                                                                                                                                                                                                         "order[billing_state]":      "\(state ?? "")",
//                                                                                                                                                                                                                                                                         "order[billing_country]": "USA",
//                                                                                                                                                                                                                                                 "store_address":      "1",
//                                                                                                                                                                                                                                                 "credit_card[type]": "\(cardtype ?? "")",
//                                                                                                                                                                                                                                                                         "credit_card[carn]": "\(cardnum ?? "")",
//                                                                                                                                                                                                                                                                         "credit_card[month]": "\(expiremonth ?? "")",
//                                                                                                                                                                                                                                                                         "credit_card[year]": "20\(expireyear ?? "")",
//                                                                                                                                                                                                                                                                         "credit_card[vvv]": "\(cvc ?? "")",
//                                                                                                                                                                                                                                                                         "order[terms]": "0",
//                                                                                                                                                                                                                                                                         "order[terms]": "1",
//                                                                                                                                                                                                                                                                         "g-recaptcha-response": ""
//
//                                                                                                                                                                                                                                                ]
//                                                                                                                                                                                                                                            }
//           print("* About to send request")
//           var checkout_request = URLRequest(url: URL(string: "https://www.supremenewyork.com/checkout.json")!)
//           checkout_request.setValue("Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Mobile/11D257", forHTTPHeaderField: "User-Agent")
//             checkout_request.setValue("application/json", forHTTPHeaderField: "Accept")
//             checkout_request.setValue("en-us", forHTTPHeaderField: "Accept-Language")
//             checkout_request.setValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
//             checkout_request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//             checkout_request.setValue("https://www.supremenewyork.com", forHTTPHeaderField: "Origin")
//             checkout_request.setValue("keep-alive", forHTTPHeaderField: "Connection")
//             checkout_request.setValue("keep-alive", forHTTPHeaderField: "Proxy-Connection")
//             checkout_request.setValue("gzip, deflate", forHTTPHeaderField: "Accept-Encoding")
//             checkout_request.setValue("www.supremenewyork.com", forHTTPHeaderField: "host")
//             checkout_request.setValue("\"*\"", forHTTPHeaderField: "If-None-Match")
//           checkout_request.setValue("https://www.supremenewyork.com/mobile/", forHTTPHeaderField: "Referer")
//           checkout_request.httpMethod = "POST"
//              let jar = HTTPCookieStorage.shared
//             let cookieHeaderField = ["Set-Cookie": "hasShownCookieNotice=1, lastVisitedFragment=checkout, pure_cart=\(pure_carto)"] // Or ["Set-Cookie": "key=value, key2=value2"] for multiple cookies
//             let cookies = HTTPCookie.cookies(withResponseHeaderFields: cookieHeaderField, for: URL(string: "https://www.supremenewyork.com")!)
//             jar.setCookies(cookies, for: URL(string: "https://www.supremenewyork.com")!, mainDocumentURL: URL(string: "https://www.supremenewyork.com")!)
//             print("* Done setting cookies, continuing")
//             checkout_request.httpBody =                      checkoutparameters.percentEncoded()
//              print("\(String(decoding: checkoutparameters.percentEncoded()!, as: UTF8.self))")
//              print("* Sending..")
//              print(checkout_request)
//              DispatchQueue.main.async {
//                      cell.statusLabel.text = "• Waiting \(checkoutdelay as! Float)s"
//
//                                                                                                                                                                                                                                                                                                                                        cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//                                                                                                                                                                                                                                                                                                                                    }
//        DispatchQueue.main.asyncAfter(deadline: .now() + Double(checkoutdelay)) {
//              let checkouttask = sess.dataTask(with: checkout_request) { data3, response3, error3 in
//                print(data3)
//                  guard let data3 = data3,
//                    let response3 = response3 as? HTTPURLResponse,
//                           error3 == nil else {                                              // check for fundamental networking error
//                         print("error", error3 ?? "Unknown error")
//                                                                                                                                                                                                                                                    print("* removing cookies")
//                         if error3?._code == -1001 {
//                                                                                                                                                                                                                                                     //Domain=NSURLErrorDomain Code=-1001 "The request timed out."
//                        print("* request timed out")
//                        DispatchQueue.main.async {
//                        cell.statusLabel.text = "• Retrying"
//                        cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//                         }
//                      usleep(1000000) //will sleep for 2.5 seconds
//                   DispatchQueue.main.async {
//                   sender.setImage(UIImage(systemName: "play"), for: .normal)
//                            cell.playButton.sendActions(for: .touchUpInside)
//                                                                                                                                                                                                                                                                                                                                }
//
//                                                                                                                                                                                                                                                                                        return
//                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                    let cstorage = HTTPCookieStorage.shared
//                                                                    //                                                                                                                                                                                if let cookies3 = cstorage.cookies(for:  URL(string: "https://www.supremenewyork.com")!) {
//                                                                    //                                                                                                                                                                                 for cookie in cookies3 {
//                                                                    //                                                                                                                                                                                     cstorage.deleteCookie(cookie)
//                                                                    //                                                                                                                                                                                 }
//                                                                    //
//                                                                    //                                                                                                                                                                                }
//
//                                                                                                                                                                                                                                                return
//                                                                                                                                                                                                                                            }
//
//          guard (200 ... 299) ~= response3.statusCode else {                    // check for http errors
//               print("statusCode should be 2xx, but is \(response3.statusCode)")
//                      print("response = \(response3)")
//                              print("* removing cookies")
//                let cstorage = HTTPCookieStorage.shared
//                     if let cookies3 = cstorage.cookies(for:  URL(string: "https://www.supremenewyork.com")!) {
//                         for cookie in cookies3 {
//                                                                                                                                                                                                                                                     cstorage.deleteCookie(cookie)
//                                                                                                                                                                                                                                                 }}
//            print("* retrying")
//            self.submitCheckout(sess: sess, pure_carto: pure_carto, cell: cell, sender: sender, start: start, captchaatoken: captchaatoken, fullname: fullname, email: email, tel: tel, billing_address: billing_address, zip: zip, state: state, city: city, cardtype: cardtype, cardnum: cardnum, expiremonth: expiremonth, expireyear: expireyear, cvc: cvc, checkoutdelay: checkoutdelay)
//
//                                                                                                                                            return
//                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                let responseString4 = JSON(data3)
//                                                                                                                                                                                                                                                print("responseString = \(responseString4)")
//                                                                                                                                                                                                                                                if(responseString4 == nil || responseString4 == "") {
//                                                                                                                                                                                                                                                    DispatchQueue.main.async {
//                                                                                                                                                                                                                                                        let end = DispatchTime.now()   // <<<<<<<<<<   end time
//                                                                                                                                                                                                                                                        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
//                                                                                                                                                                                                                                                        let timeInterval = Double(nanoTime) / 1_000_000_000 //
//                                                                                                                                                                                                                                                         cell.statusLabel.text = "• Checkout Failed (\(Double(round(10*timeInterval)/10))s)"
//                                                                                                                                                                                                                                                        self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                                       //#8c96e9
//                                                                                                                                                                                                                                                                                                                                       cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
//                                                                                                                                                                                                                                                        sender.setImage(UIImage(systemName: "play"), for: .normal)
//
//                                                                                                                                                                                                                                                    }
//
//                                                                                                                                                                                                                                                } else if(responseString4["status"] == "outOfStock") {
//                                                                                                                                                                                                                                                DispatchQueue.main.async {
//                                                                                                                                                                                                                                                    let end = DispatchTime.now()   // <<<<<<<<<<   end time
//                                                                                                                                                                                                                                                    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
//                                                                                                                                                                                                                                                    let timeInterval = Double(nanoTime) / 1_000_000_000 //
//                                                                                                                                                                                                                                                     cell.statusLabel.text = "• outOfStock (\(Double(round(10*timeInterval)/10))s)"
//                                                                                                                                                                                                                                                    self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                                   //#8c96e9
//                                                                                                                                                                                                                                                                                                                                   cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
//                                                                                                                                                                                                                                                    sender.setImage(UIImage(systemName: "play"), for: .normal)
//
//                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                } else if(responseString4["status"] == "failed"){
//                                                                                                                                                                                                                                                    DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                                                                                                               let end = DispatchTime.now()   // <<<<<<<<<<   end time
//                                                                                                                                                                                                                                                                                                                                                                               let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
//                                                                                                                                                                                                                                                                                                                                                                               let timeInterval = Double(nanoTime) / 1_000_000_000 //
//                                                                                                                                                                                                                                                                                                                                                                                cell.statusLabel.text = "• Checkout Failed (\(Double(round(10*timeInterval)/10))s)"
//                                                                                                                                                                                                                                                                                                                                                                               self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                                                                                                                                                              //#8c96e9
//                                                                                                                                                                                                                                                                                                                                                                                                                                                              cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
//                                                                                                                                                                                                                                                                                                                                                                               sender.setImage(UIImage(systemName: "play"), for: .normal)
//
//                                                                                                                                                                                                                                                                                                                                                                           }
//                                                                                                                                                                                                                                                } else if(responseString4["status"] == "queued"){
//                                                                                                                                                                                                                                                    DispatchQueue.main.async {
//
//                                                                                                                                                                                                                                                         cell.statusLabel.text = "• Processing"
//                                                                                                                            //                                                                                                                            self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")                                                                 //#8c96e9
//                                                                                                                                                                                                                                                                                                                                       cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
//
//                                                                                                                            //                                                                                                                            sender.setImage(UIImage(systemName: "play"), for: .normal)
//
//        //                                                                                                                                                                                                                                                self.playSuccessSound()
//                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                    let slug = responseString4["slug"]
//                                                                                                                                                                                                                                                    let slug_url = "https://www.supremenewyork.com/checkout/\(slug as! String)/status.json"
//                                                                                                                                                                                                                                                    print("* checking status at - \(slug_url)")
//        //                                                                                                                                                                                                                                            var slug_request = URLRequest(url: URL(string: slug_url)!)
//                                                                                                                                                                                                                                                    guard let slurl = URL(string: slug_url) else {return}
//                                                                                                                                                                                                                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
//                                                  sess.dataTask(with: slurl) { data169, response169, error169 in
//                                                                                                                                                                                                                                                                                                                    print("* Parsing data")
//                                                                                                                                                                                                                                                                                  if let data169 = data169 {
//                                                                                                                                                                                                                                                                                                                        if let jsonString = String(data: data169, encoding: .utf8) {
//                                                                                                                                                                                                                                                    //                                                                        print(jsonString)
//                                                                                                                                                                                                                                                                                                                            do{
//                                                                                                                                                                                                                                                                                                                                let slugjson = try JSONSerialization.jsonObject(with: data169, options: []) as! [String: AnyObject]
//                                                                                                                                                                                                                                                                                                                                if((slugjson["status"] as! String).lowercased() == "queued") {
//                                                                                                                                                                                                                                                                                                                                    DispatchQueue.main.async {                                                                                                                                                                                                    cell.statusLabel.text = "• Check Email"
//                                                                                                                                                                                                                                                                                                                                    self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                                                                                                                   //#8c96e9
//                                                                                                                                                                                                                                                                                                                                                                                                                   cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#f9cf46")
//                                                                                                                                                                                                                                                                                                                                        sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                                                                } else if((slugjson["status"] as! String).lowercased() == "failed") {
//                                                                                                                                                                                                                                                                                                                                    DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                                                                        let end = DispatchTime.now()   // <<<<<<<<<<   end time
//                                                                                                                                                                                                                                                                                                                                        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
//                                                                                                                                                                                                                                                                                                                                        let timeInterval = Double(nanoTime) / 1_000_000_000 //
//                                                                                                                                                                                                                                                                                                                                         cell.statusLabel.text = "• Checkout Failed (\(Double(round(10*timeInterval)/10))s)"
//                                                                                                                                                                                                                                                                                                                                        self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                                                                                                                       //#8c96e9
//                                                                                                                                                                                                                                                                                                                                                                                                                       cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
//                                                                                                                                                                                                                                                                                                                                        sender.setImage(UIImage(systemName: "play"), for: .normal)
//
//                                                                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                                                                }else if((slugjson["status"] as! String).lowercased() == "outofstock") {
//                                                                                                                                                                                                                                                                                                                                    DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                                                                        let end = DispatchTime.now()   // <<<<<<<<<<   end time
//                                                                                                                                                                                                                                                                                                                                        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
//                                                                                                                                                                                                                                                                                                                                        let timeInterval = Double(nanoTime) / 1_000_000_000 //
//                                                                                                                                                                                                                                                                                                                                         cell.statusLabel.text = "• Checkout Failed (\(Double(round(10*timeInterval)/10))s)"
//                                                                                                                                                                                                                                                                                                                                        self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                                                                                                                       //#8c96e9
//                                                                                                                                                                                                                                                                                                                                                                                                                       cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
//                                                                                                                                                                                                                                                                                                                                        sender.setImage(UIImage(systemName: "play"), for: .normal)
//
//                                                                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                                                                } else {
//                                                                                                                                                                                                                                                                                                                                    DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                                                                    cell.statusLabel.text = "• Successfully Checked Out!"
//
//                                                                                                                                                                                                                                                                                                                                      cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#94f294")
//                                                                                                                                                                                                                                                                                                                                        sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                                                                                                                                                                                                                        self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                                                                            } catch {
//                                                                                                                                                                                                                                                                                                                                print("* error parsing slug")
//                                                                                                               DispatchQueue.main.async {                                                                                                                                                                                                    cell.statusLabel.text = "• Check Email"
//                                                                                                                                                                                                                                                                                                                                self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                                                                                                               //#8c96e9
//                                                                                                                                                                                                                                                                                                                                                                                                               cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#f9cf46")
//                                                                                                                                                                                                                                                                                                                                sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                        }.resume()
//
//                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                } else {
//                                                                                                                                                                                                                                                    DispatchQueue.main.async {
//                                                                                                                                                                                                                                                        let end = DispatchTime.now()   // <<<<<<<<<<   end time
//                                                                                                                                                                                                                                                        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
//                                                                                                                                                                                                                                                        let timeInterval = Double(nanoTime) / 1_000_000_000 //
//                                                                                                                                                                                                                                                         cell.statusLabel.text = "• Checkout Error (\(Double(round(10*timeInterval)/10))s)"
//                                                                                                                                                                                                                                                        self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                                       //#8c96e9
//                                                                                                                                                                                                                                                                                                                                       cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
//        //                                                                                                                                                                                                                                                sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                                                                                                                                        usleep(2000000) //will sleep for 2.5 seconds
//                                                                                                                                                                                                                                                                        DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                              sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                                                                                                                                                                                                                    cell.playButton.sendActions(for: .touchUpInside)
//                                                                                                                                                                                                                                                        //                                                    queue.stop
//                                                                                                                                                                                                                                                                                                                                }
//
//                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                }
//                                                                                                                            //                                                                                                                    let sss = responseString4 as! String
//                                                                                                                                                                                                                                               print((response3.allHeaderFields as NSDictionary))
//                                                                                                                            //                                                                                                                    print(response.headers)
//                                                                                                                                                                                                                                                print("* removing cookies")
//                                                                                                                                                                                                                                                let cstorage = HTTPCookieStorage.shared
//                                                                                                                                                                                                                                                if let cookies3 = cstorage.cookies(for:  URL(string: "https://www.supremenewyork.com")!) {
//                                                                                                                                                                                                                                                 for cookie in cookies3 {
//                                                                                                                                                                                                                                                     cstorage.deleteCookie(cookie)
//                                                                                                                                                                                                                                                 }}
//
//                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                            checkouttask.resume()
//                                                                                                                                                                                                                                        }
//
//
//                                                                                                                                                                                                                                    print("* Out of thing")
//    }
//    func matchesRegex(regex: String!, text: String!) -> Bool {
//        do {
//            let regex = try NSRegularExpression(pattern: regex, options: [.caseInsensitive])
//            let nsString = text as NSString
//            let match = regex.firstMatch(in: text, options: [], range: NSMakeRange(0, nsString.length))
//            return (match != nil)
//        } catch {
//            return false
//        }
//    }
//    func checkCardNumber(input: String) -> (type: CardType, formatted: String, valid: Bool) {
//        // Get only numbers from the input string
//
//        let numberOnly = input.replacingOccurrences(of: "[^0-9]", with: "") as! String
//
//        var type: CardType = .Unknown
//        var formatted = ""
//        var valid = false
//
//        // detect card type
//        for card in CardType.allCards {
//            if (matchesRegex(regex: card.regex, text: numberOnly)) {
//                type = card
//                break
//            }
//        }
//
//        // check validity
////        valid = luhnCheck(number: numberOnly)
//
//        // format
//        var formatted4 = ""
////        for character in numberOnly.characters {
////            if formatted4.characters.count == 4 {
////                formatted += formatted4 + " "
////                formatted4 = ""
////            }
////            formatted4.append(character)
////        }
//
//        formatted += formatted4 // the rest
//
//        // return the tuple
//        return (type, formatted, true)
//    }
//    @objc func playTapped(_ sender: UIButton){
////        self.playCaptchaSound()
//        print("Thread: threadforid-\(tempas[sender.tag][6])")
//        var queue = DispatchQueue(label: "threadforid-\(tempas[sender.tag][6])", qos: .utility)
//        print("* Starting task for item:",tempas[sender.tag][0])
//        var currentid = self.defaults.string(forKey: "taskid-\(self.tempas[sender.tag][6])")
////        print("* sleeping 3.5 sec")
//        var currrid = self.tempas[sender.tag][6]
////        usleep(2500000) //will sleep for 2.5 seconds
////        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
////        playSuccessSound()
////            playCaptchaSound()
////        print(sender.imageView?.image?)
//        print("* continuing")
//        if(sender.currentImage == UIImage(systemName: "pause") ) {
//            print("Gotta stop it bby")
////            sender.setImage(UIImage(systemName: "play"), for: .normal)
//            let indexPath = NSIndexPath(row: sender.tag, section: 0)
//            let cell = self.tasksTable.cellForRow(at: indexPath as IndexPath) as! tasksCell
//            cell.statusLabel.text = "• Stopping.."
//            self.defaults.set("STOPNOW", forKey: "taskid-\(self.tempas[sender.tag][6])")
//            //#8c96e9
//            cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
//
//        } else {
////            scheduleNotification(title: "Captcha Required", body: "Press to continue")
//            if(self.defaults.string(forKey: "taskid-\(self.tempas[sender.tag][6])") != "STOPNOW"){
////                print(tempas[sender.tag])
//
//                sender.setImage(UIImage(systemName: "pause"), for: .normal)
//          var start = DispatchTime.now() // <<<<<<<<<< Start time
//             self.defaults.set("RUNNING", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                 let indexPath = NSIndexPath(row: sender.tag, section: 0)
//              var tassk = self.tempas[sender.tag][6]
//              let cell = self.tasksTable.cellForRow(at: indexPath as IndexPath) as! tasksCell
////             cell.statusLabel.text = "• Finding item"
////                            //TASK ID: tempas[sender.tag][6]
////                print(self.tempas[sender.tag][6])
////                            //#8c96e9
////              cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//              var catetogo = self.tempas[sender.tag][7]
//            var nammeee = self.tempas[sender.tag][0]
//               var found = false
//            var sensen = sender.tag
//            var exactisfound = false
//                var name = "Johnny Dough"
//                var email = "alsidjasldj@gmail.com"
//                var tel="999-999-9999"
//                var billing_address="1234 Rando Address"
//                var billing_zip="30545"
//                var billing_city="Helen"
//                var billing_state="GA"
//
//                var card_type="visa"
//                var card_num="4242 4242 4242 4242"
//                var cardmonth="11"
//                var cardyear="2021"
//                var cardvall="777"
//                var checkoutdelay = Float(2500)
//
//                //            var session:SessionManager?
//                if(self.defaults.array(forKey: "profilesArray") != nil) {
//
//                            if(self.defaults.array(forKey: "profilesArray")!.count != 0) {
//                //            profilesArray = []
////                                profileNa.text = (self.defaults.array(forKey: "profilesArray")![0] as! NSArray)[0] as! String
//                                let profiles = self.defaults.array(forKey: "profilesArray")! as! NSArray
////                                [[profilename, firstname, lastname, email, address, phonenum, city, state, zipcode, checkoutdelay, profileId]]
//                                for g in 0...profiles.count-1 {
//                                    if((profiles[g] as! NSArray)[0] as! String == tempas[sender.tag][3] as! String) {
//                                        print("* Found profile: \(tempas[sender.tag][3])")
//                                        name = "\((profiles[g] as! NSArray)[1] as! String) \((profiles[g] as! NSArray)[2] as! String)"
//                                        print("* complete name: \(name)")
//                                        email = (profiles[g] as! NSArray)[3] as! String
//                                        tel = (profiles[g] as! NSArray)[5] as! String
//                                        billing_address = (profiles[g] as! NSArray)[4] as! String
//                                        billing_zip = (profiles[g] as! NSArray)[8] as! String
//                                        billing_city = (profiles[g] as! NSArray)[6] as! String
//                                        billing_state = (profiles[g] as! NSArray)[7] as! String
//                                        checkoutdelay = Float((profiles[g] as! NSArray)[9] as! String)!
//                                        let profid = (profiles[g] as! NSArray)[10] as! String
//                                        card_num = KeychainWrapper.standard.string(forKey: "cardnum-\(profid)")!
//                                        cardmonth = KeychainWrapper.standard.string(forKey: "cardExpireMonth-\(profid)")!
//                                        cardyear = KeychainWrapper.standard.string(forKey: "cardExpireYear-\(profid)")!
//                                        cardvall = KeychainWrapper.standard.string(forKey: "cvc-\(profid)")!
////                                        print("* cardnum: \(card_num) expires \(cardmonth)/\(cardyear)")
//
////                                        let (type, formatted, valid) = checkCardNumber(input: card_num)
////
//                                        var type = ""
//                                        for card in CardType.allCards {
//                                            if (matchesRegex(regex: card.regex, text: card_num.replacingOccurrences(of: " ", with: ""))) {
//                                                type = card.rawValue
////                                                break
//                                            }
//                                        }
//
//                                        card_type = type
////                                        matchesRegex
////                                        print("* card type is \(type as! String)")
//                                    }
//                             }
//
//                            }
//                        }
//                checkoutdelay = Float(checkoutdelay/1000)
//                print("* card type - \(card_type)")
//                print("* add - \(billing_address)")
//                print("* new checkoutdelay (s) - \(checkoutdelay)")
//              queue.async {
//                   var pookyenabled = true
//                      var founditemid = 0
//                //                repeat {
//                //                    usleep(1000000)
//                //                } while self.defaults.string(forKey: "currentCaptchaId") != "0"
//                //                print("* current captchaID == 0, setting")
//                 if(currentid != "STOPNOW") {
//                    DispatchQueue.main.async {
//                    sender.setImage(UIImage(systemName: "pause"), for: .normal)
//                    }
//                //                    usleep(2500000)
//                      print("no stop, continuing")
//                      var found = false
//                      guard let url = URL(string: "https://www.supremenewyork.com/mobile_stock.json") else {return}
//                      print("* Downloading from url: \(url)")
//
//                //                    DispatchQueue.main.async {
//                //                    self.playCaptchaSound()
//                //                    }
//                      if let url = URL(string: "https://www.supremenewyork.com/mobile_stock.json") {
//                        let configuration = URLSessionConfiguration.ephemeral
//                        configuration.timeoutIntervalForResource = 6
//                        if #available(iOS 11, *) {
//                            print("* enabling configuration")
//                          configuration.waitsForConnectivity = true
//                        }
//                      let sess = URLSession.init(configuration: configuration)
//                        var isrestockInstance = false
//                        DispatchQueue.main.async {
//                            print("* stat label text: \(cell.statusLabel.text!)")
//                            if((cell.statusLabel.text!.contains("restock"))) {
//                            print("* statusLabel is waiting for restock")
//                            isrestockInstance = true
//                        } else {
//                            print("* not restock")
//                            isrestockInstance = false
//                        }
//                            cell.statusLabel.text = "• Finding item"
//                                          //TASK ID: tempas[sender.tag][6]
//                              print(self.tempas[sender.tag][6])
//                                          //#8c96e9
//                            cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//                        }
////                        sess.configuration.timeoutIntervalForRequest = 8
////                        20 second timeout interval
////                        sess.configuration.timeoutIntervalForRequest = 20
//
//                //                        .dataTask
//                      sess.dataTask(with: url) { data, response, error in
//                        if error != nil {
//                            if error!._code == -1001 {
//                                print("* timeout error")
//                                DispatchQueue.main.async {
//                                                                                          cell.statusLabel.text = "• Retrying"
//                                                                                                                            //TASK ID: tempas[sender.tag][6]
//                                //                                                                                            print(tempas[sender.tag][6])
//                                                                                                                            //#8c96e9
//                                                                                                                            cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//                                                                                                                        }
////                                                                                             print("* Item not found, wait for drop")
//                                                                                                usleep(2000000) //will sleep for 2.5 seconds
//                                                                                        DispatchQueue.main.async {
//                                                                                                              sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                                    cell.playButton.sendActions(for: .touchUpInside)
//                                                                        //                                                    queue.stop
//                                                                                                                                                }
//
//                                return
//                            } else {
//                            print("* error: \(error)")
//                            }
//                        }
//                           if let data = data {
//                            if let jsonString = String(data: data, encoding: .utf8) {
//                //                                print(jsonString)
//                               do{
//                                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
//                                                    // try to read out a string array
//                                    print("* Parsing data")
//                                if(catetogo as! String == "T-shirts") {
//                                    catetogo = "T-Shirts"
//                                }
//
//                                    var category = json["products_and_categories"]![catetogo]
//                //                                    print(category)
//                //                                    captchaSolverViewController.currentTaskId = self.tempas[sender.tag][6] as! Int
//
//                //                                    var capSolver = captchaSolverViewController()
//                //                                    captchaSolverViewController.currentTaskId = self.tempas[sender.tag][6] as! Int
//                //                                    capSolver.startSolver()
////                                           print(json)
//
//                                     if let alksjdlaks = category as? NSArray{
//                                           print("* valid nsarray")
//                                            var items = category as! NSArray
//                                            for i in 0...items.count-1 {
//
//                                            if(found == false) {
//                                                    var item = items[i] as! [String: AnyObject]
//                                                    print(item["name"] as! String)
//                                                    if(i == items.count-1 && (item["name"] as! String).lowercased() != (nammeee as! String).lowercased() && found == false) {
//                                                       DispatchQueue.main.async {
//                                                                          cell.statusLabel.text = "• Waiting for drop"
//                                                                                                            //TASK ID: tempas[sender.tag][6]
//                //                                                                                            print(tempas[sender.tag][6])
//                                                                                                            //#8c96e9
//                                                                                                            cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//                                                                                                        }
//                                                                             print("* Item not found, wait for drop")
//                                                                                usleep(2500000) //will sleep for 2.5 seconds
//                                                                        DispatchQueue.main.async {
//                                                                                              sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                    cell.playButton.sendActions(for: .touchUpInside)
//                                                        //                                                    queue.stop
//                                                                                                                                }
//                                                    } else {
//                                                    if((item["name"] as! String).lowercased() == (nammeee as! String).lowercased()) {
//                                                                print("Found item")
//                                                               found = true
//                                                               DispatchQueue.main.async {
//                                                                 cell.statusLabel.text = "• Found item - \(item["name"] as! String)"
//
//                                                                   cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#94f294")
//
//                                                                                                            // Do all your UI stuff here
//}
//                                                        exactisfound = true
//                                                                    founditemid = item["id"] as! Int
//                                                                         print("* Checking for pooky")
//                                                                         let myURLString = "https://www.supremenewyork.com/mobile"
//                                                                            guard let myURL = URL(string: myURLString) else {
//                                                                                                            print("Error: \(myURLString) doesn't seem to be a valid URL")
//                                                                                                            return
//                                                                                                        }
//                                                                                do {
//                                                                                let myHTMLString = try String(contentsOf: myURL, encoding: .ascii)
//
//                //                                                                                                print("* Pooky is disabled, using request method")
//                                                                                       pookyenabled = false
//                                                                                  if(self.defaults.string(forKey: "taskid-\(self.tempas[sensen][6])") != "STOPNOW" || self.defaults.string(forKey: "taskid-\(self.tempas[sensen][6])") == nil){
//                                                                                       var itemurl = "https://www.supremenewyork.com/shop/\(founditemid).json"
//                                                                                       print("* Requesting:",itemurl)
//                                                                                          guard let acurl = URL(string: itemurl) else {return}
//                                                                                         sess.dataTask(with: acurl) { data2, response, error9 in
//                                                                                                                        print("* Parsing data")
//
//                                                                                            if error9 != nil {                                            // check for fundamental networking error
//                                                                                            print("error", error9 ?? "Unknown error")
//                                                                                            if error9?._code == -1001 {
//                                                                                             //Domain=NSURLErrorDomain Code=-1001 "The request timed out."
//                                                                                                print("* request timed out")
//                                                                                                DispatchQueue.main.async {
//                                                                                                                                                                                          cell.statusLabel.text = "• Retrying"
//                                                                                                                                                                                                                            //TASK ID: tempas[sender.tag][6]
//                                                                                                                                //                                                                                            print(tempas[sender.tag][6])
//                                                                                                                                                                                                                            //#8c96e9
//                                                                                                                                                                                                                            cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//                                                                                                                                                                                                                        }
//                                                                                                //                                                                                             print("* Item not found, wait for drop")
//                                                                                                                                                                                                usleep(2000000) //will sleep for 2.5 seconds
//                                                                                                                                                                                        DispatchQueue.main.async {
//                                                                                                                                                                                                              sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                                                                                                                                    cell.playButton.sendActions(for: .touchUpInside)
//                                                                                                                                                                        //                                                    queue.stop
//                                                                                                                                                                                                                                                }
//
//                                                                                                                                return
//                                                                                            }
//                                                                                            }
//                                                                                      if let data2 = data2 {
//                                                                                                                            if let jsonString = String(data: data2, encoding: .utf8) {
//                                                        //                                                                        print(jsonString)
//                                                                                                                                do{
//                                                                                                                                    let itemjson = try JSONSerialization.jsonObject(with: data2, options: []) as! [String: AnyObject]
//                                                                                                   let styles = itemjson["styles"]
////                                                                                                if color is random
//                                                                                                   var aRandomInt = Int.random(in: 0...(styles?.count)!-1) as! Int
//                                                                                                print("* Random style with (\(aRandomInt as! Int)) is \(((((styles as! NSArray)[aRandomInt]) as! [String: AnyObject])["name"] as! String))")
//                                                                                               if((self.tempas[sensen][2] as! String).lowercased() == "random") {
////                                                                                                      st = ((((styles as! NSArray)[aRandomInt]) as! [String: AnyObject])["id"] as! String)
//                                                                                                 }
//                                                                                                     var st = 0
//                                                                                                    var s = 0
//                                                                       if((self.tempas[sensen][1] as! String).lowercased() == "n/a" && (self.tempas[sensen][2] as! String).lowercased() == "n/a") {
//                                                                                st = ((styles as! NSArray)[0] as! [String: AnyObject])["id"] as! Int
//                                                                               s = ((((styles as! NSArray)[0] as! [String: AnyObject])["sizes"] as! NSArray)[0] as! [String: AnyObject])["id"] as! Int
//                                                                    }
////                                                                                                    else {
////
////                                                                                       }
//                                                         for j in 0...(styles as! NSArray).count-1 {
//
//                                                            if(((((styles as! NSArray)[j]) as! [String: AnyObject])["name"] as! String).lowercased().contains((self.tempas[sensen][1] as! String).lowercased()) || (styles as! NSArray).count == 1 || (self.tempas[sensen][1] as! String).lowercased() == "n/a") {
//                                                                if((styles as! NSArray).count == 1 || (self.tempas[sensen][1] as! String).lowercased() == "n/a") {
//                                                                    print("* only one style or was n/a, choosing first")
//                                                                    st = ((styles as! NSArray)[0] as! [String: AnyObject])["id"] as! Int
////                                                                    s = ((((styles as! NSArray)[0] as! [String: AnyObject])["sizes"] as! NSArray)[0] as! [String: AnyObject])["id"] as! Int
//
//                                                                } else {
//                                                                    if(((((styles as! NSArray)[j]) as! [String: AnyObject])["name"] as! String).lowercased().contains((self.tempas[sensen][1] as! String).lowercased())) {
//                                                                        print("* Found color:",((((styles as! NSArray)[j]) as! [String: AnyObject])["name"] as! String))
//                                                                        print("* StyleID:",((((styles as! NSArray)[j]) as! [String: AnyObject])["id"]) as! Int)
//                                                                        st = ((((styles as! NSArray)[j]) as! [String: AnyObject])["id"]) as! Int
//                                                                    }
//
//                                                                }
//
//                                                                if(myHTMLString.lowercased().contains("pooky")) {
//                                                                    print("* Pooky is enabled, using browser method")
//                                                                                                                pookyenabled = true
////                                                                    if self.window.rootViewController is tasksViewController {
//                                                                    DispatchQueue.main.async {
//                                                                        cell.statusLabel.text = "• pooky enabled"
//                                                                                                                 self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                              //#8c96e9
//                                                                              cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
//                                                                                sender.setImage(UIImage(systemName: "play"), for: .normal)
////
//
//
//                                                                    }
//                                                                    DispatchQueue.main.async {
//                                                                    if let topController = UIApplication.topViewController() {
//                                                                    //    print("* top viewcontroller: \()")
//                                                                    //    if((topController as! String).contains("tasksViewController")) {
//                                                                        if(topController is tasksViewController) {
//                                                                            print("* present the thing")
//                                                                            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "pookyViewController") as? pookyViewController {
//                                                                                if let navigator = self.navigationController {
//
//                                                                                        navigator.pushViewController(viewController, animated: true)
//
//                                                                                  }
//                                                                               }
//                                                                        }
//
//                                                                    //    }
//
//
//                                                                    }
//
//
//                                                                    //                    }
//                                                                                            //do something if it's an instance of that class
//
//
//                                                                                    }
//
//
//
//                                                                                             } else {
//                                                                                           print("* Pooky is disabled, using request method")
//                                                                                                  pookyenabled = false
//                                                               for o in 0...((((itemjson["styles"] as! NSArray)[j]) as! [String: AnyObject])["sizes"] as! NSArray).count-1 {
//                //                                                                                                    check to see if size is same
//                                                                var instock = false
//                                                     if((((((((((itemjson["styles"] as! NSArray)[j]) as! [String: AnyObject])["sizes"] as! NSArray)[o]) as! [String: AnyObject])["name"] as! String).lowercased() as AnyObject) as! String) == ((self.tempas[sensen][2] as! String).lowercased()) || (self.tempas[sensen][2] as! String).lowercased() == "n/a") {
//                                                        if((self.tempas[sensen][2] as! String).lowercased() == "n/a") {
//                                                            s = (((((((itemjson["styles"] as! NSArray)[j]) as! [String: AnyObject])["sizes"] as! NSArray)[0]) as! [String: AnyObject])["id"] as! Int)
//
//                                                            print("* Found sizeID:",((((((((itemjson["styles"] as! NSArray)[j]) as! [String: AnyObject])["sizes"] as! NSArray)[0]) as! [String: AnyObject])["id"] as! Int)))
//                                                            print("* stocklevel: \((((((((itemjson["styles"] as! NSArray)[j]) as! [String: AnyObject])["sizes"] as! NSArray)[0]) as! [String: AnyObject])["stock_level"] as! Int))")
//                                                            if((((((((itemjson["styles"] as! NSArray)[j]) as! [String: AnyObject])["sizes"] as! NSArray)[o]) as! [String: AnyObject])["stock_level"] as! Int) == 0) {
//                                                                print("* thing is out of stock")
//                                                                instock = false
//
//                                                            } else {
//                                                                print("* in stock")
//                                                                instock = true
//                                                            }
//                                                        } else {
//                                                            s = (((((((itemjson["styles"] as! NSArray)[j]) as! [String: AnyObject])["sizes"] as! NSArray)[o]) as! [String: AnyObject])["id"] as! Int)
//                                                            print("* Found sizeID:",((((((((itemjson["styles"] as! NSArray)[j]) as! [String: AnyObject])["sizes"] as! NSArray)[o]) as! [String: AnyObject])["id"] as! Int)))
//                                                            print("* stocklevel: \((((((((itemjson["styles"] as! NSArray)[j]) as! [String: AnyObject])["sizes"] as! NSArray)[o]) as! [String: AnyObject])["stock_level"] as! Int))")
//                                                            if((((((((itemjson["styles"] as! NSArray)[j]) as! [String: AnyObject])["sizes"] as! NSArray)[o]) as! [String: AnyObject])["stock_level"] as! Int) == 0) {
//                                                                print("* thing is out of stock")
//                                                                instock = false
//                                                            } else {
//                                                                print("* in stock")
//                                                                instock = true
//                                                            }
//                                                        }
//                                                        let calculated_pure_cart = "{\"\(s)\":1}"
////                                                        print("* expected pure cart: \(calculated_pure_cart), encoded: \()")
//                                                        let encoded_calculated_pure_cart = calculated_pure_cart.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) as! String
//                                                        print("* pure_cart (expected): \(encoded_calculated_pure_cart)")
//                                                        if(instock == true) {
//                                                            if(isrestockInstance == true) {
//                                                                print("* Going straight to cart with exptected pure_cart")
//                                                                var captchaatoken = ""
//                              if(self.tempas[sensen][4] as! Bool == true) {
//                     print("* Captcha bypass on")
//                  captchaatoken = ""
//                } else {
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                     print("* Starting captcha harvester")
// DispatchQueue.main.async {
//                                                                //                                                                                                                                                                                                                                            self.playCaptchaSound()
//                                                                                                                                                                                                                                                                                                            self.scheduleNotification(title: "Captcha Required", body: "Press to continue")
//                                                                                                                                                                                                                                                                                                                                                                                                                        cell.statusLabel.text = "• Waiting for Captcha"
//                                                                                                                                                                                                                                                                                                                                                                                                                        //TASK ID: tempas[sender.tag][6]
//                                                                                                                                                                                                                                                                                                        //                                                                                                                print(tempas[sender.tag][6])
//                                                                                                                                                                                                                                                                                                                                                                                                                        //#8c96e9
//                                                                                                                                                                                                                                                                                                                                                                                                                        cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//                                                                                                                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                        let sitekey = "6LeWwRkUAAAAAOBsau7KpuC9AV-6J8mhw4AjC3Xz"
//                                                                                                                                                                                                                                                                                                        let supdomain = "https://www.supremenewyork.com/"
//                                                                                                                                                                                                                                                                                          self.iscurrentlysolvingcaptchas = false
//                                                                                                                                                                                                                                                                                                        if self.defaults.array(forKey: "idsForNeededCaptchas") != nil {
//                                                                                                                                                                                                                                                                                                                       if((self.defaults.array(forKey: "idsForNeededCaptchas") as! [Int]).count != 0) {
//                                                                                                                                                                                                                                          var tmpaa = self.defaults.array(forKey: "idsForNeededCaptchas") as! [Int]
//                                                                                                                                                                                                                                                                                                                        print("* current captcha arr -- \(tmpaa)")
//                                                                                                                                                                                                                                                                                                                        tmpaa.append(currrid as! Int)
//                                                                                                                                                                                                                                  self.defaults.set(tmpaa, forKey: "idsForNeededCaptchas")
//                                                                                                                                                                                                                                                                                                            } else {
//                                                                                                                                                                                                                                                                                                            self.defaults.set([currrid as! Int], forKey: "idsForNeededCaptchas")
//                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                        } else {
//                                                                                                                                                                                                                                                                                        self.defaults.set([currrid as! Int], forKey: "idsForNeededCaptchas")
//                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                        if(self.iscurrentlysolvingcaptchas == false) {
//                                                                                                                                            //                                                                                                                                                                self.iscurrentlysolvingcaptchas = true
//
//                                                                                                                                                                                                                                                                                                                                                                                                                                var gotToken = false
//                                                                                                                                                                                                                                                                                                                                                                                                                                repeat {
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            usleep(1000000) //will sleep for 1 second
//                                                                                                                                                                                                                                                                                                                                                                                                                                    print("* No captcha yet")
//                                                                                                                                                                                                                                                                                                                                                                                                                                    if(Tokens.tokens.count>0) {
//                                                                                                                                                                                                                                                                                                                                                                                                                                        for t in 0...(Tokens.tokens as! NSArray).count-1{
//                                                                                                                                                                                                                                                                                                                                                                                                                                            if(Tokens.tokens[t].contains("\(self.tempas[sensen][6] as! Int)")) {
//                                                                                                                                                                                                                                                                                                                                                                                                                                                captchaatoken = Tokens.tokens[t].replaceAll(of: "\(self.tempas[sensen][6] as! Int)", with: "")
//                                                                                                                                                                                                                                                                                                                                                                                                                                                Tokens.tokens.remove(at: t)
//                                                                                                                                                                                                                                                                                                                                                                                                                                                gotToken = true
//                                                                                                                                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                                                                                                                                                    }
//
//                                                                                                                                                                                                                                                                                                            //                                                                                                                   Tokens.tokens.contains("\(self.tempas[sensen][6] as! Int)") == false
//
//                                                                                                                                                                                                                                                                                                                                                                                                                                } while gotToken == false
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        print("* Captcha is received?")
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        print("* Received captchatoken for task: \(self.tempas[sensen][6] as! Int) -  \(captchaatoken)")
//                                                                                                                                            //                                                                                                                                                                Tokens.tokens = []
//                                                                                                                                            //                                                                                                                                                                Tokens.tokens.index(of: self.tempas[sensen][6] as! Int)
//
//
//
//                                                                                                                                                                                                                                                                                                        } else {
//
//                                                                                                                                                                                                                                                                                                                                                                                                                                var gotToken = false
//                                                                                                                                                                                                                                                                                                                                                                                                                                repeat {
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            usleep(1000000) //will sleep for 1 second
//                                                                                                                                                                                                                                                                                                                                                                                                                                    self.othershavetogo = true
//                                                                                                                                                                                                                                                                                                                                                                                                                                    print("* No captcha yet")
//                                                                                                                                                                                                                                                                                                                                                                                                                                    if(Tokens.tokens.count>0) {
//                                                                                                                                                                                                                                                                                                                                                                                                                                        for t in 0...(Tokens.tokens as! NSArray).count-1{
//                                                                                                                                                                                                                                                                                                                                                                                                                                            if(Tokens.tokens[t].contains("\(self.tempas[sensen][6] as! Int)")) {
//                                                                                                                                                                                                                                                                                                                                                                                                                                                captchaatoken = Tokens.tokens[t].replaceAll(of: "\(self.tempas[sensen][6] as! Int)", with: "")
//                                                                                                                                                                                                                                                                                                                            Tokens.tokens.remove(at: t)
//
//                                                                                                                                                                                                                                                                                                                                                                                                                                                self.othershavetogo = false
//
//                                                                                                                                                                                                                                                                                                                                                                                                                                                gotToken = true
//
//                                                                                                                                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                                                                                                                                                    }
//
//                                                                                                                                                                                                                                                                                                            //                                                                                                                   Tokens.tokens.contains("\(self.tempas[sensen][6] as! Int)") == false
//
//                                                                                                                                                                                                                                                                                                                                                                                                                                } while gotToken == false
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        print("* Captcha is received?")
//                                                                                                                                                                                                                                                                                                            print("* Received captchatoken for task: \(self.tempas[sensen][6] as! Int) -  \(captchaatoken)")
//                                                                                                                                            //                                                                                                                                                                Tokens.tokens = []
//                                                                                                                                                                                                                                                                                                                                                                                                                                DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                                                                                                                                                                    self.captchaView.isHidden = true
//
//
//                                                                                                                                                                                                                                                                                                                                                                                                                                }
//
//
//                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                    //
//
//
//                                                                                                                                                                                                                                                                                                    }
//                                                                print("* sending checkout request")
//                                                                self.submitCheckout(sess: sess, pure_carto: encoded_calculated_pure_cart, cell: cell, sender: sender, start: start, captchaatoken: captchaatoken, fullname: name, email: email, tel: tel, billing_address: billing_address, zip: billing_zip, state: billing_state, city: billing_city, cardtype: card_type, cardnum: card_num, expiremonth: cardmonth, expireyear: cardyear, cvc: cardvall, checkoutdelay: checkoutdelay)
//
//
//                                                            } else {
//                                                                print("* not restock, reg config")
//                                                            }
//                                                            DispatchQueue.main.async {
//                                                                                                                                                                                                                         cell.statusLabel.text = "• Adding to cart"
//                                                                                                                                                                                                                                                                                                       //#8c96e9
//                                                                                                                                                                                                           cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#8c96e9")
//
//                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                    if(self.defaults.string(forKey: "taskid-\(self.tempas[sensen][6])") != "STOPNOW"){
//
//
//                                                                                                                                                                                                                        let urlkk = URL(string: "https://www.supremenewyork.com/shop/\(founditemid)/add.json")!
//                                                                                                                                                                                                                        print("* Requesting:","https://www.supremenewyork.com/shop/\(founditemid)/add.json")
//                                                                                                                                                                                                                        var request = URLRequest(url: urlkk)
//                                                                                                                                                                                                                        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//                                                                                                                                                                                                                        request.setValue("Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Mobile/11D257", forHTTPHeaderField: "User-Agent")
//                                                                                                                                                                                                                        request.httpMethod = "POST"
//                                                            //                                                                                                                                                            let parameters: [String: Any] = [
//                                                            //                                                                                                                                                                "s": ((((((((itemjson["styles"] as! NSArray)[j]) as! [String: AnyObject])["sizes"] as! NSArray)[o]) as! [String: AnyObject])["id"] as! Int)),
//                                                            //                                                                                                                                                                "st": ((((styles as! NSArray)[j]) as! [String: AnyObject])["id"]) as! Int,
//                                                            //                                                                                                                                                                "qty": "1"
//                                                            //                                                                                                                                                            ]
//                                                                                                                                                                    let parameters: [String: Any] = [
//                                                                                                                                                                        "s": s as! Int,
//                                                                                                                                                                        "st": st as! Int,
//                                                                                                                                                                        "qty": "1"
//                                                                                                                                                                    ]
//                                                                                                                                                                                                                        request.httpBody = parameters.percentEncoded()
//                                                                                                                                                                                                                        //print(String(decoding: parameters.percentEncoded()!, as: UTF8.self))
//
//
////                                                                                                                                                                                                                     usleep(500000) //will sleep for 0.5 second
//
//                                                                                                                                                                                                                        let task = sess.dataTask(with: request) { data, response, error69 in
//                                                                                                                                                                                                                            guard let data = data,
//                                                                                                                                                                                                                                let response = response as? HTTPURLResponse,
//                                                                                                                                                                                                                                error69 == nil else {                                              // check for fundamental networking error
//                                                                                                                                                                                                                                print("error", error69 ?? "Unknown error")
//                                                                                                                                                                                                                                    if error69?._code == -1001 {
//                                                                                                                                                                                                                                     //Domain=NSURLErrorDomain Code=-1001 "The request timed out."
//                                                                                                                                                                                                                                        print("* request timed out")
//                                                                                                                                                                                                                                        DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                                                                  cell.statusLabel.text = "• Retrying"
//                                                                                                                                                                                                                                                                                                                                                                    //TASK ID: tempas[sender.tag][6]
//                                                                                                                                                                                                                                                                        //                                                                                            print(tempas[sender.tag][6])
//                                                                                                                                                                                                                                                                                                                                                                    //#8c96e9
//                                                                                                                                                                                                                                                                                                                                                                    cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//                                                                                                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                        //                                                                                             print("* Item not found, wait for drop")
//                                                                                                                                                                                                                                                                                                                                        usleep(2000000) //will sleep for 2.5 seconds
//                                                                                                                                                                                                                                                                                                                                DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                                                                                      sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                                                                                                                                                                                                                                                                            cell.playButton.sendActions(for: .touchUpInside)
//                                                                                                                                                                                                                                                                                                                //                                                    queue.stop
//                                                                                                                                                                                                                                                                                                                                                                                        }
//
//                                                                                                                                                                                                                                                                        return
//                                                                                                                                                                                                                                    }
//
//                                                                                                                                                                                                                                return
//                                                                                                                                                                                                                            }
//
//                                                                                                                                                                                                                            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
//                                                                                                                                                                                                                                print("statusCode should be 2xx, but is \(response.statusCode)")
//                                                                                                                                                                                                                                print("response = \(response)")
//                                                                                                                                                                                                                                return
//                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                             print("* ALL COOKIES:")
//                                                                                                                                                                                                                            ////                                                                                                            print(response.value)
//                                                                                                                                                                                                                            ////                                                                                                            sessionManager.sessionConfiguration.httpCookieStorage?.cookies.removeAll()
//                                                                                                                                                                                                                           let cstorage = HTTPCookieStorage.shared
//                                                                                                                                                                                                                           if let cookies = cstorage.cookies(for: url) {
//                                                                                                                                                                                                                            for cookie in cookies {
//                                                                                                                                                                                                                                print(cookie)
//                                                            //                                                                                                                                                                    cstorage.deleteCookie(cookie)
//                                                                                                                                                                                                                            }}
//                                                                                                                    //                                                                                                        URLSession.httpC
//
//
//                                                                                                                    //                                                                                                                                                                                                                    task.sessionConfiguration.urlCache?.removeAllCachedResponses
//                                                                                                                                                                                                                            let responseString = String(data: data, encoding: .utf8)
//                                                                                                                                                                                                                            print("responseString = \(responseString)")
//                                                                                                                                                                                                                            let sss = responseString as! String
//                                                                                                                                                                                                                            if(sss.contains("size_id") && sss.contains("in_stock") && sss.contains("true")) {
//                                                                                                                                                                                                                                print("* Added to cart!")
//                                                                                                                                                                                                                                DispatchQueue.main.async {
//                                                                                                                                                                                                                                              cell.statusLabel.text = "• Added to cart!"
//                                                                                                                                                                                                                                                                                                                            //#8c96e9
//                                                                                                                                                                                                                               cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#94f294")
//
//                                                                                                                                                                                                                                         }
//                                                                                                                                                                                                                                print((response.allHeaderFields as NSDictionary))
//                                                                                                                                                                                                                                var pure_cart = ((((response.allHeaderFields as NSDictionary)["Set-Cookie"]) as! String).components(separatedBy: ",")[3]).replacingOccurrences(of: "; path=/; expires=", with: "", options: .literal, range: nil)
//                                                                                                                    //                                                                                                            print()
//                                                                                                                                                                                                                                pure_cart = (pure_cart.dropLast(3)).replacingOccurrences(of: "pure_cart=", with: "", options: .literal, range: nil)
//
//                                                                                                                                                                                                                                pure_cart = pure_cart.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
//                                                                                                                                                                                                                                print("* Pure cart: \(pure_cart)")
//                                                                                                                                                                                                                                print(pure_cart)
//
//                                                                                                                                                                                                                                if(self.defaults.string(forKey: "taskid-\(self.tempas[sensen][6])") != "STOPNOW" || self.defaults.string(forKey: "taskid-\(self.tempas[sensen][6])") == nil){
//                                                                                                                                                                                                                                    let urlkk = URL(string: "https://www.supremenewyork.com/checkout.json")!
//                                                                                                                    //                                                                                                                print("* Requesting:","https://www.supremenewyork.com/checkout.json")
//                                                                                                                                                                                                                                    print(self.tempas[sensen][4])
//
//                                                                                                                                                                                                                                    var captchaatoken = ""
//                                                                                                                                                                                                                                    if(self.tempas[sensen][4] as! Bool == true) {
//                                                                                                                                                                                                                                        print("* Captcha bypass on")
//                                                                                                                                                                                                                                        captchaatoken = ""
//                                                                                                                                                                                                                                    } else {
//
//
//
//
//                                                                                                                                                                                                                                                                                                                                                                   print("* Captcha bypass off")
//                                                                                                                                                                                                                                        print("* Starting captcha harvester")
//
//                                                                                                                                                                                                                                        DispatchQueue.main.async {
////                                                                                                                                                                                                                                            self.playCaptchaSound()
//                                                                                                                                                                                                                                            self.scheduleNotification(title: "Captcha Required", body: "Press to continue")
//                                                                                                                                                                                                                                                                                                                                                        cell.statusLabel.text = "• Waiting for Captcha"
//                                                                                                                                                                                                                                                                                                                                                        //TASK ID: tempas[sender.tag][6]
//                                                                                                                                                                                                                                        //                                                                                                                print(tempas[sender.tag][6])
//                                                                                                                                                                                                                                                                                                                                                        //#8c96e9
//                                                                                                                                                                                                                                                                                                                                                        cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//                                                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                        let sitekey = "6LeWwRkUAAAAAOBsau7KpuC9AV-6J8mhw4AjC3Xz"
//                                                                                                                                                                                                                                        let supdomain = "https://www.supremenewyork.com/"
//                                                                                                                                                                                                                          self.iscurrentlysolvingcaptchas = false
//                                                                                                                                                                                                                                        if self.defaults.array(forKey: "idsForNeededCaptchas") != nil {
//                                                                                                                                                                                                                                                       if((self.defaults.array(forKey: "idsForNeededCaptchas") as! [Int]).count != 0) {
//                                                                                                                                                                          var tmpaa = self.defaults.array(forKey: "idsForNeededCaptchas") as! [Int]
//                                                                                                                                                                                                                                                        print("* current captcha arr -- \(tmpaa)")
//                                                                                                                                                                                                                                                        tmpaa.append(currrid as! Int)
//                                                                                                                                                                  self.defaults.set(tmpaa, forKey: "idsForNeededCaptchas")
//                                                                                                                                                                                                                                            } else {
//                                                                                                                                                                                                                                            self.defaults.set([currrid as! Int], forKey: "idsForNeededCaptchas")
//                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                        } else {
//                                                                                                                                                                                                                        self.defaults.set([currrid as! Int], forKey: "idsForNeededCaptchas")
//                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                        if(self.iscurrentlysolvingcaptchas == false) {
//                                                                            //                                                                                                                                                                self.iscurrentlysolvingcaptchas = true
//
//                                                                                                                                                                                                                                                                                                                                                                var gotToken = false
//                                                                                                                                                                                                                                                                                                                                                                repeat {
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            usleep(1000000) //will sleep for 1 second
//                                                                                                                                                                                                                                                                                                                                                                    print("* No captcha yet")
//                                                                                                                                                                                                                                                                                                                                                                    if(Tokens.tokens.count>0) {
//                                                                                                                                                                                                                                                                                                                                                                        for t in 0...(Tokens.tokens as! NSArray).count-1{
//                                                                                                                                                                                                                                                                                                                                                                            if(Tokens.tokens[t].contains("\(self.tempas[sensen][6] as! Int)")) {
//                                                                                                                                                                                                                                                                                                                                                                                captchaatoken = Tokens.tokens[t].replaceAll(of: "\(self.tempas[sensen][6] as! Int)", with: "")
//                                                                                                                                                                                                                                                                                                                                                                                Tokens.tokens.remove(at: t)
//                                                                                                                                                                                                                                                                                                                                                                                gotToken = true
//                                                                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                                                                                    }
//
//                                                                                                                                                                                                                                            //                                                                                                                   Tokens.tokens.contains("\(self.tempas[sensen][6] as! Int)") == false
//
//                                                                                                                                                                                                                                                                                                                                                                } while gotToken == false
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        print("* Captcha is received?")
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        print("* Received captchatoken for task: \(self.tempas[sensen][6] as! Int) -  \(captchaatoken)")
//                                                                            //                                                                                                                                                                Tokens.tokens = []
//                                                                            //                                                                                                                                                                Tokens.tokens.index(of: self.tempas[sensen][6] as! Int)
//
//
//
//                                                                                                                                                                                                                                        } else {
//
//                                                                                                                                                                                                                                                                                                                                                                var gotToken = false
//                                                                                                                                                                                                                                                                                                                                                                repeat {
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            usleep(1000000) //will sleep for 1 second
//                                                                                                                                                                                                                                                                                                                                                                    self.othershavetogo = true
//                                                                                                                                                                                                                                                                                                                                                                    print("* No captcha yet")
//                                                                                                                                                                                                                                                                                                                                                                    if(Tokens.tokens.count>0) {
//                                                                                                                                                                                                                                                                                                                                                                        for t in 0...(Tokens.tokens as! NSArray).count-1{
//                                                                                                                                                                                                                                                                                                                                                                            if(Tokens.tokens[t].contains("\(self.tempas[sensen][6] as! Int)")) {
//                                                                                                                                                                                                                                                                                                                                                                                captchaatoken = Tokens.tokens[t].replaceAll(of: "\(self.tempas[sensen][6] as! Int)", with: "")
//                                                                                                                                                                                                                                                            Tokens.tokens.remove(at: t)
//
//                                                                                                                                                                                                                                                                                                                                                                                self.othershavetogo = false
//
//                                                                                                                                                                                                                                                                                                                                                                                gotToken = true
//
//                                                                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                                                                                    }
//
//                                                                                                                                                                                                                                            //                                                                                                                   Tokens.tokens.contains("\(self.tempas[sensen][6] as! Int)") == false
//
//                                                                                                                                                                                                                                                                                                                                                                } while gotToken == false
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        print("* Captcha is received?")
//                                                                                                                                                                                                                                            print("* Received captchatoken for task: \(self.tempas[sensen][6] as! Int) -  \(captchaatoken)")
//                                                                            //                                                                                                                                                                Tokens.tokens = []
//                                                                                                                                                                                                                                                                                                                                                                DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                                                                                                    self.captchaView.isHidden = true
//
//
//                                                                                                                                                                                                                                                                                                                                                                }
//
//
//                                                                                                                                                                                                                                        }
//                                                                                                                    //
//
//
//                                                                                                                                                                                                                                    }
//
//                                                                                                                    //                                                                                                                print(cookies)
//                                                                                                                                                                                                                            print("* Sending post req")
//                                                                                                                                                                                                                                    DispatchQueue.main.async {
//                                                                                                                                                                                                                                    cell.statusLabel.text = "• Going to checkout"
//                                                                                                                                                                                                                                    //TASK ID: tempas[sender.tag][6]
//                                                                                                                    //                                                                                                                print(tempas[sender.tag][6])
//                                                                                                                                                                                                                                    //#8c96e9
//                                                                                                                                                                                                                                    cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//                                                                                                                                                                                                                                    }
//                                                            //                                                                                                                                                                        print("* pure cart decoded: \(pure_cart.removingPercentEncoding)")
//                                                            //                                                                                                                                                                        pure_cart = pure_cart.removingPercentEncoding!
//                                                                                                                    //                                                                                                                print(checkout_request.url)
//
//                                                                                                                                                                                                                                    var checkoutparameters: DictionaryLiteral = ["":""]
//                                                                                                                                                                                                                                    if(captchaatoken != "") {
//                                                                                                                                                                                                                                        print("* Not an  captcha")
//                                                                                                                                                                                                                                        checkoutparameters = [
//                                                                                                                                                                                                                                                                           "store_credit_id": "",
//                                                                                                                                                                                                                                                                 "from_mobile": "1",
//                                                                                                                                                                                                                                                                 "cookie-sub": pure_cart,
//                                                                                                                                                                                                                                                                 "same_as_billing_address":  "1",
//                                                                                                                                                                                                                                                                 "order[billing_name]":      "\(name)",
//                                                                                                                                                                                                                                                                 "order[email]":      "\(email)",
//                                                                                                                                                                                                                                                                 "order[tel]":      "\(tel)",
//                                                                                                                                                                                                                                                                 "order[billing_address]": "\(billing_address)",
//                                                                                                                                                                                                                                                                 "order[billing_address_2]": "",
//                                                                                                                                                                                                                                                                 "order[billing_zip]":      "\(billing_zip)",
//                                                                                                                                                                                                                                                                 "order[billing_city]":      "\(billing_city)",
//                                                                                                                                                                                                                                                                 "order[billing_state]":      "\(billing_state)",
//                                                                                                                                                                                                                                                                 "order[billing_country]": "USA",
//                                                                                                                                                                                                                                         "store_address":      "1",
//                                                                                                                                                                                                                                         "credit_card[type]": "\(card_type)",
//                                                                                                                                                                                                                                                                 "credit_card[carn]": "\(card_num)",
//                                                                                                                                                                                                                                                                 "credit_card[month]": "\(cardmonth)",
//                                                                                                                                                                                                                                                                 "credit_card[year]": "20\(cardyear)",
//                                                                                                                                                                                                                                                                 "credit_card[vvv]": "\(cardvall)",
//                                                                                                                                                                                                                                                                 "order[terms]": "0",
//                                                                                                                                                                                                                                                                 "order[terms]": "1",
//                                                                                                                                                                                                                                                                 "g-recaptcha-response": "\(captchaatoken)"
//
//                                                                                                                                                                                                                                        ]
//                                                                                                                                                                                                                                    } else {
//                                                                                                                                                                                                                                        print("* Empty Captcha")
//                                                                                                                                                                                                                                        checkoutparameters = [
//                                                                                                                                                                                                                                                                           "store_credit_id": "",
//                                                                                                                                                                                                                                                                 "from_mobile": "1",
//                                                                                                                                                                                                                                                                 "cookie-sub": pure_cart,
//                                                                                                                                                                                                                                                                 "same_as_billing_address":  "1",
//                                                                                                                                                                                                                                                                 "order[billing_name]":      "\(name)",
//                                                                                                                                                                                                                                                                 "order[email]":      "\(email)",
//                                                                                                                                                                                                                                                                 "order[tel]":      "\(tel)",
//                                                                                                                                                                                                                                                                 "order[billing_address]": "\(billing_address)",
//                                                                                                                                                                                                                                                                 "order[billing_address_2]": "",
//                                                                                                                                                                                                                                                                 "order[billing_zip]":      "\(billing_zip)",
//                                                                                                                                                                                                                                                                 "order[billing_city]":      "\(billing_city)",
//                                                                                                                                                                                                                                                                 "order[billing_state]":      "\(billing_state)",
//                                                                                                                                                                                                                                                                 "order[billing_country]": "USA",
//                                                                                                                                                                                                                                         "store_address":      "1",
//                                                                                                                                                                                                                                         "credit_card[type]": "\(card_type)",
//                                                                                                                                                                                                                                                                 "credit_card[carn]": "\(card_num)",
//                                                                                                                                                                                                                                                                 "credit_card[month]": "\(cardmonth)",
//                                                                                                                                                                                                                                                                 "credit_card[year]": "20\(cardyear)",
//                                                                                                                                                                                                                                                                 "credit_card[vvv]": "\(cardvall)",
//                                                                                                                                                                                                                                                                 "order[terms]": "0",
//                                                                                                                                                                                                                                                                 "order[terms]": "1",
//                                                                                                                                                                                                                                                                 "g-recaptcha-response":""
//
//                                                                                                                                                                                                                                        ]
//                                                                                                                                                                                                                                    }
//
//                                                                                                                                                                                                                                    print("* About to send request")
//                                                                                                                                                                                                                                    var checkout_request = URLRequest(url: URL(string: "https://www.supremenewyork.com/checkout.json")!)
//                                                                                                                                                                                                                                    //                                                                                                                print("checkoutrequest url: \(checkout_request.url)")
//                                                                                                                                                                                                                                                                                                                                                    //                                                                                                                CHECKOUT HEADERS
//                                                                                                                                                                                                                                                                                                                                                    //                                                                                                                ***************************************************
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                    checkout_request.setValue("Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Mobile/11D257", forHTTPHeaderField: "User-Agent")
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                    checkout_request.setValue("application/json", forHTTPHeaderField: "Accept")
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                    checkout_request.setValue("en-us", forHTTPHeaderField: "Accept-Language")
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                    checkout_request.setValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                    checkout_request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//
//                                                                                                                                                                                                                                                                                                                                                    checkout_request.setValue("https://www.supremenewyork.com", forHTTPHeaderField: "Origin")
//                                                                                                                                                                                                                                                                                                                                                    checkout_request.setValue("keep-alive", forHTTPHeaderField: "Connection")
//                                                                                                                                                                                                                                    checkout_request.setValue("keep-alive", forHTTPHeaderField: "Proxy-Connection")
//
//                                                                                                                                                                                                                                                                                                                                                                checkout_request.setValue("gzip, deflate", forHTTPHeaderField: "Accept-Encoding")
//
//                                                                                                                                                                                                                                                                                                                                                    checkout_request.setValue("www.supremenewyork.com", forHTTPHeaderField: "host")
//
//                                                                                                                                                                                                                                                                                                                                                    checkout_request.setValue("\"*\"", forHTTPHeaderField: "If-None-Match")
//
//                                                            //                                                                                                                                                                                                                                                                                        checkout_request.setValue("1", forHTTPHeaderField: "DNT")
//                                                                                                                                                                                                                                    //                                                                                                                                                                                                                                checkout_request.setValue("keep-alive", forHTTPHeaderField: "Connection")
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                    checkout_request.setValue("https://www.supremenewyork.com/mobile/", forHTTPHeaderField: "Referer")
//                                                                                                                    //                                                                                                                                                                                                                                                                                                                                                checkout_request.setValue("Trailers", forHTTPHeaderField: "TE")
//                                                                                                                                                                                                                                    checkout_request.httpMethod = "POST"
//                                                                                                                                                                                                                                                                                                                                                    //                                                                                                                ***************************************************
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                    let jar = HTTPCookieStorage.shared
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                    let cookieHeaderField = ["Set-Cookie": "hasShownCookieNotice=1, lastVisitedFragment=checkout, pure_cart=\(pure_cart)"] // Or ["Set-Cookie": "key=value, key2=value2"] for multiple cookies
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                    let cookies = HTTPCookie.cookies(withResponseHeaderFields: cookieHeaderField, for: URL(string: "https://www.supremenewyork.com")!)
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                    jar.setCookies(cookies, for: URL(string: "https://www.supremenewyork.com")!, mainDocumentURL: URL(string: "https://www.supremenewyork.com")!)
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                    print("* Done setting cookies, continuing")
//                                                                                                                                                                                                                                    checkout_request.httpBody =                      checkoutparameters.percentEncoded()
//                                                                                                                                                                                                                                    print("\(String(decoding: checkoutparameters.percentEncoded()!, as: UTF8.self))")
//                                                                                                                    //                                                                                                                checkout_request.httpMethod = "POST"
//                                                                                                                                                                                                                                    print("* Sending..")
//                                                                                                                                                                                                                                    print(checkout_request)
//                                                                                                                                                                                                 DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                              cell.statusLabel.text = "• Waiting \(checkoutdelay as! Float)s"
//
//                                                                                                                                                                                                                                                                                                                                cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//                                                                                                                                                                                                                                                                                                                            }
//
//                                                                                                                                                                                                                                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(checkoutdelay)) {
//                                                                                                                                                                                                                                        // your code here
//
//                                                                                                                                                                                          let checkouttask = sess.dataTask(with: checkout_request) { data3, response3, error3 in
//                                                                                                                                                                                                                                        print(data3)
//                                                                                                                                                                                                                                    guard let data3 = data3,
//                                                                                                                                                                                                                                        let response3 = response3 as? HTTPURLResponse,
//                                                                                                                                                                                                                                        error3 == nil else {                                              // check for fundamental networking error
//                                                                                                                                                                                                                                        print("error", error3 ?? "Unknown error")
//                                                                                                                                                                                                                                            print("* removing cookies")
//                                                                                                                                                                                                                                            if error3?._code == -1001 {
//                                                                                                                                                                                                                                             //Domain=NSURLErrorDomain Code=-1001 "The request timed out."
//                                                                                                                                                                                                                                                print("* request timed out")
//                                                                                                                                                                                                                                                DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                                                                          cell.statusLabel.text = "• Retrying"
//                                                                                                                                                                                                                                                                                                                                                                            //TASK ID: tempas[sender.tag][6]
//                                                                                                                                                                                                                                                                                //                                                                                            print(tempas[sender.tag][6])
//                                                                                                                                                                                                                                                                                                                                                                            //#8c96e9
//                                                                                                                                                                                                                                                                                                                                                                            cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//                                                                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                //                                                                                             print("* Item not found, wait for drop")
//                                                                                                                                                                                                                                                                                                                                                usleep(2000000) //will sleep for 2.5 seconds
//                                                                                                                                                                                                                                                                                                                                        DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                                                                                              sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                                                                                                                                                                                                                                                                                    cell.playButton.sendActions(for: .touchUpInside)
//                                                                                                                                                                                                                                                                                                                        //                                                    queue.stop
//                                                                                                                                                                                                                                                                                                                                                                                                }
//
//                                                                                                                                                                                                                                                                                return
//                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                            let cstorage = HTTPCookieStorage.shared
//                                                            //                                                                                                                                                                                if let cookies3 = cstorage.cookies(for:  URL(string: "https://www.supremenewyork.com")!) {
//                                                            //                                                                                                                                                                                 for cookie in cookies3 {
//                                                            //                                                                                                                                                                                     cstorage.deleteCookie(cookie)
//                                                            //                                                                                                                                                                                 }
//                                                            //
//                                                            //                                                                                                                                                                                }
//
//                                                                                                                                                                                                                                        return
//                                                                                                                                                                                                                                    }
//
//                                                                                                                                                                                                                                    guard (200 ... 299) ~= response3.statusCode else {                    // check for http errors
//                                                                                                                                                                                                                                        print("statusCode should be 2xx, but is \(response3.statusCode)")
//                                                                                                                                                                                                                                        print("response = \(response3)")
//                                                                                                                                                                                                                                        print("* removing cookies")
//                                                                                                                                                                                                                                        let cstorage = HTTPCookieStorage.shared
//                                                                                                                                                                                                                                        if let cookies3 = cstorage.cookies(for:  URL(string: "https://www.supremenewyork.com")!) {
//                                                                                                                                                                                                                                         for cookie in cookies3 {
//                                                                                                                                                                                                                                             cstorage.deleteCookie(cookie)
//                                                                                                                                                                                                                                         }}
//
//                                                                                                                                                                                                                                        return
//                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                        let responseString4 = JSON(data3)
//                                                                                                                                                                                                                                        print("responseString = \(responseString4)")
//                                                                                                                                                                                                                                        if(responseString4 == nil || responseString4 == "") {
//                                                                                                                                                                                                                                            DispatchQueue.main.async {
//                                                                                                                                                                                                                                                let end = DispatchTime.now()   // <<<<<<<<<<   end time
//                                                                                                                                                                                                                                                let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
//                                                                                                                                                                                                                                                let timeInterval = Double(nanoTime) / 1_000_000_000 //
//                                                                                                                                                                                                                                                 cell.statusLabel.text = "• Checkout Failed (\(Double(round(10*timeInterval)/10))s)"
//                                                                                                                                                                                                                                                self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                               //#8c96e9
//                                                                                                                                                                                                                                                                                                                               cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
//                                                                                                                                                                                                                                                sender.setImage(UIImage(systemName: "play"), for: .normal)
//
//                                                                                                                                                                                                                                            }
//
//                                                                                                                                                                                                                                        } else if(responseString4["status"] == "outOfStock") {
//                                                                                                                                                                                                                                        DispatchQueue.main.async {
//                                                                                                                                                                                                                                            let end = DispatchTime.now()   // <<<<<<<<<<   end time
//                                                                                                                                                                                                                                            let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
//                                                                                                                                                                                                                                            let timeInterval = Double(nanoTime) / 1_000_000_000 //
//                                                                                                                                                                                                                                             cell.statusLabel.text = "• outOfStock (\(Double(round(10*timeInterval)/10))s)"
//                                                                                                                                                                                                                                            self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                           //#8c96e9
//                                                                                                                                                                                                                                                                                                                           cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
//                                                                                                                                                                                                                                            sender.setImage(UIImage(systemName: "play"), for: .normal)
//
//                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                        } else if(responseString4["status"] == "failed"){
//                                                                                                                                                                                                                                            DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                                                                                                       let end = DispatchTime.now()   // <<<<<<<<<<   end time
//                                                                                                                                                                                                                                                                                                                                                                       let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
//                                                                                                                                                                                                                                                                                                                                                                       let timeInterval = Double(nanoTime) / 1_000_000_000 //
//                                                                                                                                                                                                                                                                                                                                                                        cell.statusLabel.text = "• Checkout Failed (\(Double(round(10*timeInterval)/10))s)"
//                                                                                                                                                                                                                                                                                                                                                                       self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                                                                                                                                                      //#8c96e9
//                                                                                                                                                                                                                                                                                                                                                                                                                                                      cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
//                                                                                                                                                                                                                                                                                                                                                                       sender.setImage(UIImage(systemName: "play"), for: .normal)
//
//                                                                                                                                                                                                                                                                                                                                                                   }
//                                                                                                                                                                                                                                        } else if(responseString4["status"] == "queued"){
//                                                                                                                                                                                                                                            DispatchQueue.main.async {
//
//                                                                                                                                                                                                                                                 cell.statusLabel.text = "• Processing"
//                                                                                                                    //                                                                                                                            self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")                                                                 //#8c96e9
//                                                                                                                                                                                                                                                                                                                               cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
//
//                                                                                                                    //                                                                                                                            sender.setImage(UIImage(systemName: "play"), for: .normal)
//
////                                                                                                                                                                                                                                                self.playSuccessSound()
//                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                            let slug = responseString4["slug"]
//                                                                                                                                                                                                                                            let slug_url = "https://www.supremenewyork.com/checkout/\(slug as! String)/status.json"
//                                                                                                                                                                                                                                            print("* checking status at - \(slug_url)")
////                                                                                                                                                                                                                                            var slug_request = URLRequest(url: URL(string: slug_url)!)
//                                                                                                                                                                                                                                            guard let slurl = URL(string: slug_url) else {return}
//                                                                                                                                                                                                                                            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
//                                          sess.dataTask(with: slurl) { data169, response169, error169 in
//                                                                                                                                                                                                                                                                                                            print("* Parsing data")
//                                                                                                                                                                                                                                                                          if let data169 = data169 {
//                                                                                                                                                                                                                                                                                                                if let jsonString = String(data: data169, encoding: .utf8) {
//                                                                                                                                                                                                                                            //                                                                        print(jsonString)
//                                                                                                                                                                                                                                                                                                                    do{
//                                                                                                                                                                                                                                                                                                                        let slugjson = try JSONSerialization.jsonObject(with: data169, options: []) as! [String: AnyObject]
//                                                                                                                                                                                                                                                                                                                        if((slugjson["status"] as! String).lowercased() == "queued") {
//                                                                                                                                                                                                                                                                                                                            DispatchQueue.main.async {                                                                                                                                                                                                    cell.statusLabel.text = "• Check Email"
//                                                                                                                                                                                                                                                                                                                            self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                                                                                                           //#8c96e9
//                                                                                                                                                                                                                                                                                                                                                                                                           cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#f9cf46")
//                                                                                                                                                                                                                                                                                                                            sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                                        } else if((slugjson["status"] as! String).lowercased() == "failed") {
//                                                                                                                                                                                                                                                                                                                            DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                                                                let end = DispatchTime.now()   // <<<<<<<<<<   end time
//                                                                                                                                                                                                                                                                                                                                let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
//                                                                                                                                                                                                                                                                                                                                let timeInterval = Double(nanoTime) / 1_000_000_000 //
//                                                                                                                                                                                                                                                                                                                                 cell.statusLabel.text = "• Checkout Failed (\(Double(round(10*timeInterval)/10))s)"
//                                                                                                                                                                                                                                                                                                                                self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                                                                                                               //#8c96e9
//                                                                                                                                                                                                                                                                                                                                                                                                               cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
//                                                                                                                                                                                                                                                                                                                                sender.setImage(UIImage(systemName: "play"), for: .normal)
//
//                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                                        }else if((slugjson["status"] as! String).lowercased() == "outofstock") {
//                                                                                                                                                                                                                                                                                                                            DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                                                                let end = DispatchTime.now()   // <<<<<<<<<<   end time
//                                                                                                                                                                                                                                                                                                                                let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
//                                                                                                                                                                                                                                                                                                                                let timeInterval = Double(nanoTime) / 1_000_000_000 //
//                                                                                                                                                                                                                                                                                                                                 cell.statusLabel.text = "• Checkout Failed (\(Double(round(10*timeInterval)/10))s)"
//                                                                                                                                                                                                                                                                                                                                self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                                                                                                               //#8c96e9
//                                                                                                                                                                                                                                                                                                                                                                                                               cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
//                                                                                                                                                                                                                                                                                                                                sender.setImage(UIImage(systemName: "play"), for: .normal)
//
//                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                                        } else {
//                                                                                                                                                                                                                                                                                                                            DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                                                            cell.statusLabel.text = "• Successfully Checked Out!"
//
//                                                                                                                                                                                                                                                                                                                              cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#94f294")
//                                                                                                                                                                                                                                                                                                                                sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                                                                                                                                                                                                                self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                                    } catch {
//                                                                                                                                                                                                                                                                                                                        print("* error parsing slug")
//                                                                                                       DispatchQueue.main.async {                                                                                                                                                                                                    cell.statusLabel.text = "• Check Email"
//                                                                                                                                                                                                                                                                                                                        self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                                                                                                       //#8c96e9
//                                                                                                                                                                                                                                                                                                                                                                                                       cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#f9cf46")
//                                                                                                                                                                                                                                                                                                                        sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                }.resume()
//
//                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                        } else {
//                                                                                                                                                                                                                                            DispatchQueue.main.async {
//                                                                                                                                                                                                                                                let end = DispatchTime.now()   // <<<<<<<<<<   end time
//                                                                                                                                                                                                                                                let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
//                                                                                                                                                                                                                                                let timeInterval = Double(nanoTime) / 1_000_000_000 //
//                                                                                                                                                                                                                                                 cell.statusLabel.text = "• Checkout Error (\(Double(round(10*timeInterval)/10))s)"
//                                                                                                                                                                                                                                                self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                               //#8c96e9
//                                                                                                                                                                                                                                                                                                                               cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
////                                                                                                                                                                                                                                                sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                                                                                                                                usleep(2000000) //will sleep for 2.5 seconds
//                                                                                                                                                                                                                                                                DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                      sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                                                                                                                                                                                                            cell.playButton.sendActions(for: .touchUpInside)
//                                                                                                                                                                                                                                                //                                                    queue.stop
//                                                                                                                                                                                                                                                                                                                        }
//
//                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                        }
//                                                                                                                    //                                                                                                                    let sss = responseString4 as! String
//                                                                                                                                                                                                                                       print((response3.allHeaderFields as NSDictionary))
//                                                                                                                    //                                                                                                                    print(response.headers)
//                                                                                                                                                                                                                                        print("* removing cookies")
//                                                                                                                                                                                                                                        let cstorage = HTTPCookieStorage.shared
//                                                                                                                                                                                                                                        if let cookies3 = cstorage.cookies(for:  URL(string: "https://www.supremenewyork.com")!) {
//                                                                                                                                                                                                                                         for cookie in cookies3 {
//                                                                                                                                                                                                                                             cstorage.deleteCookie(cookie)
//                                                                                                                                                                                                                                         }}
//
//                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                    checkouttask.resume()
//                                                                                                                                                                                                                                }
//
//
//                                                                                                                                                                                                                            print("* Out of thing")
//
//                                                                                                                    //                                                                                                                print(checkouttask.)
//                                                                                                                                                                                                                                    DispatchQueue.main.async {
//                                                                                                                                                                                                                                        self.newTaskButton.isHidden = false
//                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                } else {
//                                                                                                                                                                                                                                    DispatchQueue.main.async {
//
//                                                                                                                                                                                     print("* stopped line 1219")
//                                                                                                                                                                                                                                         cell.statusLabel.text = "• idle"
//                                                                                                                                                                                                                                        self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                                                                                                       //#8c96e9
//                                                                                                                                                                                                                                                                                                                       cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#f9cf46")
//                                                                                                                                                                                                                                        sender.setImage(UIImage(systemName: "play"), for: .normal)
//
//                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                }
//
//                                                   } else if(sss as! String == "[]"){
//                                                                                                     print("* empty response")
//                                                                                                                                                                                                                                DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                                                                                                                                                                                              cell.statusLabel.text = "• Waiting for restock"
////                                                                                                                                                                                                                                    let not = NotificationPublisher()
////                                                                                                                                                                                                                                    not.sendNotification(title: "Waiting For Restock", body: "Press to continue", badge: 1, delayInterval: 0)
////                                                                                                                                                                                                                                    not.send
//
////                                                                                                                                                                                                                                    not.
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                //TASK ID: tempas[sender.tag][6]
//                                                                                                                                                                                                                                                                                                                                                                                                    //                                                                                            print(tempas[sender.tag][6])
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                //#8c96e9
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                //                                                                                                                                                                                                                                 print("* Item not found, wait for drop")
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                    usleep(2500000) //will sleep for 2.5 seconds
//                                                                                                                                                                                                                                                                                                                                                                                                                                                            DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        cell.playButton.sendActions(for: .touchUpInside)
//                                                                                                                                                                                                                                                                                                                                                                                                                                            //                                                    queue.stop
//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                            }else if(sss.contains("size_id") && sss.contains("in_stock") && sss.contains("false")){
//                                                            //                                                                                                                                                                    start restock monitor
//                                                                                                                                                                                                                                print("* confirmed to be out of stock")
//                                                                                                                                                                                                                                DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                          cell.statusLabel.text = "• Waiting for restock"
//                                                                                                                                                                                                                                                                                                                            //TASK ID: tempas[sender.tag][6]
//                                                                                                                                                                                                                                //                                                                                            print(tempas[sender.tag][6])
//                                                                                                                                                                                                                                                                                                                            //#8c96e9
//                                                                                                                                                                                                                                                                                                                            cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//                                                                                                                                                                                                                                                                                                                        }
//                                                            //                                                                                                                                                                                                                                 print("* Item not found, wait for drop")
//                                                                                                                                                                                                                                                                                                usleep(2500000) //will sleep for 2.5 seconds
//                                                                                                                                                                                                                                                                                        DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                                              sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                                                                                                                                                                                                                                    cell.playButton.sendActions(for: .touchUpInside)
//                                                                                                                                                                                                                                                                        //                                                    queue.stop
//                                                                                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                            else {
//                                                                                                                                                                                                                                print("* Error adding to cart")
//                                                                                                                                                                                                                                DispatchQueue.main.async {
//                                                                                                                                                                                                                                    let end = DispatchTime.now()   // <<<<<<<<<<   end time
//                                                                                                                                                                                                                                    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
//                                                                                                                                                                                                                                    let timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests
//                                                                                                                                          cell.statusLabel.text = "• Error adding to cart (\(Double(round(10*timeInterval)/10))s)"
//
//                                                                                                                                                                                                                                                                                                                   //#8c96e9
//                                                                                                                                                                                                                                  cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
//                                                                                                                                                                                                                                    self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                                                    sender.setImage(UIImage(systemName: "play"), for: .normal)
//
//                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                            }
//
//                                                                                                                                                                                                                        }
//
//                                                                                                                                                                                                                        task.resume()}
//                                                        } else {
//                                                            DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                          cell.statusLabel.text = "• Waiting for restock"
//                                                                                                                                                                                                                                                                                                                            //TASK ID: tempas[sender.tag][6]
//                                                                                                                                                                                                                                //                                                                                            print(tempas[sender.tag][6])
//                                                                                                                                                                                                                                                                                                                            //#8c96e9
//                                                                                                                                                                                                                                                                                                                            cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//                                                                                                                                                                                                                                                                                                                        }
//                                                            //                                                                                                                                                                                                                                 print("* Item not found, wait for drop")
//                                                                                                                                                                                                                                                                                                usleep(4000000) //will sleep for 4 seconds
//                                                                                                                                                                                                                                                                                        DispatchQueue.main.async {
//                                                                                                                                                                                                                                                                                                              sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                                                                                                                                                                                                                                    cell.playButton.sendActions(for: .touchUpInside)
//                                                                                                                                                                                                                                                                                            sender.setImage(UIImage(systemName: "pause"), for: .normal)
//                                                                                                                                                                                                                                                                        //                                                    queue.stop
//                                                                                                                                                                                                                                                                                                                                                }
//                                                        }
//
//
//                                                                                                                                                        }
////                                                     else {
////                                                                                                                                                            DispatchQueue.main.async {
////
////                                                                                                      print("* stopped line 1302")
////                                                                                                                                                                cell.statusLabel.text = "• Stopped"
////                                                                                                                                                                self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
////                                                                                                                                                                                                                                               //#8c96e9
////                                                                                                                                                                                                                                               cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
////                                                                                                                                                                sender.setImage(UIImage(systemName: "play"), for: .normal)
////
////                                                                                                                                                            }
////                                                                                                                                                        }
//
//                                                                                                                                                    }
//                                                                                                                                                }
//                                                                                                                                            }
//
//                                                                                                                                        }
//
//
//                                                        //                                                                            print(itemjson)
//                                                                                                                                } catch let error {
//                                                                                                                                    print("Error: \(error)")
//                                                                                                                                }
//                                                                                                                            }
//                                                                                                                        }
//                                                                                                                    }.resume()
//                                                                                                                } else {
//                                                                                                                    DispatchQueue.main.async {
//                                                                                                                        print("* stopped line 1328")
//                                                                                                                         cell.statusLabel.text = "• idle"
//                                                                                                                        self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                                                                                                       //#8c96e9
//                                                                                                                                                                                                       cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#f9cf46")
//                                                                                                                        sender.setImage(UIImage(systemName: "play"), for: .normal)
//
//                                                                                                                    }
//                                                                                                                    break
//
//                                                                                                                }
//                                                        //                                                    print("HTML : \(myHTMLString)")
//
//
//                                                        }}}}}
//                                                    } else {
//
//
//                //                                    if(category == nil) {
//                                                        print("* Error parsing products")
//                                         DispatchQueue.main.async {
//                                                                                                                                  cell.statusLabel.text = "• Retrying"
//                                                                                                                                                                    //TASK ID: tempas[sender.tag][6]
//                                                                        //                                                                                            print(tempas[sender.tag][6])
//                                                                                                                                                                    //#8c96e9
//                                                                                                                                                                    cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//                                                                                                                                                                }
//                                        //                                                                                             print("* Item not found, wait for drop")
//                                                                                                                                        usleep(2000000) //will sleep for 2.5 seconds
//                                                                                                                                DispatchQueue.main.async {
//                                                                                                                                                      sender.setImage(UIImage(systemName: "play"), for: .normal)
//                                                                                                                                                                                            cell.playButton.sendActions(for: .touchUpInside)
//                                                                                                                //                                                    queue.stop
//                                                                                                                                                                                        }
////                                                        DispatchQueue.main.async {
////
////
////                                                                                                                                    sender.setImage(UIImage(systemName: "play"), for: .normal)
////
////                                                            let end = DispatchTime.now()   // <<<<<<<<<<   end time
////                                                            let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
////                                                            let timeInterval = Double(nanoTime) / 1_000_000_000 //
////                                                             cell.statusLabel.text = "• Error parsing products (\(Double(round(10*timeInterval)/10))s)"
////                                                            self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
////                                                                                                                                           //#8c96e9
////                                                                                                                                           cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#ed6361")
////                                                        //                                                    queue.stop
////                                                                                                                                }
//                //                                        break
//
//                                                    }
//                                                    } catch let error {
//                                                                    print("Error: \(error)")
//                                                                }
//
//                                                            }
//                                                        }
//
//                                                    }.resume()
//
//
//
//                                    }
//                //                        print(data)
//
//                //                        do {
//                //                            var found = false
//                //
//                //                            var found_name = ""
//                //                            guard let json = try JSONSerialization.jsonObject(with: raw_json as Data, options: .allowFragments) as? [String: AnyObject] else {return}
//                //                            print("* going through products_and_categories")
//                //                            var categories = json["products_and_categories"] as! NSArray
//                //                            for i in 0...categories.count-1{
//                //                                if(found == false) {
//                ////                                    keep looking
//                //                                    var items = categories[i] as! NSArray
//                //                                    for i in 0...items.count-1{
//                //                                        print(items[i] as! String)
//                //                                    }
//                //                                } else {
//                ////                                    dont keep looking
//                //                                }
//                //                            }
//                //                        } catch let jsonErr {
//                //                            print("jsonErr: ",jsonErr)
//                //                        }
//                //                    if(exactisfound == false) {
//                //                        DispatchQueue.main.async {
//                //                        print("Item was not found? Wait for drop")
//                //                        cell.statusLabel.text = "• Waiting for drop"
//                //                        //TASK ID: tempas[sender.tag][6]
//                ////                        print(tempas[sender.tag][6])
//                //                        //#8c96e9
//                //                        cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#6170ed")
//                //                            usleep(2500000) //will sleep for 1 second
//                //                            sender.setImage(UIImage(systemName: "play"), for: .normal)
//                //                            cell.playButton.sendActions(for: .touchUpInside)
//                //
//                //                        }
//                ////                        cell.p
//                //                    }
//
//
//
//                                } else {
//                                    DispatchQueue.main.async {
//                                        print("* stopped line 1420")
//                                         cell.statusLabel.text = "• idle"
//                                        self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                                       //#8c96e9
//                                                                                                                       cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#f9cf46")
//                                        sender.setImage(UIImage(systemName: "play"), for: .normal)
//
//                                    }
//                                }
//                            }
//            } else {
//                DispatchQueue.main.async {
//                    print("* stopped line 1432")
//                    let indexPath = NSIndexPath(row: sender.tag, section: 0)
//                    let cell = self.tasksTable.cellForRow(at: indexPath as IndexPath) as! tasksCell
//                     cell.statusLabel.text = "• idle"
//                    self.defaults.set("IDLE", forKey: "taskid-\(self.tempas[sender.tag][6])")
//                                                                                                   //#8c96e9
//                                                                                                   cell.statusLabel.textColor = self.hexStringToUIColor(hex: "#f9cf46")
//                    sender.setImage(UIImage(systemName: "play"), for: .normal)
//
//                }
//            }
//
////        }
//        }
//
//
//
////        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCellz", for: indexPath) as! tasksCell
//    }
//    func getJSON(urlToRequest: String) -> NSData{
//        do {
//            return try NSData(contentsOf: NSURL(string: urlToRequest) as! URL)
//        } catch let jsonErr {
//            return jsonErr as! NSData
//        }
//
//    }
//
////    func parseJSON(inputData: NSData) -> NSDictionary{
////        var error: NSError?
////        var boardsDictionary: NSDictionary = JSONSerialization.JSONObjectWithData(inputData, options: JSONSerialization.ReadingOptions.MutableContainers, error: &error) as NSDictionary
////
////        return boardsDictionary
////    }
//    func generateNewId() -> Int {
//        let randomInt = Int.random(in: 0..<100000)
//        return randomInt
//    }
//    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//            URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
//        }
//        func downloadImage(from url: URL) {
//            print("Download Started")
//            getData(from: url) { data, response, error in
//                guard let data = data, error == nil else { return }
//                print(response?.suggestedFilename ?? url.lastPathComponent)
//    //            print("Download Finished")
//    //            DispatchQueue.main.async() {
//    ////                self.imageView.image = UIImage(data: data)
//    //            }
//            }
//        }
//}
//
//extension String {
//    func toJSON() -> Any? {
//        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
//        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//    }
//}
//extension Dictionary {
//    func percentEncoded() -> Data? {
//        return map { key, value in
//            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
//            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
//            return escapedKey + "=" + escapedValue
//        }
//        .joined(separator: "&")
//        .data(using: .utf8)
//    }
//}
//extension DictionaryLiteral {
//    func percentEncoded() -> Data? {
//        return map { key, value in
//            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
//            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
//            return escapedKey + "=" + escapedValue
//        }
//        .joined(separator: "&")
//        .data(using: .utf8)
//    }
//}
//extension CharacterSet {
//    static let urlQueryValueAllowed: CharacterSet = {
//        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
//        let subDelimitersToEncode = "!$&'()*+,;="
//
//        var allowed = CharacterSet.urlQueryAllowed
//        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
//        return allowed
//    }()
//}
//extension HTTPURLResponse {
//
//    func find(header: String) -> String? {
//        let keyValues = allHeaderFields.map { (String(describing: $0.key).lowercased(), String(describing: $0.value)) }
//
//        if let headerValue = keyValues.filter({ $0.0 == header.lowercased() }).first {
//            return headerValue.1
//        }
//        return nil
//    }
//
//}
//extension UIApplication {
//    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
//        if let navigationController = controller as? UINavigationController {
//            return topViewController(controller: navigationController.visibleViewController)
//        }
//        if let tabController = controller as? UITabBarController {
//            if let selected = tabController.selectedViewController {
//                return topViewController(controller: selected)
//            }
//        }
//        if let presented = controller?.presentedViewController {
//            return topViewController(controller: presented)
//        }
//        return controller
//    }
//}
//extension Int
//{
//    static func random(range: Range<Int> ) -> Int
//    {
//        var offset = 0
//
//        if range.startIndex < 0   // allow negative ranges
//        {
//            offset = abs(range.startIndex)
//        }
//
//        let mini = UInt32(range.startIndex + offset)
//        let maxi = UInt32(range.endIndex   + offset)
//
//        return Int(mini + arc4random_uniform(maxi - mini)) - offset
//    }
//}
//extension UIImage {
//    var averageColor: UIColor? {
//        guard let inputImage = CIImage(image: self) else { return nil }
//        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)
//
//        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
//        guard let outputImage = filter.outputImage else { return nil }
//
//        var bitmap = [UInt8](repeating: 0, count: 4)
//        let context = CIContext(options: [.workingColorSpace: kCFNull])
//        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)
//
//        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
//    }
//}
//extension String {
//    func utf8DecodedString()-> String {
//         let data = self.data(using: .utf8)
//         if let message = String(data: data!, encoding: .nonLossyASCII){
//                return message
//          }
//          return ""
//    }
//
//    func utf8EncodedString()-> String {
//         let messageData = self.data(using: .nonLossyASCII)
//        let text = String(data: messageData!, encoding: .utf8)!
//         return text
//    }
//}
//
