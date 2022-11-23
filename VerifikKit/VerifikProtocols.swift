//
//  Liveness.swift
//  VerifikKit
//
//  Created by Carlos Bleck on 27/10/22.
//

import Foundation
import UIKit
@_implementationOnly import FaceTecSDK

public protocol VerifikProtocol: UIViewController, URLSessionDelegate{
    func initializationSuccesful()
    func configError(error: String)
    func sessionError(error: String)
    func onVerifikComplete()
    
    func onEnrollmentDone()
    func enrollmentError(error: String)
    func onAuthDone()
    func authError(error: String)
    func onPhotoIDMatchDone()
    func photoIDMatchError(error: String)
    func onPhotoIDScan()
    func photoIDScanError(error: String)
}

public extension VerifikProtocol{
    func onEnrollmentDone() {}
    func enrollmentError(error: String) {}
    func onAuthDone() {}
    func authError(error: String) {}
    func onPhotoIDMatchDone() {}
    func photoIDMatchError(error: String) {}
    func onPhotoIDScan() {}
    func photoIDScanError(error: String) {}
}
