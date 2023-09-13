//
//  Liveness.swift
//  VerifikKit
//
//  Created by Carlos Bleck on 27/10/22.
//

import Foundation
import UIKit

@objc
public protocol VerifikProtocol: URLSessionDelegate {
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

@objc
public enum VerifikDocumentType: Int, RawRepresentable {
    case license
    case passport
    case government
    case automatic_detection
    
    public typealias RawValue = String
    
    public var rawValue: RawValue {
        switch self {
            case .license:
                return "useLicense"
            case .passport:
                return "usePassport"
            case .government:
                return "useGovernmentID"
            case .automatic_detection:
                return "automatic"
        }
    }
    
    public init?(rawValue: RawValue) {
        switch rawValue {
            case "useLicense":
                self = .license
            case "usePassport":
                self = .passport
            case "useGovernmentID":
                self = .government
            case "automatic":
                self = .automatic_detection
            default:
                return nil
        }
    }
    
    func shortName() -> String {
        var shortName = ""
        switch self {
        case .license:
            shortName = "DL"
        case .passport:
            shortName = "PA"
        case .government:
            shortName = "CC"
        case .automatic_detection:
            shortName = "-"
        }
        return shortName
    }
}

