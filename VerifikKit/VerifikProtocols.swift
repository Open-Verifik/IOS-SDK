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
    func onAuthDone()
    func onPhotoIDMatchDone()
    func onPhotoIDScan()
}

public extension VerifikProtocol{
    func onEnrollmentDone() {}
    func onAuthDone() {}
    func onPhotoIDMatchDone() {}
    func onPhotoIDScan() {}
}
