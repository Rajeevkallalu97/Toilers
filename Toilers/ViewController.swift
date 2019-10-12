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

class ViewController: UIViewController {
    var number=0
    //Onbaord declaration
    let presentationDelegate = ModalUIViewControllerPresenter()
    var myContext: OnboardingContext!
    var appId: String = ""
    var authPath: String = ""
    var serviceURL: URL = URL.init(string: "http://empty.org")!
    
    //logger settings
    let rootLogger = Logger.root
    let logger = Logger.shared(named: "ViewController")
    
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

        // Do any additional setup after loading the view.
//        calling onboarding functions
        //Onboarding function calls
        getAppConfig()
        UINavigationBar.applyFioriStyle()
        onboardOrRestore()
        
       

    }
    @IBAction func pressed(_ sender: Any) {
        number = number + 1
        print("Button pressed \(number) times")
        print("Log level of app is now at \(self.rootLogger.logLevel!)")
        logger.debug("Button pressed \(number) times")
        logger.warn("Button pressed \(number) times")
       // uploadLogs(myContext.sapURLSession, myContext.info[OnboardingInfoKey.sapcpmsSettingsParameters] as! SAPcpmsSettingsParameters)
        
        
        if ConnectivityUtils.isConnected() {
            if ConnectivityUtils.isWiFiConnected() {
                print("Currently connected by WiFi ")
            }
            else if ConnectivityUtils.isMobileConnected() {
                print("Currently connected by mobile data ")
             
            }
        }
        else {
            print("Currently offline with no network connection")
        }
          getProducts(serviceURL, myContext.sapURLSession)
    }
    
    
    
    //querycalls
    private func getProducts(_ serviceRoot: URL, _ urlSession: SAPURLSession) {
        let oDataProvider = OnlineODataProvider(serviceName: "InspectproService", serviceRoot: serviceRoot, sapURLSession: urlSession)
        oDataProvider.serviceOptions.checkVersion = false
        let espmContainer = InspectproService(provider: oDataProvider)
        let query = DataQuery()
            .select(LoginType.password)
            .where(LoginType.id==("103"))
        espmContainer.fetchLogin(matching: query) { products, error in
            guard let products = products else {
                print("Error fetching products:  \(error!.localizedDescription)")
                return
            }
            print("Got \(products.count) products and the first product name is \(products[0].password!)")
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
        //step.defaultPasscodePolicy = nil
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
    
    
    //query call
   /* private func getProducts(_ serviceRoot: URL, _ urlSession: SAPURLSession) {
        let oDataProvider = OnlineODataProvider(serviceName: "ESPMContainer", serviceRoot: serviceRoot, sapURLSession: urlSession)
        let espmContainer = ESPMContainer(provider: oDataProvider)
        espmContainer.fetchProducts() { products, error in
            guard let products = products else {
                print("Error fetching products:  \(error!.localizedDescription)")
                return
            }
            print("Got \(products.count) products and the first product name is \(products[0].name!)")
        }*/
    
    
}

