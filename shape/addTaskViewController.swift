//
//  addTaskViewController.swift
//  shape
//
//  Created by Jordan Wood on 12/30/19.
//  Copyright © 2019 jwood. All rights reserved.
//

import UIKit
import Foundation
import WebKit
import JavaScriptCore
import PopupDialog
import SwiftKeychainWrapper
//import MHSoftUI
//import VegaScrollFlowLayout
import NotificationBannerSwift
import DropDown

class itemCell: UITableViewCell {
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var chooseButton: UIButton!
//    @IBOutlet weak var productURLLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var backgroundViewzz: UIView!
}
class profileCell: UITableViewCell {
    @IBOutlet weak var profileNum: UILabel!

    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var checkOutDelayLabel: UILabel!
    @IBOutlet weak var endingOfCardLabel: UILabel!
    @IBOutlet weak var backgroundViewzzz: UIView!
    
}
class addTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    
    let defaults = UserDefaults.standard
    var names: [String] = []
    //                                                var urls: [String] = []
    var imageURLs: [String] = []
    
    var cateoig: [String] = []
    @IBOutlet var products: UITableView!
    @IBOutlet weak var profilesTable: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    @IBOutlet weak var horeBar: UIView!
    @IBOutlet weak var buttonTHingy: UIView!
    @IBOutlet weak var columThing: UIView!
    @IBOutlet weak var columThing2: UIView!
    @IBOutlet weak var weekNumField: UITextField!
    
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var newProfileButton: UIButton!
//    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var noProfilesCreated: UILabel!
    @IBOutlet weak var plusButton: UIImageView!
    
    let droplistWeekDropDown = DropDown()

    var timer = Timer()
    
    let cellID = "cellId"
    let menuArr = ["add task","profiles"]
    
    var estimateWidth = 160.0
    var cellMarginSize = 16.0

   var droplistUrls = [""]
   var droplistweeknums = [""]
   var droplistdates = [""]
   var droplistLabelArray = [""]
   var completeDropListArray = [[""]]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.defaults.array(forKey: "tasksArray") != nil {
            let tempas = self.defaults.array(forKey: "tasksArray") as! [NSArray]
            print(tempas.count)
        }
        
        
        profilesTable.delegate = self
        profilesTable.dataSource = self
//        weekNumField.delegate = self
        droplistWeekDropDown.width = columThing2.bounds.width
        droplistWeekDropDown.layer.cornerRadius = columThing2.layer.cornerRadius
        droplistWeekDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.weekNumField.text = item
            self.loadProductsFromDroplistUrl(ur: self.droplistUrls[index])
        }
        profilesTable.separatorStyle = .none
        products.delegate = self
        products.dataSource = self
        products.separatorStyle = .none
        profilesTable.isHidden = true
//        horeBar.mask
        noProfilesCreated.isHidden = true
        horeBar.layer.masksToBounds = true
        noProfilesCreated.isHidden = true
        newProfileButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        newProfileButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        newProfileButton.layer.shadowOpacity = 1.0
        newProfileButton.layer.shadowRadius = 23
        newProfileButton.layer.masksToBounds = false
        newProfileButton.layer.shadowOffset = CGSize(width: 0.0, height: 7.0)
        newProfileButton.isHidden = true
        plusButton.isHidden = true
        setupHorizontalBar()
        collectionView.isHidden = false
        columThing.isHidden = true
        columThing2.isHidden = false
        weekNumField.layer.borderWidth = 0
        columThing2.layer.cornerRadius = 7
        columThing.layer.cornerRadius = 7
//        let layout = VegaScrollFlowLayout()
//        products.collectionViewLayout = layout
//        layout.minimumLineSpacing = 20
//        layout.itemSize = CGSize(width: products.frame.width, height: 87)
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
                collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellID)
        //        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
                collectionView.dataSource = self
                collectionView.delegate = self
        self.collectionView.performBatchUpdates(nil) { _ in
                    self.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: [.centeredHorizontally])
            self.horeBar.frame = CGRect(x: 0 , y: 140, width: UIScreen.main.bounds.width / 2, height: 2)
                    
        //            self.collectionView(self.collectionView, didSelectItemAt : IndexPath(item: 0, section: 0))
        //            self.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: scrollPosition)
                }
        // Do any additional setup after loading the view.
