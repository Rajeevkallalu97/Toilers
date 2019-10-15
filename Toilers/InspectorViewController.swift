//
//  InspectorViewController.swift
//  Toilers
//
//  Created by Sai rajeev Kallalu on 14/10/19.
//  Copyright © 2019 Sai rajeev Kallalu. All rights reserved.
//

import UIKit
import SAPFoundation
import SAPFioriFlows
import SAPOData
import SAPCommon


class InspectorViewController: UIViewController {

    
    let `super` = SupervisorViewController()
    @IBOutlet weak var inspectorpassword: UITextField!
    @IBOutlet weak var inspectorID: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    `super`.getAppConfig()
    `super`.onboardOrRestore()
    
}




@IBAction func pressed(_ sender: Any) {
    
    
    loginInspector(`super`.serviceURL, `super`.myContext.sapURLSession)
    
    
}



private func loginInspector(_ serviceRoot: URL, _ urlSession: SAPURLSession) {
    let oDataProvider = OnlineODataProvider(serviceName: "InspectproService", serviceRoot: serviceRoot, sapURLSession: urlSession)
    oDataProvider.serviceOptions.checkVersion = false
    let inspector = InspectproService(provider: oDataProvider)
    
    let queryId = DataQuery()
        .select(InspectorType.id)
        .where(InspectorType.id==(inspectorID.text!))
    
    let queryPassword = DataQuery()
        .select(InspectorType.password)
        .where(InspectorType.id==(inspectorID.text!))
    
    inspector.fetchInspector(matching: queryId) { userId, error in
        let userId = userId
        if userId!.count>0 {
            inspector.fetchInspector(matching: queryPassword) { userPassword, error in
                let userPassword = userPassword
                if self.inspectorpassword.text == userPassword?[0].password! {
                    //shows next screen
                    print("success ")
                }
                else{
                    Alert.showPasswordInvalid(on: self)
                    print("invalid pass")
                }
            }
            
        }
        else{
            Alert.showIdInvalid(on: self)
            print("invalid id")
        }
    }
}

    
}
