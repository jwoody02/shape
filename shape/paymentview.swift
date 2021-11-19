//
//  paymentview.swift
//  shape
//
//  Created by Jordan Wood on 2/26/20.
//  Copyright © 2020 jwood. All rights reserved.
//

import Foundation
import UIKit
import Stripe
public class paymentview: UIViewController {
    var paymentField = STPPaymentCardTextField()
    public override func viewDidLoad() {
        super.viewDidLoad()
        print("* creating card view")
        
//        paymentField.frame = CGRectMake(15, 110, self.view.frame.width - 30, 44)
//        paymentField.delegate = self
//        paymentField.cardNumber = "42424242424242424242"
//        self.view.addSubview(paymentField)
//        view.backgroundColor = UIColor.white
        view.addSubview(paymentField)
        paymentField.borderColor = hexStringToUIColor(hex: "#21202f")
        paymentField.backgroundColor = hexStringToUIColor(hex: "#1d1c29")
        paymentField.textColor = .white
        paymentField.borderWidth = 2.0
        paymentField.font = UIFont (name: "Futura-Medium", size: 17)
        
        view.backgroundColor = hexStringToUIColor(hex: "#1d1c29")
    }
    @objc func done() {
        dismiss(animated: true, completion: nil)
    }

    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        paymentField.becomeFirstResponder()
    }

    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let padding: CGFloat = 15
        paymentField.frame = CGRect(x: padding,
                                 y: padding+7,
                                 width: view.bounds.width - (padding * 2),
                                 height: 50)
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
