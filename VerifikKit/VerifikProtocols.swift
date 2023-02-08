//
//  Liveness.swift
//  VerifikKit
//
//  Created by Carlos Bleck on 27/10/22.
//

import Foundation
import UIKit

public protocol VerifikProtocol: UIViewController, URLSessionDelegate{
    func initializationSuccesful()
    func configError(error: String)
    func sessionError(error: String)
    func onVerifikComplete()
    
    func onEnrollmentDone(done: Bool)
    func enrollmentError(error: String)
    func onAuthDone(done: Bool)
    func authError(error: String)
    func onPhotoIDMatchDone(done: Bool)
    func photoIDMatchError(error: String)
    func onPhotoIDScan(done: Bool)
    func photoIDScanError(error: String)
    func onAppRegisterDone(done: Bool, resultToken: String?)
    func appRegisterError(error: String)
}

public extension VerifikProtocol{
    func onEnrollmentDone(done: Bool) {}
    func enrollmentError(error: String) {}
    func onAuthDone(done: Bool) {}
    func authError(error: String) {}
    func onPhotoIDMatchDone(done: Bool) {}
    func photoIDMatchError(error: String) {}
    func onPhotoIDScan(done: Bool) {}
    func photoIDScanError(error: String) {}
    func onAppRegisterDone(done: Bool, resultToken: String?) {}
    func appRegisterError(error: String) {}
}
