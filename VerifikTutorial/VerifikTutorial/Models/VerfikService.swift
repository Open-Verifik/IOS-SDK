//
//  VerfikService.swift
//  VerifikTutorial
//
//  Created by Carlos Bleck on 20/12/22.
//

import Foundation
import VerifikKit

struct VerifikService {
    var group: String
    var title: String
    var ready: Bool
    var description: String
    var time: String
    var parameters: String
    var successCriteria: String
    var step1: String
    var step2: String
    var theme: Theme
    var verifikType: VerifikType
}

enum VerifikType {
    
    case liveness
    case register
    case login
    case matchID
    case OCR
    case age2D
    case livenessImage
    case match2D
    case age
    case facescanImage
    case passwordless
    case kyc
}

extension VerifikService {
    static let sampleData: [VerifikService] =
    [
        VerifikService(group: NSLocalizedString("Biometric", comment: ""), title: NSLocalizedString("Liveness Check", comment: ""), ready: false, description: NSLocalizedString("Liveness Check Desc", comment: ""), time: "10 min", parameters: NSLocalizedString("Liveness Parameters", comment: ""), successCriteria: NSLocalizedString("Liveness Criteria", comment: ""), step1: NSLocalizedString("Liveness Step 1", comment: ""), step2: NSLocalizedString("Liveness Step 2", comment: ""), theme: .yellow, verifikType: .liveness),
        VerifikService(group: NSLocalizedString("Biometric", comment: ""), title: NSLocalizedString("Biometric Registration", comment: ""), ready: true, description: NSLocalizedString("Biometric Registration Desc", comment: ""), time: "10 min", parameters:NSLocalizedString("Biometric Registration Parameters", comment: ""), successCriteria: NSLocalizedString("Biometric Registration Criteria", comment: ""), step1: NSLocalizedString("Biometric Registration Step 1", comment: ""), step2: NSLocalizedString("Biometric Registration Step 2", comment: ""), theme: .orange, verifikType: .register),
        VerifikService(group: NSLocalizedString("Biometric", comment: ""), title: NSLocalizedString("Biometrics Login", comment: ""), ready: true, description: NSLocalizedString("Biometrics Login Desc", comment: ""), time: "5 min", parameters:NSLocalizedString("Biometrics Login Parameters", comment: ""), successCriteria: NSLocalizedString("Biometrics Login Criteria", comment: ""), step1: NSLocalizedString("Biometrics Login Step 1", comment: ""), step2: NSLocalizedString("Biometrics Login Step 2", comment: ""), theme: .lavender, verifikType: .login),
        VerifikService(group: NSLocalizedString("Biometric", comment: ""), title: NSLocalizedString("Match ID", comment: ""), ready: true, description: NSLocalizedString("Match ID Desc", comment: ""), time: "10 min", parameters:NSLocalizedString("Match ID Parameters", comment: ""), successCriteria: NSLocalizedString("Match ID Criteria", comment: ""), step1: NSLocalizedString("Match ID Step 1", comment: ""), step2: NSLocalizedString("Match ID Step 2", comment: ""), theme: .indigo, verifikType: .matchID),
        VerifikService(group: NSLocalizedString("Biometric", comment: ""), title: NSLocalizedString("OCR", comment: ""), ready: true, description: NSLocalizedString("OCR Desc", comment: ""), time: "10 min", parameters:NSLocalizedString("OCR Parameters", comment: ""), successCriteria: NSLocalizedString("OCR Criteria", comment: ""), step1: NSLocalizedString("OCR Step 1", comment: ""), step2: NSLocalizedString("OCR Step 2", comment: ""), theme: .navy, verifikType: .OCR),
        VerifikService(group: NSLocalizedString("Biometric", comment: ""), title: NSLocalizedString("Image Age", comment: ""), ready: true, description: NSLocalizedString("Image Age Desc", comment: ""), time: "10 min", parameters:NSLocalizedString("Image Age Parameters", comment: ""), successCriteria: NSLocalizedString("Image Age Criteria", comment: ""), step1: NSLocalizedString("Image Age Step 1", comment: ""), step2: NSLocalizedString("Image Age Step 2", comment: ""), theme: .sky, verifikType: .age2D),
        VerifikService(group: NSLocalizedString("Biometric", comment: ""), title: NSLocalizedString("Liveness Image", comment: ""), ready: true, description: NSLocalizedString("Liveness Image Desc", comment: ""), time: "10 min", parameters:NSLocalizedString("Liveness Image Parameters", comment: ""), successCriteria: NSLocalizedString("Liveness Image Criteria", comment: ""), step1: NSLocalizedString("Liveness Image Step 1", comment: ""), step2: NSLocalizedString("Liveness Image Step 2", comment: ""), theme: .buttercup, verifikType: .livenessImage),
        VerifikService(group: NSLocalizedString("Biometric", comment: ""), title: NSLocalizedString("Match 2D", comment: ""), ready: true, description: NSLocalizedString("Match 2D Desc", comment: ""), time: "10 min", parameters:NSLocalizedString("Match 2D Parameters", comment: ""), successCriteria: NSLocalizedString("Match 2D Criteria", comment: ""), step1: NSLocalizedString("Match 2D Step 1", comment: ""), step2: NSLocalizedString("Match 2D Step 2", comment: ""), theme: .teal, verifikType: .match2D),
        VerifikService(group: NSLocalizedString("Biometric", comment: ""), title: NSLocalizedString("Age", comment: ""), ready: true, description: NSLocalizedString("Age Desc", comment: ""), time: "10 min", parameters:NSLocalizedString("Age Parameters", comment: ""), successCriteria: NSLocalizedString("Age Criteria", comment: ""), step1: NSLocalizedString("Age Step 1", comment: ""), step2: NSLocalizedString("Age Step 2", comment: ""), theme: .bubblegum, verifikType: .age),
        VerifikService(group: NSLocalizedString("Biometric", comment: ""), title: NSLocalizedString("Facescan Image", comment: ""), ready: false, description: NSLocalizedString("Facescan Image Desc", comment: ""), time: "10 min", parameters:NSLocalizedString("Facescan Image Parameters", comment: ""), successCriteria: NSLocalizedString("Facescan Image Criteria", comment: ""), step1: NSLocalizedString("Facescan Image Step 1", comment: ""), step2: NSLocalizedString("Facescan Image Step 2", comment: ""), theme: .seafoam, verifikType: .facescanImage)
    ]
}
