//
//  addprofileview.swift
//  shape
//
//  Created by Jordan Wood on 2/25/20.
//  Copyright © 2020 jwood. All rights reserved.
//

import UIKit
import DropDown
import CoreLocation

class addprofileview: UIViewController {
    @IBOutlet weak var profileNameField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var zipcodeField: UITextField!
    @IBOutlet weak var checkoutDelayField: UITextField!
    let stateDropDown = DropDown()
    let checkoutDelayDropdown = DropDown()
//    let profilesDropDown = DropDown()
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
    super.viewDidLoad()
        profileNameField.delegate = self
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
        phoneField.delegate = self
        addressField.delegate = self
        cityField.delegate = self
        stateField.delegate = self
        zipcodeField.delegate = self
        checkoutDelayField.delegate = self
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
        stateDropDown.width = stateField.bounds.width
        stateDropDown.layer.cornerRadius = stateField.layer.cornerRadius
        checkoutDelayDropdown.width = checkoutDelayField.bounds.width
        checkoutDelayDropdown.layer.cornerRadius = checkoutDelayField.layer.cornerRadius
        
        stateDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.stateField.text = item
        }
        checkoutDelayDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.checkoutDelayField.text = item
        }
//        findInfoFromAddress(address: "3826 Quarter Mile Drive")
//        profilesDropDown.width = profileNa.bounds.width
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
    func formattedNumber(number: String) -> String {
        let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "XXX-XXX-XXXX"

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
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(textField == phoneField) {
            guard let text = textField.text else { return false }
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            textField.text = formattedNumber(number: newString)
            return false
        } else if (textField == addressField) {
            findInfoFromAddress(address: textField.text! as! String)
            return true
        }else {
            return true
        }
        
    }
    @IBAction func statesViewClicked(_ sender: UIView) {
            endEditing()

            // The view to which the drop down will appear on
            stateDropDown.anchorView = stateField // UIView or UIBarButtonItem
        let states = [ "AK",
        "AL",
        "AR",
        "AS",
        "AZ",
        "CA",
        "CO",
        "CT",
        "DC",
        "DE",
        "FL",
        "GA",
        "GU",
        "HI",
        "IA",
        "ID",
        "IL",
        "IN",
        "KS",
        "KY",
        "LA",
        "MA",
        "MD",
        "ME",
        "MI",
        "MN",
        "MO",
        "MS",
        "MT",
        "NC",
        "ND",
        "NE",
        "NH",
        "NJ",
        "NM",
        "NV",
        "NY",
        "OH",
        "OK",
        "OR",
        "PA",
        "PR",
        "RI",
        "SC",
        "SD",
        "TN",
        "TX",
        "UT",
        "VA",
        "VI",
        "VT",
        "WA",
        "WI",
        "WV",
        "WY"]

            // The list of items to display. Can be changed dynamically
            stateDropDown.dataSource = states
            DropDown.appearance().textColor = UIColor.white
            DropDown.appearance().selectedTextColor = UIColor.white
            DropDown.appearance().textFont = UIFont(name: "Futura-Medium", size: 15)!
    //        DropDown.appearance().shadowOpacity = 0
            DropDown.appearance().shadowOpacity = 0.3
            DropDown.appearance().shadowColor = .black
            DropDown.appearance().backgroundColor = hexStringToUIColor(hex: "#21202f")
            DropDown.appearance().selectionBackgroundColor = hexStringToUIColor(hex: "#1d1c29")
            stateDropDown.dismissMode = .onTap
    //        DropDown.appearance().setupCornerRadius(9) // available since v2.3.6
    //        DropDown.appearance().cellHeight = 60
            stateDropDown.show()
        }
    func findInfoFromAddress(address: String) {
        CLGeocoder().geocodeAddressString(address, completionHandler: { (placemarks, error) in
            if error != nil {
                print(error)
//                self.zipcodeField.text = ""
//                
//                self.cityField.text = ""
//                self.stateField.text = ""
                return
            }
            if placemarks!.count > 0 {
                let placemark = placemarks?[0]
                let location = placemark?.location
                let coordinate = location?.coordinate
                let zipcode = placemark?.postalCode
                let city = placemark?.locality
                let state = placemark?.administrativeArea
                print("\nlat: \(coordinate!.latitude), long: \(coordinate!.longitude)")
//                if (placemark?.areasOfInterest!.count)! > 0 {
//                    let areaOfInterest = placemark!.areasOfInterest![0]
//                    print(areaOfInterest)
                    print("* zipcode: \(zipcode), city: \(city), state: \(state)")
                if(zipcode != nil && city != nil && state != nil) {
                self.zipcodeField.text = zipcode as! String
                
                self.cityField.text = city as! String
                self.stateField.text = state as! String
                } else {
                    self.zipcodeField.text = ""
                    
                    self.cityField.text = ""
                    self.stateField.text = ""
                }
//                } else {
//                    print("No area of interest found.")
//                }
            }
        })
    }
    @IBAction func delayViewClicked(_ sender: UIView) {
            endEditing()

            // The view to which the drop down will appear on
            checkoutDelayDropdown.anchorView = checkoutDelayField // UIView or UIBarButtonItem

            // The list of items to display. Can be changed dynamically
            checkoutDelayDropdown.dataSource = ["1000", "1250", "1500", "1750", "2000", "2250", "2500", "2750", "3000", "3250", "3500", "3750", "4000", "4250", "4500", "4750", "5000", "5250", "5500", "5750", "6000"]
            DropDown.appearance().textColor = UIColor.white
            DropDown.appearance().selectedTextColor = UIColor.white
            DropDown.appearance().textFont = UIFont(name: "Futura-Medium", size: 15)!
    //        DropDown.appearance().shadowOpacity = 0
            DropDown.appearance().shadowOpacity = 0.3
            DropDown.appearance().shadowColor = .black
            DropDown.appearance().backgroundColor = hexStringToUIColor(hex: "#21202f")
            DropDown.appearance().selectionBackgroundColor = hexStringToUIColor(hex: "#1d1c29")
            checkoutDelayDropdown.dismissMode = .onTap
    //        DropDown.appearance().setupCornerRadius(9) // available since v2.3.6
    //        DropDown.appearance().cellHeight = 60
            checkoutDelayDropdown.show()
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
extension addprofileview: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing()
        return true
    }
}
