//
//  VerifikViewController.swift
//  VerifikTutorial
//
//  Created by Carlos Bleck on 06/01/23.
//

import UIKit
import VerifikKit
import SwiftUI

class VerifikViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    var verifikService: VerifikService?
    var token: String?
    var uuid: String{
        get{
            if let uuid = UserDefaults.standard.string(forKey: "uuid_verifik"){
                return uuid
            }
            let newUuid = ("verifik_app_" + UUID().uuidString)
            UserDefaults.standard.set(newUuid, forKey: "uuid_verifik")
            return newUuid
        }
    }
    var verifik: Verifik?
    var verifikInitSuccess = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        startButton.setTitle(NSLocalizedString("Start", comment: ""), for: .normal)
        verifik = Verifik(vc: self, token: token ?? "", vp: self)
    }


    @IBAction func startVerifik(_ sender: Any) {
        if verifikInitSuccess{
            switch verifikService?.verifikType{
            case .liveness:
                //verifik.liveness()
                verifik?.photoIDScan(externalDataBaseRefID: "0001")
                break
            case .register:
                verifik?.enroll(externalDataBaseRefID: uuid)
            case .login:
                verifik?.authenticate(externalDataBaseRefID: uuid)
            case .matchID:
                //verifik.matchID()
                break
            case .OCR:
                verifik?.photoIDScan(externalDataBaseRefID: "0001")
            case .age2D:
                //verifik.age2D()
                break
            case .livenessImage:
                //verifik.livenessImage()
                break
            case .match2D:
                //verifik.match2D()
                break
            case .age:
                //verifik.age()
                break
            case .facescanImage:
                //verifik.facescanImage()
                break
            case .passwordless:
                //verifik.passwordless()
                break
            case .kyc:
                //verifik.kyc()
                break
            case .none:
                break
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension VerifikViewController: VerifikProtocol {
    
    func initVerifikSuccess() {
        let alertC = UIAlertController(title: "Verifik SDK init successfully", message: "Everything is ok", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
        })
        alertC.addAction(ok)
        self.present(alertC, animated: true)
        verifikInitSuccess = true
    }
    
    func configError(error: String) {
        let alertC = UIAlertController(title: "Verifik SDK error", message: "Please check your token to init Verifik SDK", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
        })
        alertC.addAction(ok)
        self.present(alertC, animated: true)
    }
    
    func sessionError(error: String) {
        let alertC = UIAlertController(title: "Verifik SDK error", message: "Please contact Verifik Support Team", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
        })
        alertC.addAction(ok)
        self.present(alertC, animated: true)
    }
    
    func onVerifikComplete() {
        let alertC = UIAlertController(title: "Verifik process finished", message: "Verifik SDK has finished processing your data", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
        })
        alertC.addAction(ok)
        self.present(alertC, animated: true)
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
        print("Hubo un error al escanear la identificación: \(error)")
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
    
    func onAppPhotoIDScanDone(done: Bool, resultID: String?) {}
    func appPhotoIDScanError(error: String) {}
}

struct VerifikViewWrapper: UIViewControllerRepresentable {
    
    var verifikService: VerifikService?
    var token: String?
    
    func makeUIViewController(context: Context) -> VerifikViewController {
        // this will work if you are not using Storyboards at all.
        let verifikVC = VerifikViewController()
        verifikVC.verifikService = verifikService
        verifikVC.token = token
        return verifikVC
    }

    func updateUIViewController(_ uiViewController: VerifikViewController, context: Context) {
        // update code
    }

}
