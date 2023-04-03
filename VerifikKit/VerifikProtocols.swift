//
//  Liveness.swift
//  VerifikKit
//
//  Created by Carlos Bleck on 27/10/22.
//

import Foundation
import UIKit

public protocol VerifikProtocol: UIViewController, URLSessionDelegate{
    // MARK: General Config
    func initVerifikSuccess()
    func configError(error: String)
    func sessionError(error: String)
    func onVerifikComplete()
    // MARK: Biometrics
    func onLivenessDone(done: Bool)
    func livenessError(error: String)
    func onEnrollmentDone(done: Bool)
    func enrollmentError(error: String)
    func onAuthDone(done: Bool)
    func authError(error: String)
    func onPhotoIDMatchDone(done: Bool)
    func photoIDMatchError(error: String)
    func onPhotoIDScan(done: Bool)
    func photoIDScanError(error: String)
    // MARK: KYC
    func onAppRegisterDone(done: Bool, resultToken: String?)
    func appRegisterError(error: String)
    func onAppLoginDone(done: Bool, resultToken: String?)
    func appLoginError(error: String)
    func onAppPhotoIDScanDone(done: Bool, resultID: String?)
    func appPhotoIDScanError(error: String)
}

public extension VerifikProtocol{
    // MARK: Biometrics
    func onLivenessDone(done: Bool) {}
    func livenessError(error: String) {}
    func onEnrollmentDone(done: Bool) {}
    func enrollmentError(error: String) {}
    func onAuthDone(done: Bool) {}
    func authError(error: String) {}
    func onPhotoIDMatchDone(done: Bool) {}
    func photoIDMatchError(error: String) {}
    func onPhotoIDScan(done: Bool) {}
    func photoIDScanError(error: String) {}
    // MARK: KYC
    func onAppRegisterDone(done: Bool, resultToken: String?) {}
    func appRegisterError(error: String) {}
    func onAppLoginDone(done: Bool, resultToken: String?) {}
    func appLoginError(error: String) {}
    func onAppPhotoIDScanDone(done: Bool, resultID: String?) {}
    func appPhotoIDScanError(error: String) {}
}

public enum VerifikDocumentType: String {
    case license = "useLicense"
    case passport = "usePassport"
    case government = "useGovernmentID"
    
    func shortName() -> String {
        var shortName = ""
        switch self {
        case .license:
            shortName = "DL"
        case .passport:
            shortName = "PA"
        case .government:
            shortName = "CC"
        }
        return shortName
    }
}

