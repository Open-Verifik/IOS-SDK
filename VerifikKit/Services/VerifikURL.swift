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
    static let Enroll = "/biometrics/enroll"
    static let Authenticate = "/biometrics/authenticate"
    static let MatchID = "/biometrics/match-idscan"
    static let IDScan = "/biometrics/idscan"
    static let AppRegisterKYC = "/projects/kyc/biometrics-login"
}
