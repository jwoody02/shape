//
//  RatingViewController.swift
//  PopupDialog
//
//  Created by Martin Wildfeuer on 11.07.16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import DropDown
class addview: UIViewController {

    @IBOutlet weak var itemName: UITextField!

    @IBOutlet weak var itemCol: UITextField!
    @IBOutlet weak var itemsiz: UITextField!
    @IBOutlet weak var profileNa: UITextField!
    @IBOutlet weak var captchaa: UISwitch!
    @IBOutlet weak var signin: UISwitch!
    @IBOutlet weak var sizesView: UIView!
    @IBOutlet weak var colorsView: UIView!
    @IBOutlet weak var profilesView: UIView!
    
    let sizeDropDown = DropDown()
    let colorsDropDown = DropDown()
    let profilesDropDown = DropDown()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        itemName.delegate = self
        itemsiz.delegate = self
        profileNa.delegate = self
        itemCol.delegate = self
        
        print("* setting dropdown shit")
        
        sizeDropDown.width = itemsiz.bounds.width
        sizeDropDown.layer.cornerRadius = itemsiz.layer.cornerRadius
        colorsDropDown.width = itemCol.bounds.width
        colorsDropDown.layer.cornerRadius = itemCol.layer.cornerRadius
        profilesDropDown.width = profileNa.bounds.width
        profilesDropDown.layer.cornerRadius = profileNa.layer.cornerRadius
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
        
        sizeDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.itemsiz.text = item
        }
        profilesDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.profileNa.text = item
        }
        colorsDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.itemCol.text = item
        }
        if(self.defaults.array(forKey: "profilesArray") != nil) {
           
            if(self.defaults.array(forKey: "profilesArray")!.count != 0) {
//            profilesArray = []
                profileNa.text = (self.defaults.array(forKey: "profilesArray")![0] as! NSArray)[0] as! String
//            for i in 0...self.defaults.array(forKey: "profilesArray")!.count-1 {
//                profilesArray.append((self.defaults.array(forKey: "profilesArray")! as! [NSArray])[i][0] as! String)
//            }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func endEditing() {
        view.endEditing(true)
    }
    @IBAction func sizesViewClicked(_ sender: UIView) {
        

        // The view to which the drop down will appear on
        sizeDropDown.anchorView = itemsiz // UIView or UIBarButtonItem

        // The list of items to display. Can be changed dynamically
        sizeDropDown.dataSource = ["N/A", "Small", "Medium", "Large", "XLarge", "XXLarge", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12", "28" , "30", "32", "34"]
        DropDown.appearance().textColor = UIColor.white
        DropDown.appearance().selectedTextColor = UIColor.white
        DropDown.appearance().textFont = UIFont(name: "Futura-Medium", size: 15)!
//        DropDown.appearance().shadowOpacity = 0
        DropDown.appearance().shadowOpacity = 0.3
        DropDown.appearance().shadowColor = .black
        DropDown.appearance().backgroundColor = hexStringToUIColor(hex: "#21202f")
        DropDown.appearance().selectionBackgroundColor = hexStringToUIColor(hex: "#1d1c29")
        sizeDropDown.dismissMode = .onTap
//        DropDown.appearance().setupCornerRadius(9) // available since v2.3.6
//        DropDown.appearance().cellHeight = 60
        sizeDropDown.show()
    }
    @IBAction func colorViewClicked(_ sender: UIView) {
            

            // The view to which the drop down will appear on
            colorsDropDown.anchorView = itemCol // UIView or UIBarButtonItem

            // The list of items to display. Can be changed dynamically
            colorsDropDown.dataSource = ["N/A","Random","Black", "White", "Red", "Yellow", "Orange", "Blue", "Navy", "Grey", "Natural", "Baby Blue", "Brown", "Green", "Silver", "Gold", "Purple", "Mint", "Magenta",  "Pink", "Royal", "Slate", "Olive", "Camo"]
            DropDown.appearance().textColor = UIColor.white
//        DropDown.appearance().shadowOpacity = 0
        DropDown.appearance().shadowOpacity = 0.3
        DropDown.appearance().shadowColor = .black
            DropDown.appearance().selectedTextColor = UIColor.white
            DropDown.appearance().textFont = UIFont(name: "Futura-Medium", size: 15)!
            DropDown.appearance().backgroundColor = hexStringToUIColor(hex: "#21202f")
            DropDown.appearance().selectionBackgroundColor = hexStringToUIColor(hex: "#1d1c29")
            colorsDropDown.dismissMode = .onTap
    //        DropDown.appearance().setupCornerRadius(9) // available since v2.3.6
    //        DropDown.appearance().cellHeight = 60
            colorsDropDown.show()
        }
    @IBAction func profileViewClicked(_ sender: UIView) {
            

            // The view to which the drop down will appear on
            profilesDropDown.anchorView = profileNa // UIView or UIBarButtonItem
        var profilesArray = [""]
        if(self.defaults.array(forKey: "profilesArray") != nil) {
           
            if(self.defaults.array(forKey: "profilesArray")!.count != 0) {
            profilesArray = []
            for i in 0...self.defaults.array(forKey: "profilesArray")!.count-1 {
                profilesArray.append((self.defaults.array(forKey: "profilesArray")! as! [NSArray])[i][0] as! String)
            }
            }
        }
//        profilesDropDown.selectRow(at: 0)

            // The list of items to display. Can be changed dynamically
            profilesDropDown.dataSource = profilesArray
            DropDown.appearance().textColor = UIColor.white
        DropDown.appearance().shadowOpacity = 0.3
        DropDown.appearance().shadowColor = .black
            DropDown.appearance().selectedTextColor = UIColor.white
            DropDown.appearance().textFont = UIFont(name: "Futura-Medium", size: 15)!
            DropDown.appearance().backgroundColor = hexStringToUIColor(hex: "#21202f")
            DropDown.appearance().selectionBackgroundColor = hexStringToUIColor(hex: "#1d1c29")
            profilesDropDown.dismissMode = .onTap
    //        DropDown.appearance().setupCornerRadius(9) // available since v2.3.6
    //        DropDown.appearance().cellHeight = 60
            profilesDropDown.show()
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
}

extension addview: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing()
        return true
    }
}