//       topView.layer.cornerRadius = 25;
//        //        topView.layer.masksToBounds = true;
//                newTaskButton.layer.cornerRadius = 28.5;
//                // Shadow and Radius
//                topView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
//                topView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//                topView.layer.shadowOpacity = 1.0
//                topView.layer.shadowRadius = 28.5
//                topView.layer.masksToBounds = false
//                topView.layer.cornerRadius = 28.5
        products.rowHeight = 95
        profilesTable.rowHeight = 95
        
        //navigation shit
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        let BarButtonItemAppearance = UIBarButtonItem.appearance()
        let attributes = [NSAttributedString.Key.font:  UIFont(name: "Helvetica-Bold", size: 0.1)!, NSAttributedString.Key.foregroundColor: UIColor.clear]

        BarButtonItemAppearance.setTitleTextAttributes(attributes, for: .normal)
        BarButtonItemAppearance.setTitleTextAttributes(attributes, for: .highlighted)
        if defaults.array(forKey: "namessArray") != nil {
                names = defaults.array(forKey: "namessArray") as! [String]
//                   let currentTitle = String(names.count) + " items"
            print("Number of items: "+String(names.count))
//                   amountOfProducts.setTitle(currentTitle, for: .normal)
               }
               if defaults.array(forKey: "immmmageurlsaz") != nil {
                   imageURLs = defaults.array(forKey: "immmmageurlsaz") as! [String]
               }
               if defaults.array(forKey: "categoris") != nil {
                   cateoig = defaults.array(forKey: "categoris") as! [String]
               }
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        loadProducts()
//        getCurrentTime()
        products.reloadData()

    }
    @IBAction func droplistClicked(_ sender: UIView) {
            

            // The view to which the drop down will appear on
            droplistWeekDropDown.anchorView = columThing2 // UIView or UIBarButtonItem

            // The list of items to display. Can be changed dynamically
//            droplistWeekDropDown.dataSource = [""]
            DropDown.appearance().textColor = UIColor.white
            DropDown.appearance().selectedTextColor = UIColor.white
            DropDown.appearance().textFont = UIFont(name: "Futura-Medium", size: 16)!
    //        DropDown.appearance().shadowOpacity = 0
        DropDown.appearance().shadowOpacity = 0.1
            DropDown.appearance().shadowColor = .black
            DropDown.appearance().backgroundColor = hexStringToUIColor(hex: "#2e2b3e")
        DropDown.appearance().selectionBackgroundColor = hexStringToUIColor(hex: "#2e2b3e")
//            DropDown.appearance().selectionBackgroundColor = hexStringToUIColor(hex: "#21202f")
            droplistWeekDropDown.dismissMode = .onTap
    //        DropDown.appearance().setupCornerRadius(9) // available since v2.3.6
    //        DropDown.appearance().cellHeight = 60
            droplistWeekDropDown.show()
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let x = CGFloat(indexPath.item) * UIScreen.main.bounds.size.width / 2
                horizontalBarLeftAnchorConstraint?.constant = x
        //        horeBar.leftAnchor.r.constraint(equalTo: collectionView.leftAnchor)
        //        UIView.animate(withDuration: 0.75, usingSpring: T##() -> Void)
        //        collectionView.cellForItem(at: indexPath).
                UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                    self.horeBar.frame = CGRect(x: x , y: 140, width: UIScreen.main.bounds.width / 2, height: 2)
                    self.view.layoutIfNeeded()
                }) { (_) in
                    // Follow up animations...
                }
        print("\(menuArr[indexPath.row]) selected")
        if(menuArr[indexPath.row].lowercased() == "add task") {
            plusButton.isHidden = true
            products.isHidden = false
            noProfilesCreated.isHidden = true
            newProfileButton.isHidden = true
            profilesTable.isHidden = true
            columThing.isHidden = true
            columThing2.isHidden = false
        } else if(menuArr[indexPath.row].lowercased() == "profiles") {
            plusButton.isHidden = false
            products.isHidden = true
            noProfilesCreated.isHidden = false
            newProfileButton.isHidden = false
            columThing2.isHidden = true
             if self.defaults.array(forKey: "profilesArray") != nil {
                
                if(self.defaults.array(forKey: "profilesArray")!.count != 0) {
                    profilesTable.isHidden = false
                    noProfilesCreated.isHidden = true
                    columThing.isHidden = false
                    print("* profile count - \(self.defaults.array(forKey: "profilesArray")!.count)")
                    for k in 0...self.defaults.array(forKey: "profilesArray")!.count-1 {
                        var currentProfile = (self.defaults.array(forKey: "profilesArray")! as! [NSArray])[k] as! NSArray
                        print(currentProfile[0])
                    }
                } else {
                    noProfilesCreated.isHidden = false
                }
            }
            
        }
    }
    @IBAction func createProfilePressed(sender: UIButton) {
         let ratingVC = addprofileview(nibName: "addprofileview", bundle: nil)
                 //ratingVC.itemName.text = name

                 // Create the dialog
                 let popup = PopupDialog(viewController: ratingVC,
                                         buttonAlignment: .horizontal,
                                         transitionStyle: .bounceDown,
                                         tapGestureDismissal: true,
                                         panGestureDismissal: false)
                ratingVC.checkoutDelayField.text = "4250"
                 // Customize dialog appearance
         //        let pv = PopupDialogDefaultView.appearance()
         //        pv.backgroundColor      = UIColor(red:0.23, green:0.23, blue:0.27, alpha:1.00)
         //        pv.titleFont            = UIFont(name: "Futura-Light", size: 16)!
         //        pv.titleColor           = UIColor.white
         //        pv.messageFont          = UIFont(name: "Futura", size: 14)!
         //        pv.messageColor         = UIColor(white: 0.8, alpha: 1)
                 

                 // Customize default button appearance
                 let db = DefaultButton.appearance()
                 db.titleFont      = UIFont(name: "Futura-Medium", size: 14)!
                 db.titleColor     = UIColor.white
                 db.buttonColor    = hexStringToUIColor(hex: "#8b97e3")
                 db.separatorColor = UIColor(red:0.20, green:0.20, blue:0.25, alpha:1.00)

                 // Customize cancel button appearance
                 let cb = CancelButton.appearance()
                 cb.titleFont      = UIFont(name: "Futura-Medium", size: 14)!
                 cb.titleColor     = UIColor(red:0.75, green:0.20, blue:0.20, alpha: 1)
                 cb.buttonColor    = UIColor(red:0.25, green:0.25, blue:0.29, alpha:1.00)
                 cb.separatorColor = UIColor(red:0.20, green:0.20, blue:0.25, alpha:1.00)
                 // Create first button
                 let buttonOne = CancelButton(title: "CANCEL", height: 60) {
         //            self.label.text = "You canceled the rating dialog"
         //            print(ratingVC.itemName)
         //            print(ratingVC.itemCol)
                 }

                 // Create second button
                 let buttonTwo = DefaultButton(title: "NEXT", height: 60) {
         //            self.label.text = "You rated \(ratingVC.cosmosStarRating.rating) stars"
                    print("* add pressed")
                    let profilename = ratingVC.profileNameField.text ?? ""
                    let firstname = ratingVC.firstNameField.text ?? ""
                    let lastname = ratingVC.lastNameField.text ?? ""
                    let email = ratingVC.emailField.text ?? ""
                    let address = ratingVC.addressField.text ?? ""
                    let phonenum = ratingVC.phoneField.text ?? ""
                    let city = ratingVC.cityField.text ?? ""
                    let state = ratingVC.stateField.text ?? ""
                    let zipcode = ratingVC.zipcodeField.text ?? ""
                    let checkoutdelay = ratingVC.checkoutDelayField.text ?? ""
                    
                    if(profilename != "" && firstname != "" && lastname != "" && email != "" && address != "" && phonenum != "" && city != "" && state != "" && zipcode != "" && checkoutdelay != "") {
                        print("* profilename: \(profilename)")
                        print("* everything is gud, moving to payment")
                        let ratingVC2 = paymentview(nibName: "paymentview", bundle: nil)
                                //ratingVC.itemName.text = name

                                // Create the dialog
                                let popup = PopupDialog(viewController: ratingVC2,
                                                        buttonAlignment: .horizontal,
                                                        transitionStyle: .bounceDown,
                                                        tapGestureDismissal: true,
                                                        panGestureDismissal: false)
//                               ratingVC.checkoutDelayField.text = "4250"
                                // Customize dialog appearance
                        //        let pv = PopupDialogDefaultView.appearance()
                        //        pv.backgroundColor      = UIColor(red:0.23, green:0.23, blue:0.27, alpha:1.00)
                        //        pv.titleFont            = UIFont(name: "Futura-Light", size: 16)!
                        //        pv.titleColor           = UIColor.white
                        //        pv.messageFont          = UIFont(name: "Futura", size: 14)!
                        //        pv.messageColor         = UIColor(white: 0.8, alpha: 1)
                                

                                // Customize default button appearance
                                let db = DefaultButton.appearance()
                                db.titleFont      = UIFont(name: "Futura-Medium", size: 14)!
                                db.titleColor     = UIColor.white
                        db.buttonColor    = self.hexStringToUIColor(hex: "#8b97e3")
                                db.separatorColor = UIColor(red:0.20, green:0.20, blue:0.25, alpha:1.00)

                                // Customize cancel button appearance
                                

                                // Create second button
                                let buttonTwo = DefaultButton(title: "CREATE", height: 60) {
                                    print("* saving info")
                                    if(ratingVC2.paymentField.cardNumber != "" && ratingVC2.paymentField.cvc != "") {
                                        print("* has card number, continuing")
                                        var cardnum = ratingVC2.paymentField.cardNumber as! String
                                        cardnum = self.formattedCardNumber(number: cardnum)
                                        let cardExpireMonth = ratingVC2.paymentField.formattedExpirationMonth as! String
                                        let cardExpireYear = ratingVC2.paymentField.formattedExpirationYear as! String
                                        let cardcvc = ratingVC2.paymentField.cvc as! String
                                        
                                        let profileId = self.randomString(length: 7)
                                        
//                                        let expirMOnth = ratingVC2.paymentField.expirationMonth as! String
                                        print("* profileID: \(profileId)")
                                        print("* card num: \(cardnum), expires: \(cardExpireMonth)/\(cardExpireYear), cvc: \(cardcvc)")
                                        if self.defaults.array(forKey: "profilesArray") != nil {
                                           let tassks = self.defaults.array(forKey: "profilesArray") as! [NSArray]
                                                             //                   let currentTitle = String(names.count) + " items"
                                                                         print("* Number of tasks: "+String(tassks.count))
                                                             //                   amountOfProducts.setTitle(currentTitle, for: .normal)
                                                                 var tempas = self.defaults.array(forKey: "profilesArray") as! [NSArray]
                                                                 print(tempas)
                                                                 tempas.append([profilename, firstname, lastname, email, address, phonenum, city, state, zipcode, checkoutdelay, profileId])
                                                                 self.defaults.set(tempas, forKey: "profilesArray")
                                            print("* done saving shipping, saving payment")
                                            let saveSuccessful: Bool = KeychainWrapper.standard.set(cardnum, forKey: "cardnum-\(profileId)")
                                            let saveSuccessful2: Bool = KeychainWrapper.standard.set(cardExpireMonth, forKey: "cardExpireMonth-\(profileId)")
                                            let saveSuccessful3: Bool = KeychainWrapper.standard.set(cardExpireYear, forKey: "cardExpireYear-\(profileId)")
                                            let saveSuccessful4: Bool = KeychainWrapper.standard.set(cardcvc, forKey: "cvc-\(profileId)")
                                            
                                            
                                                             } else {
                                                                 print("* 0 profiles")
                                                                 let arr = [[profilename, firstname, lastname, email, address, phonenum, city, state, zipcode, checkoutdelay, profileId]]
                                                                 self.defaults.set(arr, forKey: "profilesArray")
                                            print("* done saving shipping, saving payment")
                                            let saveSuccessful: Bool = KeychainWrapper.standard.set(cardnum, forKey: "cardnum-\(profileId)")
                                            let saveSuccessful2: Bool = KeychainWrapper.standard.set(cardExpireMonth, forKey: "cardExpireMonth-\(profileId)")
                                            let saveSuccessful3: Bool = KeychainWrapper.standard.set(cardExpireYear, forKey: "cardExpireYear-\(profileId)")
                                            let saveSuccessful4: Bool = KeychainWrapper.standard.set(cardcvc, forKey: "cvc-\(profileId)")
                                                             }
                                    } else {
                                        let banner = FloatingNotificationBanner(title: "Error With Payment Info", subtitle: "Some fields left empty", style: .danger)
                                           banner.haptic = .medium
                                        //                        banner.delegate = self as! NotificationBannerDelegate
                                             banner.show()
                                    }
                        }
                        popup.addButtons([buttonTwo])

                        // Present dialog
                        self.present(popup, animated: true, completion: nil)
                    } else {
                        print("* Something is empty, notify user")
//                        FloatingNotificationBanner
//                        let banner = NotificationBanner(title: "Error With Profile", subtitle: "Some fields left missing", style: .danger)
                        let banner = FloatingNotificationBanner(title: "Error With Shipping Info", subtitle: "Some fields left empty", style: .danger)
                        banner.haptic = .light
//                        banner.delegate = self as! NotificationBannerDelegate
                        banner.show()
                    }
//                     print(ratingVC.itemName.text ?? "")
//                     print(ratingVC.itemCol.text ?? "")
//                     print(ratingVC.itemsiz.text ?? "")
//                     let nnnn = ratingVC.itemName.text ?? ""
//                     let coll = ratingVC.itemCol.text ?? ""
//                     let sizzs = ratingVC.itemsiz.text ?? ""
//                     let capby = ratingVC.captchaa.isOn
//                     let sinn = ratingVC.signin.isOn
//                     let profinam = ratingVC.profileNa.text ?? ""
//                     var iddas = self.generateNewId()
//                     self.defaults.set("IDLE", forKey: "taskid-\(iddas)")
//                     print("* Adding to tasks: ", nnnn)
//                     if self.defaults.array(forKey: "tasksArray") != nil {
//                         let tassks = self.defaults.array(forKey: "tasksArray") as! [NSArray]
//                     //                   let currentTitle = String(names.count) + " items"
//                                 print("* Number of tasks: "+String(tassks.count))
//                     //                   amountOfProducts.setTitle(currentTitle, for: .normal)
//                         var tempas = self.defaults.array(forKey: "tasksArray") as! [NSArray]
//                         print(tempas)
//                         tempas.append([nnnn, coll, sizzs, profinam, capby, self.imageURLs[sender.tag], iddas, categg, sinn])
//                         self.defaults.set(tempas, forKey: "tasksArray")
//                     } else {
//                         print("* 0 tasks")
//                         let arr = [[nnnn, coll, sizzs, profinam, capby, self.imageURLs[sender.tag], iddas, categg, sinn]]
//                         self.defaults.set(arr, forKey: "tasksArray")
//                     }
                     
                 }

                 // Add buttons to dialog
                 popup.addButtons([buttonTwo])

                 // Present dialog
                 present(popup, animated: true, completion: nil)
     }
    func formattedCardNumber(number: String) -> String {
        let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "XXXX XXXX XXXX XXXX"

        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    func randomString(length: Int) -> String {

        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)

        var randomString = ""

        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }

        return randomString
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuArr.count
    }
