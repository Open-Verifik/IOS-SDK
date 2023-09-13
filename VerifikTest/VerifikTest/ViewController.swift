//
//  ViewController.swift
//  VerifikText
//
//  Created by Carlos Bleck on 28/10/22.
//

import UIKit
import VerifikKit

class ViewController: UIViewController {
    var verifik: Verifik?
    var initVerifik = false
    let refId = "verifik_app_" + UUID().uuidString

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        verifik = Verifik(vc: self, token: "")
    }

    @IBAction func tapAndVerify(_ sender: Any) {
        if initVerifik{
            verifik?.photoIDScan()
        }
    }
    

}

extension ViewController: VerifikProtocol {
    
    func initializationSuccesful() {
        initVerifik = true
        print("Se inició correctamente el sdk de Verifik")
    }
    
    func configError(error: String) {
        print("Hay un error con el sdk de Verifik: \(error)")
    }
    
    func sessionError(error: String) {
        print("Hay un error con la sesión de Verifik: \(error)")
    }
    
    func onVerifikComplete(){
        
    }
    
    func onEnrollmentDone(done: Bool) {
        if done{
            print("Se registro el rostro correctamente")
        }
    }
    func enrollmentError(error: String) {
        print("Hubo un error al registrar el rostro: \(error)")
    }
    func onAuthDone(done: Bool) {
        if done{
            print("Se autenticó el rostro correctamente")
        }
    }
    func authError(error: String) {
        print("Hubo un error al autenticar el rostro: \(error)")
    }
    func onPhotoIDMatchDone(done: Bool) {
        if done{
            print("Se registro correctamente el rostro con la identificación")
        }
    }
    func photoIDMatchError(error: String) {
        print("Hubo un error al registrar el rostro con la identificación: \(error)")
    }
    func onPhotoIDScan(done: Bool) {
        if done{
            print("Se escaneo correctamente la identificación")
        }
    }
    func photoIDScanError(error: String) {
        print("Hubo un error al escanear la identificación")
    }
}
