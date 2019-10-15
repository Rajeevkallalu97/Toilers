//
//  ViewController.swift
//  Toilers
//
//  Created by Sai rajeev Kallalu on 12/10/19.
//  Copyright © 2019 Sai rajeev Kallalu. All rights reserved.
//

import UIKit
import SAPFoundation
import SAPFioriFlows
import SAPOData
import SAPCommon


class SupervisorViewController: UIViewController {
    
    @IBOutlet weak var ID: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    //Onbaord declaration
    let presentationDelegate = ModalUIViewControllerPresenter()
    var myContext: OnboardingContext!
    var appId: String = ""
    var authPath: String = ""
    var serviceURL: URL = URL.init(string: "http://empty.org")!
    
    //logger settings
    let rootLogger = Logger.root
    let logger = Logger.shared(named: "SupervisorViewController")
    
    //Steps executed during Onboarding
    private var onboardingSteps: [OnboardingStep] {
        return [
            //self.configuredWelcomeScreenStep(),
            SAPcpmsSessionConfigurationStep(),
            BasicAuthenticationStep(),
            SAPcpmsSettingsDownloadStep(),
            SAPcpmsLogSettingsApplyStep(),
            self.configuredStoreManagerStep(),
        ]
    }
    
    //Steps executed during Restoring
    private var restoringSteps: [OnboardingStep] {
        return [
            self.configuredStoreManagerStep(),
            //self.configuredWelcomeScreenStep(),
            SAPcpmsSessionConfigurationStep(),
            BasicAuthenticationStep(),
            SAPcpmsSettingsDownloadStep(),
            SAPcpmsLogSettingsApplyStep(),
        ]
    }
    
    
    //segue function
  func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SupervisorHome" {
            segue.destination as! SupervisorHomeViewController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //logger
        do {
            try SAPcpmsLogUploader.attachToRootLogger()
        }
        catch {
            logger.error("Failed to attach to root logger.", error: error)
        }
        
        
        //logger method call
        rootLogger.logLevel = LogLevel.debug
        
