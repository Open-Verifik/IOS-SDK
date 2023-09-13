//
//  VerifikURL.swift
//  VerifikKit
//
//  Created by Carlos Bleck on 02/11/22.
//

import Foundation

class VerifikURL{
    //static let Base = "https://staging-api.verifik.co/v2"
    static let Base = "https://api.verifik.co/v2"
    static let BaseKYC = "https://api.verifik.co/v2"
    static let Credentials = "/biometrics/config"
    static let Session = "/biometrics/session"
    static let Liveness = "/biometrics/liveness"
    static let Enroll = "/biometrics/enrollment-3d"
    static let Authenticate = "/biometrics/match-3d-3d"
    static let MatchID = "/biometrics/match-3d-2d-idscan"
    static let IDScan = "/biometrics/idscan-only"
    static let AppRegisterKYC = "/projects/kyc/biometrics-sign-up"
    static let AppLoginKYC = "/projects/kyc/biometrics-login"
    static let AppPhotoIDKYC = "/projects/photo-id"
}
