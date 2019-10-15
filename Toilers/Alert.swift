//
//  Alert.swift
//  Toilers
//
//  Created by Sai rajeev Kallalu on 14/10/19.
//  Copyright © 2019 Sai rajeev Kallalu. All rights reserved.
//

import Foundation
import UIKit
struct Alert {

    
   private static func basicAlertPattern(on pvc : UIViewController, wiht title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        pvc.present(alert, animated: true)
    
    }
    
    static func showIdInvalid(on pvc : UIViewController){
        basicAlertPattern(on: pvc, wiht: "Invalid ID", message: "Please Enter a valid ID")
    }
    
    static func showPasswordInvalid(on pvc : UIViewController){
      basicAlertPattern(on: pvc, wiht: "Invalid Password", message: "Please Enter a valid Password")
    
   }
}
