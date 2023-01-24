//
//  ViewController.swift
//  SampleVerifik
//
//  Created by Carlos Bleck on 04/11/22.
//

import UIKit
import VerifikKit

class ViewController: UIViewController{
    var verifik: Verifik?
    var initVerifik = false
    let refId = "verifik_app_" + UUID().uuidString
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        verifik = Verifik(vc: self, token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjbGllbnRJZCI6IjYxNTc3MTU2OTBmMDEwOGNmMmRjNjI4MSIsImRvY3VtZW50VHlwZSI6IkNDIiwiZG9jdW1lbnROdW1iZXIiOiIxNjM1MzczMzY3NDY3NDMiLCJ2IjoxLCJyb2xlIjoiY2xpZW50IiwiZXhwaXJlc0F0IjoiMjAyMi0xMi0wNCAxOTozNjo1NSIsImlhdCI6MTY2NzU5MDYxNX0.QvyQyTXoQCzXlGGfBs2brK15_9AvoveFWTAgprHvRDc")
    }

    @IBAction func tapOnEnroll(_ sender: Any) {
        if initVerifik{
            verifik?.enroll(externalDataBaseRefID: refId)
        }
    }
    
    @IBAction func tapOnAuthenticate(_ sender: Any) {
        if initVerifik{
            verifik?.authenticate(externalDataBaseRefID: refId)
        }
    }
    
    @IBAction func tapOnVerifyID(_ sender: Any) {
        if initVerifik{
            verifik?.matchIDScan()
        }
    }
    
    @IBAction func tapOnOCR(_ sender: Any) {
        if initVerifik{
            verifik?.photoIDScan()
        }
    }
    
    @IBAction func tapOnAppRegistration(_ sender: Any) {
        if initVerifik{
            verifik?.appRegistrationKYC(project: "63c5620874ed501af5f983b1", email: nil, phone: phoneTextField.text)
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
    
    func onAppRegisterDone(done: Bool, resultToken: String?) {
        if done{
            let alert = UIAlertController(title: "Login exitoso", message: resultToken, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.show(alert, sender: nil)
        }
    }
    
    func appRegisterError(error: String) {
        print("Hubo un error al intentar hacer el registro en la app: \(error)")
    }
}