//    func setupGridView() {
//        let flow = productsCollection?.collectionViewLayout as! UICollectionViewFlowLayout
//        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
//        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func calculatedWith() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width) / estimatedWidth)
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount-1) - margin) / cellCount
        return width
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            if(collectionView == self.collectionView) {
                return CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height)
//            } else {
//                let width = self.calculatedWith()
//                print(width)
//                return CGSize(width: width, height: width+30)
//    //            return CGSize(width: (collectionView.frame.width / 2), height: collectionView.frame.height / 2.5)
//            }
            
        }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MenuCell
                    //        cell.setupViews()
//                            cell.backgroundColor = .black
                    //        let text2: UILabel = {
                    //            let iv = UILabel()
                    //            iv.text = menuArr[indexPath.item]
                    //            iv.textColor = .white
                    //            return iv
                    //        }()
                    //        if(indexPath.item == 0) {
                    //
                    //        }
                            
                            cell.text2.text = menuArr[indexPath.item]
                            cell.text2.textColor = .white
                            cell.text2.textAlignment = .center
        //            cell.resiz
                            
                            cell.text2.textColor = (UIColor.white).withAlphaComponent(0.4)

                    //        cell.layer.borderColor = UIColor.red.cgColor
                    //        cell.layer.borderWidth = 1
                            

                            
                            return cell
    }
    func loadProductsFromDroplistUrl(ur: String) {
         let size = CGSize(width: 30.0, height:30.0)
                
//                print("* Finding latest droplist")
//                    let url = NSURL(string: "https://www.supremecommunity.com/season/latest/droplists/")!
//                                            let request = NSMutableURLRequest(url:url as URL)
//                                            let task = URLSession.shared.dataTask(with: request as URLRequest) {
//                                                data, response, error in
//
//                                                if error != nil{
//                                                    print(error.debugDescription)
//                                                }
//                                                else {
//                                                    if let unwrappedData = data{
//
//                                                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
//
//                                    //                    print(dataString as Any)
//                                                       let data = dataString
//                                                         do {
//                                                                let doc: Document = try SwiftSoup.parse(data as! String)
//                                                        //                        print(doc)
//                                                                let latestBlock = try doc.getElementById("box-latest")
//                                    //                            print(latestBlock)
//                                                                let newurl = try latestBlock?.getElementsByTag("a").first()?.attr("href")
//                                                                print("url for latest droplist: https://www.supremecommunity.com\(ur)")
                                    //                        latestdropurl = "https://www.supremecommunity.com\(newurl as! String)"
                                    //                        print(latestdropurl)
                                                            
        //                                                    https://www.supremecommunity.com/season/fall-winter2019/droplist/2019-12-26/
                                                           
                                                            let url2 = NSURL(string: "https://www.supremecommunity.com\(ur)")!
                                                                    let request2 = NSMutableURLRequest(url:url2 as URL)
                                                                    let task2 = URLSession.shared.dataTask(with: request2 as URLRequest) {
                                                                        data2, response2, error2 in

                                                                        if error2 != nil{
                                                                            print(error2.debugDescription)
                                                                        }
                                                                        else {
                            //                                                print("finding items on \(latestdropurl)")
                                                                            if let unwrappedData = data2{

                                                                                let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)

                                                            //                    print(dataString as Any)
                                                                               let data = dataString
                                                                                 do {
                                    //                                                print(data)
                                                                                    let doc: Document = try SwiftSoup.parse(data as! String)
                                                                                //                        print(doc)
                                                                                    let items = try doc.getElementsByClass("masonry__item")
                                                                                    var temp = 0
                                    //                                                var itemNameArray = [String]
                                                                                    var names2: [String] = []
                                    //                                                var urls: [String] = []
                                                                                    var imageURLs2: [String] = []
                                                                                    var categoriArray2: [String] = []
                                                                                    for item in items {
                                    //                                                    print(try item.text())
                                                                                        if(try (item.getElementsByClass("category").first()?.text()) == "z") {
                                                                                            print("Blank thing")
                                                                                        } else {
                                                                                            print(try item.getElementsByClass("card-details").first()?.attr("data-itemname") ?? "")
                                                                                            print(try item.getElementsByClass("prefill-img").first()?.attr("src") ?? "")
                                                                                            print("Category: ", try (item.getElementsByClass("category").first()?.text() ?? ""))
                                                                                            print("===============================")
                                                                                            names2.append(try item.getElementsByClass("card-details").first()?.attr("data-itemname") ?? "")
                                                                                            imageURLs2.append(try item.getElementsByClass("prefill-img").first()?.attr("src") ?? "")
                                                                                            categoriArray2.append(try (item.getElementsByClass("category").first()?.text() ?? ""))
        //                                                                                    DispatchQueue.main.async {
        //                                                                                    print("Reloading Data")
        //                                                                                    self.products.reloadData()
        //                                                                                    }
                                                                                            temp = temp + 1
                                                                                            
                                                                                        }
                                                                                        
                                                                                    }
                                                                                    print("names count: \(names2.count)")
                                                                                    self.defaults.set(names2, forKey: "namessArray")
                                                                                    self.defaults.set(imageURLs2, forKey: "immmmageurlsaz")
                                                                                    self.defaults.set(categoriArray2, forKey: "categoris")
                                                                                    DispatchQueue.main.async {
                                                                                    print("Reloading Data")
                                                                                        if(self.names == names2 && self.imageURLs == imageURLs2 && categoriArray2 == self.cateoig) {
                                                                                            print("* already downloaded latest droplist")
                                                                                        } else {
                                                                                        self.names = names2
                                                                                        self.imageURLs = imageURLs2
                                                                                        self.cateoig = categoriArray2
                                                                                    self.products.reloadData()
                                                                                        }
                                                                                    }
                                                                                   // self.products.reloadData()
                    //                                                                print(self.defaults.array(forKey: "namessArray"))
                                                                                    
                            //                                                        self.products.numberOfRows(inSection: names.count)
                                                                                                        
                                                                                    } catch {
                                                                                        print("error")
                                                                                    }
                                                                            }
                                                                        }
                                                                    }

                                                                    task2.resume()
                                                            
                                                                                
