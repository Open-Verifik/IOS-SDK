//
//  ViewController.swift
//  AnotherSampleVerifik
//
//  Created by Carlos Bleck on 14/09/23.
//

import UIKit
import VerifikKit

class ViewController: UIViewController {
    private var initVerifik = false
    private var verifik : Verifik?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        verifik = Verifik(vc: self, token: "", vp: self)
    }

    @IBAction func tapOnStart(_ sender: Any) {
        
        if initVerifik {
            verifik?.authenticate(externalDataBaseRefID: "0001")
        }
    }
    
}

extension ViewController: VerifikProtocol {
    func initVerifikSuccess() {
        initVerifik = true
    }
    
    func configError(error: String) {}
    
    func sessionError(error: String) {}
    
    func onVerifikComplete() {}
    
    
    func appLoginError(error: String) {}
    
    func appPhotoIDScanError(error: String) {}
    
    func appRegisterError(error: String) {}
    
    func authError(error: String) {}
    
    func enrollmentError(error: String) {}
    
    func livenessError(error: String) {}
    
    func onAppLoginDone(done: Bool, resultToken: String?) {}
    
    func onAppPhotoIDScanDone(done: Bool, resultID: String?) {}
    
    func onAppRegisterDone(done: Bool, resultToken: String?) {}
    
    func onAuthDone(done: Bool) {}
    
    func onEnrollmentDone(done: Bool) {}
    
    func onLivenessDone(done: Bool) {}
    
    func onPhotoIDMatchDone(done: Bool) {}
    
    func onPhotoIDScan(done: Bool) {}
    
    func photoIDMatchError(error: String) {}
    
    func photoIDScanError(error: String) {}
}