        //Onboarding function calls
        getAppConfig()
        UINavigationBar.applyFioriStyle()
        onboardOrRestore()
      
    }
    
    
    
    
    @IBAction func pressed(_ sender: Any) {
        
       
        loginSupervisor(serviceURL, myContext.sapURLSession)
        
    
    }
    
  
    private func loginSupervisor(_ serviceRoot: URL, _ urlSession: SAPURLSession) {
        let oDataProvider = OnlineODataProvider(serviceName: "InspectproService", serviceRoot: serviceRoot, sapURLSession: urlSession)
        oDataProvider.serviceOptions.checkVersion = false
        let supervisor = InspectproService(provider: oDataProvider)
        
        let queryId = DataQuery()
            .select(SupervisorType.id)
            .where(SupervisorType.id==(ID.text!))
        
        let queryPassword = DataQuery()
            .select(SupervisorType.password)
            .where(SupervisorType.id==(ID.text!))
        
        supervisor.fetchSupervisor(matching: queryId) { userId, error in
            let userId = userId
            if userId!.count>0 {
                supervisor.fetchSupervisor(matching: queryPassword) { userPassword, error in
                    let userPassword = userPassword
                    if self.Password.text == userPassword?[0].password! {
                        self.performSegue(withIdentifier: "SupervisorHome", sender: nil)
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
    
    
    
    
    
    //logger functions
    private func uploadLogs(_ urlSession: SAPURLSession, _ settingsParameters: SAPcpmsSettingsParameters) {
        SAPcpmsLogUploader.uploadLogs(sapURLSession: urlSession, settingsParameters: settingsParameters) { error in
            if let error = error {
                self.logger.error("Error happened during log upload.", error: error)
                return
            }
            print("Logs have been uploaded successfully.")
        }
    }
    
    
    
    //onboard functions
    func configuredWelcomeScreenStep() -> WelcomeScreenStep {
        let discoveryConfigurationTransformer = DiscoveryServiceConfigurationTransformer(applicationID: appId, authenticationPath: authPath)
        
        //use values published in the discovery service.
        let welcomeScreenStep = WelcomeScreenStep(transformer: discoveryConfigurationTransformer, providers: [DiscoveryServiceConfigurationProvider(applicationID: appId)])
        
        //use the values from ConfigurationProvider.plist
        //let welcomeScreenStep = WelcomeScreenStep(transformer: discoveryConfigurationTransformer, providers: [FileConfigurationProvider()])
        
        welcomeScreenStep.welcomeScreenCustomizationHandler = { welcomeScreen in
            welcomeScreen.isDemoModeAvailable = false
            welcomeScreen.headlineLabel.text = "Getting Started with the SAP Cloud Platform SDK for iOS"
            welcomeScreen.detailLabel.text = "Use this app to explore the SAP Cloud Platform SDK for iOS"
            welcomeScreen.primaryActionButton.titleLabel?.text = "Start"
        }
        return welcomeScreenStep
    }
    
    func configuredStoreManagerStep() -> StoreManagerStep {
        let step = StoreManagerStep()
        //If passcode policy is disabled on the server and the next line is uncommented, the app won’t be protected with a passcode
        step.defaultPasscodePolicy = nil
        return step
    }
    
    func onboardOrRestore() {
        myContext = OnboardingContext(presentationDelegate: presentationDelegate)
        //skip screen
        let settingsParameters = SAPcpmsSettingsParameters(backendURL: URL(string: "https://hcpms-p2001709781trial.hanatrial.ondemand.com/")!, applicationID: "com.inspectpro.app")
        myContext.info[.sapcpmsSettingsParameters] = settingsParameters
        myContext.info[.authenticationURL] = URL(string: "https://hcpms-p2001709781trial.hanatrial.ondemand.com/com.inspectpro.app")!
        //If we previously onboarded
        if let savedUUIDString = UserDefaults.standard.string(forKey: "userOnboardingID"), let uuid = UUID(uuidString: savedUUIDString) {
            myContext.onboardingID = uuid
            OnboardingFlowController.restore(on: restoringSteps, context: myContext) { result in
                print("and the result is ...")
                switch result {
                case let .success(context):
                    print("Successfully restored")
                    self.myContext = context
                    //get host port from registration rather than hardcoded in plist with Discovery Service
                    //does not work when offline
                //self.serviceURL = context.authenticationURL!
                case let .failed(error):
                    print("Failed to restore: \(error)")
                    if (error.localizedDescription == "Passcode reset!") {
                        self.unregister()
                    }
                }
            }
        }
            //First time the app is opened so perform the onboarding flow
        else {
            OnboardingFlowController.onboard(on: onboardingSteps, context: myContext) { result in
                print("and the result is ...")
                switch result {
                case let .success(context):
                    self.myContext = context
                    //get host port from registration rather than hardcoded in plist with Discovery Service
                    //does not work when offline
                    //self.serviceURL = context.authenticationURL!
                    UserDefaults.standard.set(context.onboardingID.uuidString, forKey:"userOnboardingID")
                    print("Successfully onboarded")
                case let .failed(error):
                    print("Failed to onboard, retrying due to: \(error)")
                    URLCache.shared.removeAllCachedResponses()
                    HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
                    self.onboardOrRestore()
                }
            }
        }
    }
    
    func unregister() {
        OnboardingFlowController.reset(on: self.restoringSteps, context: myContext) {
            URLCache.shared.removeAllCachedResponses()
            HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
            UserDefaults.standard.set(nil, forKey:"userOnboardingID")
            self.onboardOrRestore()
        }
    }
    
    func getAppConfig() {
        var host = ""
        if let path = Bundle.main.path(forResource: "ConfigurationProvider", ofType: "plist") {
            let myDict = NSDictionary(contentsOfFile: path)
            appId = myDict?.object(forKey: "appId") as! String
            authPath = myDict?.object(forKey: "authPath") as! String
            host = myDict?.object(forKey: "host") as! String
        }
        serviceURL = URL.init(string: "https://\(host)/\(authPath)")!
    }
    

    
    

}


