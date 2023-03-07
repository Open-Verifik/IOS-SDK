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
    var verifikKYC: Verifik?
    var initVerifik = false
    let refId = "verifik_app_" + UUID().uuidString
    let projectID = "63c5620874ed501af5f983b1"
    let phone = "5514968760"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        verifik = Verifik(vc: self, token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjbGllbnRJZCI6IjYxNTc3MTU2OTBmMDEwOGNmMmRjNjI4MSIsImRvY3VtZW50VHlwZSI6IkNDIiwiZG9jdW1lbnROdW1iZXIiOiIxNjM1MzczMzY3NDY3NDMiLCJ2IjoxLCJyb2xlIjoiY2xpZW50IiwiZXhwaXJlc0F0IjoiMjAyMi0xMi0wNCAxOTozNjo1NSIsImlhdCI6MTY2NzU5MDYxNX0.QvyQyTXoQCzXlGGfBs2brK15_9AvoveFWTAgprHvRDc")
        verifikKYC = Verifik(vc: self, token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcHBSZWdpc3RyYXRpb25JZCI6IjYzZjUxZWRlNDcyM2U2MDU3MTg5NzRiMiIsImV4cGlyZXNBdCI6IjIwMjMtMDItMjEgMjA6MTM6MjYiLCJhY2Nlc3NUeXBlIjoiYXBwX3JlZ2lzdHJhdGlvbl9jcmVhdGVkIiwiZW1haWwiOiJjaGFybGllc2JsZWNrQGdtYWlsLmNvbSIsInBob25lIjoiNTUxNDk2ODc2MCIsImlhdCI6MTY3NzAwODYwNn0.w9u6Vh389qKVQHOKjZ5PNYfPr0VdYNcM7dbRGmXAF28")
    }

    @IBAction func tapOnLiveness(_ sender: Any) {
        if initVerifik {
            verifik?.liveness()
        }
    }
    @IBAction func tapOnEnroll(_ sender: Any) {
        if initVerifik {
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
            verifikKYC?.appRegistrationKYC(project: projectID,
                                        email: nil,
                                        phone: phone)
        }
    }
    @IBAction func tapOnAppLogin(_ sender: Any) {
        if initVerifik{
            verifikKYC?.appLoginKYC(project: projectID,
                                        email: nil,
                                        phone: phone)
        }
    }
    
    @IBAction func tapOnAppPhotoIdScan(_ sender: Any) {
        if initVerifik{
            verifikKYC?.appPhotoIDScanKYC(project: projectID, documentType: .passport)
        }
    }
}

extension ViewController: VerifikProtocol {
    
    func initVerifikSuccess() {
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
    
    func onLivenessDone(done: Bool) {
        if done {
            print("Se verifico que es un ser vivo")
        }
    }
    
    func livenessError(error: String) {
        print("Hubo un error al detectar vida: \(error)")
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
            let alert = UIAlertController(title: "Registro exitoso", message: resultToken, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.show(alert, sender: nil)
        }
    }
    
    func appRegisterError(error: String) {
        print("Hubo un error al intentar hacer el registro en la app: \(error)")
    }
    
    func onAppLoginDone(done: Bool, resultToken: String?) {
        if done{
            let alert = UIAlertController(title: "Login exitoso", message: resultToken, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.show(alert, sender: nil)
        }
    }
    
    func appLoginError(error: String) {
        print("Hubo un error al intentar hacer login a la app: \(error)")
    }
}