//                                                            }
//    catch {
//                                                                print("error")
//                                                            }
//                                                    }
//                                                }
//                                            }

//                                            task.resume()
    }
    func loadProducts() {
        let size = CGSize(width: 30.0, height:30.0)
        
        print("* Finding latest droplist")
            let url = NSURL(string: "https://www.supremecommunity.com/season/latest/droplists/")!
                                    let request = NSMutableURLRequest(url:url as URL)
                                    let task = URLSession.shared.dataTask(with: request as URLRequest) {
                                        data, response, error in

                                        if error != nil{
                                            print(error.debugDescription)
                                        }
                                        else {
                                            if let unwrappedData = data{

                                                let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)

                            //                    print(dataString as Any)
                                               let data = dataString
                                                 do {
                                                        let doc: Document = try SwiftSoup.parse(data as! String)
                                                //                        print(doc)
                                                        let latestBlock = try doc.getElementById("box-latest")
                            //                            print(latestBlock)
                                                        let newurl = try latestBlock?.getElementsByTag("a").first()?.attr("href")
                                                        print("url for latest droplist: https://www.supremecommunity.com\(newurl as! String)")
                            //                        latestdropurl = "https://www.supremecommunity.com\(newurl as! String)"
                            //                        print(latestdropurl)
                                                    
//                                                    https://www.supremecommunity.com/season/fall-winter2019/droplist/2019-12-26/
                                                    let blocks = try doc.getElementsByClass("scapp-main-cont").first()
                                                    
                                                    self.droplistLabelArray = []
                                                    self.droplistUrls = []
                                                    self.droplistweeknums = []
                                                    self.droplistdates = []
                                                    self.completeDropListArray = []
                                                    for block in (blocks?.children())! {
                                                        let blockurl = try block.getElementsByTag("a").first()?.attr("href")
                                                        print("droplist url: \(blockurl as! String)")
                                                        self.droplistUrls.append(blockurl as! String)
                                                        let droplistweeknum = try (block.getElementsByTag("h2").first())
                                                        let droplistdate = try (block.getElementsByTag("h4").first())
                                                        if(droplistdate != nil) {
                                                            let wkknum = try droplistweeknum?.text() as! String
                                                            let dd = try droplistdate?.text() as! String
                                                            self.droplistweeknums.append(wkknum)
                                                            self.droplistdates.append(dd)
                                                            self.completeDropListArray.append([wkknum, dd, blockurl as! String])
                                                             print("\(wkknum) - \(dd)")
                                                            self.droplistLabelArray.append("\(wkknum) - \(dd)")
                                                        } else {
                                                            let wkknum = try droplistweeknum?.text() as! String
//
                                                            self.droplistweeknums.append(wkknum)
                                                            self.droplistdates.append("")
                                                            self.completeDropListArray.append([wkknum, "", blockurl as! String])
                                                            self.droplistLabelArray.append("\(wkknum)")
                                                            print("\(wkknum)")
                                                        }
                                                       
                                                    }
                                                    self.droplistWeekDropDown.dataSource = self.droplistLabelArray
                                                    let url2 = NSURL(string: "https://www.supremecommunity.com\(newurl as! String)")!
                                                            let request2 = NSMutableURLRequest(url:url2 as URL)
                                                            let task2 = URLSession.shared.dataTask(with: request2 as URLRequest) {
                                                                data2, response2, error2 in

                                                                if error2 != nil{
                                                                    print(error2.debugDescription)
                                                                }
                                                                else {
                    //                                                print("finding items on \(latestdropurl)")
                                                                    if let unwrappedData = data2{

                                                                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)

                                                    //                    print(dataString as Any)
                                                                       let data = dataString
                                                                         do {
                            //                                                print(data)
                                                                            let doc: Document = try SwiftSoup.parse(data as! String)
                                                                        //                        print(doc)
                                                                            let items = try doc.getElementsByClass("masonry__item")
                                                                            var temp = 0
                            //                                                var itemNameArray = [String]
                                                                            var names2: [String] = []
                            //                                                var urls: [String] = []
                                                                            var imageURLs2: [String] = []
                                                                            var categoriArray2: [String] = []
                                                                            for item in items {
                            //                                                    print(try item.text())
                                                                                if(try (item.getElementsByClass("category").first()?.text()) == "z") {
                                                                                    print("Blank thing")
                                                                                } else {
                                                                                    print(try item.getElementsByClass("card-details").first()?.attr("data-itemname") ?? "")
                                                                                    print(try item.getElementsByClass("prefill-img").first()?.attr("src") ?? "")
                                                                                    print("Category: ", try (item.getElementsByClass("category").first()?.text() ?? ""))
                                                                                    print("===============================")
                                                                                    names2.append(try item.getElementsByClass("card-details").first()?.attr("data-itemname") ?? "")
                                                                                    imageURLs2.append(try item.getElementsByClass("prefill-img").first()?.attr("src") ?? "")
                                                                                    categoriArray2.append(try (item.getElementsByClass("category").first()?.text() ?? ""))
//                                                                                    DispatchQueue.main.async {
//                                                                                    print("Reloading Data")
//                                                                                    self.products.reloadData()
//                                                                                    }
                                                                                    temp = temp + 1
                                                                                    
                                                                                }
                                                                                
                                                                            }
                                                                            print("names count: \(names2.count)")
                                                                            self.defaults.set(names2, forKey: "namessArray")
                                                                            self.defaults.set(imageURLs2, forKey: "immmmageurlsaz")
                                                                            self.defaults.set(categoriArray2, forKey: "categoris")
                                                                            DispatchQueue.main.async {
                                                                            print("Reloading Data")
                                                                                if(self.names == names2 && self.imageURLs == imageURLs2 && categoriArray2 == self.cateoig) {
                                                                                    print("* already downloaded latest droplist")
                                                                                } else {
                                                                                self.names = names2
                                                                                self.imageURLs = imageURLs2
                                                                                self.cateoig = categoriArray2
                                                                            self.products.reloadData()
                                                                                }
                                                                            }
                                                                           // self.products.reloadData()
            //                                                                print(self.defaults.array(forKey: "namessArray"))
                                                                            
                    //                                                        self.products.numberOfRows(inSection: names.count)
                                                                                                
                                                                            } catch {
                                                                                print("error")
                                                                            }
                                                                    }
                                                                }
                                                            }

                                                            task2.resume()
                                                    
                                                                        
                                                    } catch {
                                                        print("error")
                                                    }
                                            }
                                        }
                                    }

                                    task.resume()
        
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("names.count for numberOfRowsInSection: ",names.count)
        if(tableView == products) {
            return names.count
        } else {
            if self.defaults.array(forKey: "profilesArray") != nil {
                return self.defaults.array(forKey: "profilesArray")!.count
            } else {
                return 0
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == products) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "itemCellz", for: indexPath) as! itemCell
                    //        names = defaults.array(forKey: "namessArray") as! [String]
                    //        imageURLs = defaults.array(forKey: "immmmageurlsaz") as! [String]
                    //        print("NASML \(names)")
                            //        print("loading cell with product name: '\(names[indexPath.row])' and product url: '\(urls[indexPath.row])'")
                                    cell.productLabel?.text = names[indexPath.row]
                        
                            cell.chooseButton.tag = indexPath.row
            cell.selectionStyle = .none
                    //BACKGROUNDVIEW
                    cell.backgroundViewzz.layer.cornerRadius = 10;
