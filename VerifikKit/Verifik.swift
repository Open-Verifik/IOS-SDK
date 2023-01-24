//
//  File.swift
//  VerifikKit
//
//  Created by Carlos Bleck on 28/10/22.
//

import Foundation
import UIKit
@_implementationOnly import FaceTecSDK

public class Verifik: NSObject, URLSessionDelegate{
        
    var vc: VerifikProtocol!
    var token: String!
    var latestSessionResult: FaceTecSessionResult!
    var latestIDScanResult: FaceTecIDScanResult!
    var latestExternalDatabaseRefID: String = ""
    var latestProcessor: Processor!
    var latestServerResult: [String: AnyObject]!
    
    public init(vc: VerifikProtocol, token: String) {
        self.vc = vc
        self.token = token
        
        let httpService = HttpService()
        httpService.getCredentials(vc: vc, token: token) {
            arg1, arg2, arg3 in
            Config.shared = Config(baseUrl: VerifikURL.Base, deviceKeyIdentifier: arg1, publicFaceScanEncryptionKey: arg2, prodKeyText: arg3)
            // Initialize FaceTec SDK
            Config.initializeFaceTec(completion: { initializationSuccessful in
                if(initializationSuccessful) {
                    vc.initializationSuccesful()
                }
                // Displays the FaceTec SDK Status to text field.
                // Return facetec check
                //vc.updateStatus(status: "\(FaceTec.sdk.description(for: FaceTec.sdk.getStatus()))")
            })
            
            // Set your FaceTec Device SDK Customizations.
            let currentTheme = Config.wasSDKConfiguredWithConfigWizard ? "Config Wizard Theme" : "FaceTec Theme"
            ThemeHelpers.setAppTheme(theme: currentTheme)
        }
    }
    
    public func liveness(){
        let httpService = HttpService()
        httpService.getSessionToken(vc: self.vc, token: token){ sessionToken in
            self.resetLatestResults()
            self.latestProcessor = VerifikLivenessProcessor(sessionToken: sessionToken, verifikToken: self.token, fromViewController: self.vc)
        }
    }
    
    // Initiate a 3D Liveness Check, then storing the 3D FaceMap in the Database, also known as "Enrollment".  A random externalDatabaseRefID is generated each time to guarantee uniqueness.
    public func enroll(externalDataBaseRefID: String){
        self.latestExternalDatabaseRefID = externalDataBaseRefID
        // Get a Session Token from the FaceTec SDK, then start the Enrollment.
        let httpService = HttpService()
        httpService.getSessionToken(vc: self.vc, token: token){ sessionToken in
            self.resetLatestResults()
            self.latestProcessor = VerifikEnrollmentProcessor(sessionToken: sessionToken, verifikToken: self.token, fromViewController: self.vc, externalDatabaseRef: self.latestExternalDatabaseRefID)
        }
    }
    
    // Perform 3D to 3D Authentication against the Enrollment previously performed.
    public func authenticate(externalDataBaseRefID: String){
        // For demonstration purposes, verify that we have an externalDatabaseRefID to Authenticate against.
        self.latestExternalDatabaseRefID = externalDataBaseRefID
        // Get a Session Token from the FaceTec SDK, then start the 3D to 3D Matching.
        let httpService = HttpService()
        httpService.getSessionToken(vc: self.vc, token: token){ sessionToken in
            self.resetLatestResults()
            self.latestProcessor = VerifikAuthProcessor(sessionToken: sessionToken, verifikToken: self.token, fromViewController: self.vc, externalDatabaseRef: self.latestExternalDatabaseRefID)
        }
    }
    
    // Perform a 3D Liveness Check, then an ID Scan, then Match the 3D FaceMap to the ID Scan.
    public func matchIDScan(){
        // Get a Session Token from the FaceTec SDK, then start the 3D Liveness Check.  On Success, ID Scanning will start automatically.
        let httpService = HttpService()
        httpService.getSessionToken(vc: self.vc, token: token){ sessionToken in
            self.resetLatestResults()
            self.latestExternalDatabaseRefID = "verifik_app_" + UUID().uuidString
            self.latestProcessor = VerifikPhotoIDMatchProcessor(sessionToken: sessionToken, verifikToken: self.token, fromViewController: self.vc, externalDatabaseRef: self.latestExternalDatabaseRefID)
        }
    }
    
    // ID Scan then return ID data.
    public func photoIDScan(){
        // Get a Session Token from the FaceTec SDK.  On Success, ID Scanning will start automatically.
        let httpService = HttpService()
        httpService.getSessionToken(vc: self.vc, token: token){ sessionToken in
            self.resetLatestResults()
            self.latestProcessor = VerifikPhotoIDScanProcessor(sessionToken: sessionToken, verifikToken: self.token, fromViewController: self.vc, externalDatabaseRef: self.latestExternalDatabaseRefID)
        }
    }
    
    // Perform an automatic user login with biometric
    public func appRegistrationKYC(project: String, email: String?, phone: String?){
        // Get a Session Token from the FaceTec SDK, then start the 3D to 3D Matching.
        let httpService = HttpService()
        httpService.getSessionToken(vc: self.vc, token: token){ sessionToken in
            self.resetLatestResults()
            self.latestProcessor = VerifikAppRegisterProcessor(sessionToken: sessionToken, verifikToken: self.token, fromViewController: self.vc, project: project, email: email, phone: phone)
        }
    }
    
    // When the FaceTec SDK is completely done, you receive control back here.
    // Since you have already handled all results in your Processor code, how you proceed here is up to you and how your App works.
    // In general, there was either a Success, or there was some other case where you cancelled out.
    func onComplete() {
        vc.onVerifikComplete()
        //vc.updateStatus(status: "See logs for more details.")
        
        if !self.latestProcessor.isSuccess() {
            // Reset the enrollment identifier.
            self.latestExternalDatabaseRefID = "";
        }
    }
    
    //
    // DEVELOPER NOTE:  This is a convenience function for demonstration purposes only so the Sample App can have access to the latest session results.
    // In your code, you may not even want or need to do this.
    //
    func setLatestSessionResult(sessionResult: FaceTecSessionResult) {
        latestSessionResult = sessionResult
    }
    
    func setLatestIDScanResult(idScanResult: FaceTecIDScanResult) {
        latestIDScanResult = idScanResult
    }
    
    func getLatestExternalDatabaseRefID() -> String {
        return latestExternalDatabaseRefID;
    }
    
    func resetLatestResults() {
        latestSessionResult = nil
        latestIDScanResult = nil
    }
}