//                    cell.backgroundViewzz.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
//                    cell.backgroundViewzz.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
//                    cell.backgroundViewzz.layer.shadowOpacity = 1.0
//                    cell.backgroundViewzz.layer.shadowRadius = 8
//                    cell.backgroundViewzz.layer.masksToBounds = false
            
                    //**********************
                    cell.productLabel.lineBreakMode = .byWordWrapping // notice the 'b' instead of 'B'
                    cell.productLabel.numberOfLines = 0
                    cell.chooseButton.addTarget(self, action: #selector(chooseTapped(_:)), for: .touchUpInside)
                    if(cateoig[indexPath.row] == "tops/sweaters") {
                        cell.categoryLabel.text = "Tops/Sweaters"
                    } else {
                        cell.categoryLabel.text = cateoig[indexPath.row].capitalizingFirstLetter()
                    }
                    
                            
                    //                cell.productURLLabel?.text = urls[indexPath.row]
                            //        ************************
                            //        TO BE DELETED
                                    print("Download Started")
                            //        let url = NSURL(string: "https://assets.supremenewyork.com/174597/zo/teldeNW25s1.jpg") as! URL
                                    print(imageURLs[indexPath.row])
                                    let urlls = "https://www.supremecommunity.com"+imageURLs[indexPath.row]
                                    let url = NSURL(string: urlls) as! URL
                                    getData(from: url) { data, response, error in
                                        guard let data = data, error == nil else { return }
                                        print(response?.suggestedFilename ?? url.lastPathComponent)
                                        print("Download Finished")
                                        DispatchQueue.main.async() {
                                            cell.productImageView.image = UIImage(data: data)
                                            cell.productImageView.layer.cornerRadius = 7;
                                        }
                                    }
                            
                                   
                                    return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileCellz", for: indexPath) as! profileCell
            if self.defaults.array(forKey: "profilesArray") != nil {
                
                if(self.defaults.array(forKey: "profilesArray")!.count != 0) {
//                    profilesTable.isHidden = false
                    noProfilesCreated.isHidden = true
                    print("* profile count - \(self.defaults.array(forKey: "profilesArray")!.count)")
//                    for k in 0...self.defaults.array(forKey: "profilesArray")!.count-1 {
                    var currentProfile = (self.defaults.array(forKey: "profilesArray")! as! [NSArray])[indexPath.row] as! NSArray
                        print(currentProfile[0])
                        cell.profileNum.text = "#\(indexPath.row as! Int)"
                        cell.profileName.text = currentProfile[0] as! String
                        cell.fullName.text = "\(currentProfile[1]) \(currentProfile[2])"
                        cell.checkOutDelayLabel.text = "\(currentProfile[9] as! String)ms"
                        let card_num = KeychainWrapper.standard.string(forKey: "cardnum-\(currentProfile[10])")!
                        cell.endingOfCardLabel.text = "\(card_num.suffix(4))"
                    print("* last 4 of card - \(card_num.suffix(4))")
                        cell.backgroundViewzzz.layer.cornerRadius = 7
                    cell.selectionStyle = .none
//                        cell.backgroundViewzzz.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
//                        cell.backgroundViewzzz.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
//                        cell.backgroundViewzzz.layer.shadowOpacity = 1.0
//                        cell.backgroundViewzzz.layer.shadowRadius = 8
                        cell.backgroundViewzzz.layer.masksToBounds = false
//                    }
                } else {
                    noProfilesCreated.isHidden = false
                }
            }
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView,
                       trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
        {
            if(tableView == products) {
                return UISwipeActionsConfiguration(actions: [])
            } else {
            let modifyAction = UIContextualAction(style: .normal, title:  "", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                print("Delete at index:",indexPath.row)
                if self.defaults.array(forKey: "profilesArray") != nil {
                    if self.defaults.array(forKey: "profilesArray")!.count == 1 {
                        self.defaults.set(nil, forKey: "profilesArray")
                        self.noProfilesCreated.isHidden = false
                    } else {
                        let idForProfile = ((self.defaults.array(forKey: "profilesArray")! as! [NSArray])[indexPath.row] as! NSArray)[10]
                        let removeSuccessful: Bool = KeychainWrapper.standard.removeObject(forKey: "cardnum-\(idForProfile)")
                        let removeSuccessful2: Bool = KeychainWrapper.standard.removeObject(forKey: "cardExpireMonth-\(idForProfile)")
                        let removeSuccessful3: Bool = KeychainWrapper.standard.removeObject(forKey: "cardExpireYear-\(idForProfile)")
                        let removeSuccessful4: Bool = KeychainWrapper.standard.removeObject(forKey: "cvc-\(idForProfile)")
                        var tmp = self.defaults.array(forKey: "profilesArray")!
                        tmp.remove(at: indexPath.row)
                        self.defaults.set(tmp, forKey: "profilesArray")
                        
                        
                        self.noProfilesCreated.isHidden = true
                        self.profilesTable.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
                        self.profilesTable.reloadData()
                    }
                }
    //            defaults.set("Jackets", forKey: "category")
//                self.defaults.set(nil, forKey: "taskid-\(self.tempas[indexPath.row][6])")
                
//                self.tempas.remove(at: indexPath.row)
//                if(self.tempas.count == 0) {
//
//                    self.defaults.set(nil, forKey: "tasksArray")
//                    self.noTasks.isHidden = false
//                    self.playpauseView.isHidden = true
//                } else {
//                    self.defaults.set(self.tempas, forKey: "tasksArray")
//                }
//
//    //            self.tasksTable.reloadRows(at: indexPath.row, with: .automatic)
//                self.tasksTable.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
//                self.tasksTable.reloadData()
                success(true)
            })
    //        modifyAction.image = UIImage(named: "trash")
            let trashimage = UIImage(systemName: "trash")
            modifyAction.image = trashimage?.withTintColor(hexStringToUIColor(hex: "#ed6361"), renderingMode: .alwaysOriginal)
    //        modifyAction.image = UIImage(systemName: "trash")
    //        modifyAction.
            modifyAction.backgroundColor = UIColor(white: 1, alpha: 0.0)
        
            return UISwipeActionsConfiguration(actions: [modifyAction])
            }
        }
    func generateNewId() -> Int {
        let randomInt = Int.random(in: 0..<100000)
        return randomInt
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
    @objc func chooseTapped(_ sender: UIButton){
            
          // use the tag of button as index
          let name = names[sender.tag]
            let crat = cateoig[sender.tag]
        var categg = ""
        if(crat.lowercased() != "tops-sweaters") {
            categg = crat.capitalizingFirstLetter()
        } else {
            categg = "Tops/Sweaters"
        }
        
            print("TAGGGG: \(name)")
//            var tagr = name.split(separator: " ")[0].lowercased() + ", " + name.split(separator: " ")[1].lowercased()
//            print("simplified tage: \(tagr)")
//            defaults.set(tagr, forKey: "tags")
            
    //        newInputView().setTags()
    //
    //        newInputView().setCategory()
            
            print("* Presenting popup for color + size + captcha bypass + profile")
        // Prepare the popup assets
        // Create a custom view controller
        let ratingVC = addview(nibName: "addview", bundle: nil)
        //ratingVC.itemName.text = name

        // Create the dialog
        let popup = PopupDialog(viewController: ratingVC,
                                buttonAlignment: .horizontal,
                                transitionStyle: .bounceDown,
                                tapGestureDismissal: true,
                                panGestureDismissal: false)
        ratingVC.itemName.text = name
        // Customize dialog appearance
//        let pv = PopupDialogDefaultView.appearance()
//        pv.backgroundColor      = UIColor(red:0.23, green:0.23, blue:0.27, alpha:1.00)
//        pv.titleFont            = UIFont(name: "Futura-Light", size: 16)!
//        pv.titleColor           = UIColor.white
//        pv.messageFont          = UIFont(name: "Futura", size: 14)!
//        pv.messageColor         = UIColor(white: 0.8, alpha: 1)
        

        // Customize default button appearance
        let db = DefaultButton.appearance()
        db.titleFont      = UIFont(name: "Futura-Medium", size: 14)!
        db.titleColor     = UIColor.white
        db.buttonColor    = hexStringToUIColor(hex: "#8b97e3")
        db.separatorColor = UIColor(red:0.20, green:0.20, blue:0.25, alpha:1.00)

        // Customize cancel button appearance
        let cb = CancelButton.appearance()
        cb.titleFont      = UIFont(name: "Futura-Medium", size: 14)!
        cb.titleColor     = UIColor(red:0.75, green:0.20, blue:0.20, alpha: 1)
        cb.buttonColor    = UIColor(red:0.25, green:0.25, blue:0.29, alpha:1.00)
        cb.separatorColor = UIColor(red:0.20, green:0.20, blue:0.25, alpha:1.00)
        // Create first button
        let buttonOne = CancelButton(title: "CANCEL", height: 60) {
//            self.label.text = "You canceled the rating dialog"
//            print(ratingVC.itemName)
//            print(ratingVC.itemCol)
        }

        // Create second button
        let buttonTwo = DefaultButton(title: "ADD", height: 60) {
//            self.label.text = "You rated \(ratingVC.cosmosStarRating.rating) stars"
            print(ratingVC.itemName.text ?? "")
            print(ratingVC.itemCol.text ?? "")
            print(ratingVC.itemsiz.text ?? "")
            let nnnn = ratingVC.itemName.text ?? ""
            let coll = ratingVC.itemCol.text ?? ""
            let sizzs = ratingVC.itemsiz.text ?? ""
            let capby = ratingVC.captchaa.isOn
            let sinn = ratingVC.signin.isOn
            let profinam = ratingVC.profileNa.text ?? ""
            var iddas = self.generateNewId()
            if(nnnn != "" && coll != "" && sizzs != "" && profinam != "") {
                self.defaults.set("IDLE", forKey: "taskid-\(iddas)")
                print("* Adding to tasks: ", nnnn)
                if self.defaults.array(forKey: "tasksArray") != nil {
                    let tassks = self.defaults.array(forKey: "tasksArray") as! [NSArray]
                //                   let currentTitle = String(names.count) + " items"
                            print("* Number of tasks: "+String(tassks.count))
                //                   amountOfProducts.setTitle(currentTitle, for: .normal)
                    var tempas = self.defaults.array(forKey: "tasksArray") as! [NSArray]
                    print(tempas)
                    tempas.append([nnnn, coll, sizzs, profinam, capby, self.imageURLs[sender.tag], iddas, categg, sinn])
                    self.defaults.set(tempas, forKey: "tasksArray")
                } else {
                    print("* 0 tasks")
                    let arr = [[nnnn, coll, sizzs, profinam, capby, self.imageURLs[sender.tag], iddas, categg, sinn]]
                    self.defaults.set(arr, forKey: "tasksArray")
                }
            } else {
                let banner = FloatingNotificationBanner(title: "Error With Payment Info", subtitle: "Some fields left empty", style: .danger)
                   banner.haptic = .medium
                //                        banner.delegate = self as! NotificationBannerDelegate
                     banner.show()
            }
            
            
        }

        // Add buttons to dialog
        popup.addButtons([buttonTwo])

        // Present dialog
        present(popup, animated: true, completion: nil)
        
        
    //
        }
    private func getCurrentTime() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.currentTime) , userInfo: nil, repeats: true)
    }
    func setupHorizontalBar() {
        print("* adding horizontal bar")
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor.white
        view.addSubview(horizontalBarView)
        let horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: collectionView.leftAnchor)
        horizontalBarLeftAnchorConstraint.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 1/4).isActive = true
        
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.shared.isStatusBarHidden = true
        
    }

     

    override var prefersStatusBarHidden: Bool {
        return true
    }
    @objc func currentTime() {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "hh:mm:ss a"
//        currentTimeLabel.text = formatter.string(from: Date())
    }
    
    

    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
            URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        }
        func downloadImage(from url: URL) {
            print("Download Started")
            getData(from: url) { data, response, error in
                guard let data = data, error == nil else { return }
                print(response?.suggestedFilename ?? url.lastPathComponent)
    //            print("Download Finished")
    //            DispatchQueue.main.async() {
    ////                self.imageView.image = UIImage(data: data)
    //            }
            }
        }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

class MenuCell: UICollectionViewCell {
    let text2: UILabel = {
        let iv = UILabel()
        iv.text = "test"
        iv.textColor = .white
        return iv
    }()
//    @IBOutlet weak var text2: UILabel!
//    text2.text = "sup fucka"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
//        setupHorizontalBar()
    }
    func addContraintsWithFormat(_ format: String, views: UIView...) {
        var viewDict = [String: UIView]()

        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDict[key] = view
        }

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDict))
    }
    override var isHighlighted: Bool {
        didSet{
            
            if isHighlighted == true {
//                print("highlighted")
                text2.textColor = (UIColor.white).withAlphaComponent(1.0)
//                text2.font = UIFont (name: "CourierNewPS-BoldMT", size: 16)
                text2.font = UIFont(name: "Futura-Bold", size: 16)!
            } else {
                text2.textColor = (UIColor.white).withAlphaComponent(0.4)
                text2.font = UIFont(name: "Futura-Bold", size: 16)!
//                text2.font = UIFont (name: "Courier New", size: 16)
            }
            
        }
    }
    override var isSelected: Bool {
        didSet {
            if isSelected == true {
//                print("Selected")
//                print(text2.text)
//                if(text2.text as! String == "PAYMENT" || text2.text as! String == "SETTINGS") {
//
//                } else {
////                    ViewController.handleTabPressed("")
//                }
                
                text2.textColor = (UIColor.white).withAlphaComponent(1.0)
//                text2.font = UIFont (name: "CourierNewPS-BoldMT", size: 16)
                text2.font = UIFont(name: "Futura-Bold", size: 16)!
            } else {
                text2.textColor = (UIColor.white).withAlphaComponent(0.4)
//                text2.font = UIFont (name: "Courier New", size: 16)
                text2.font = UIFont(name: "Futura-Bold", size: 16)!
            }
            
        }
    }
    
    func setupViews(){
//        backgroundColor = .black
        addSubview(text2)
//        text.constraints
        addContraintsWithFormat("V:|[v0(50)]|", views: text2)
//        text2.font = UIFont (name: "Courier New", size: 16)
        text2.font = UIFont(name: "Futura-Bold", size: 16)!
//        text2
//        text2.weight
        //        text2.center = self.center
        var bounds = UIScreen.main.bounds
        var width = bounds.size.width
        var height = bounds.size.height
        addContraintsWithFormat("H:|[v0(200)]|", views: text2)
        
//      addConstraint(NSLayoutConstraint(item: text2, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
//        addConstraint(NSLayoutConstraint(item: text2, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func endEditing() {
        self.endEditing(true)
    }
}

