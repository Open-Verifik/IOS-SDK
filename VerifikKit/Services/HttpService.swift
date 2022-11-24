//
//  HttpService.swift
//  VerifikKit
//
//  Created by Carlos Bleck on 02/11/22.
//

import Foundation
@_implementationOnly import FaceTecSDK

class HttpService{
    func getCredentials(vc: VerifikProtocol, token: String,
                        credentialsCallback: @escaping (String, String, String) -> ()) {
        
        var parameters: [String : String] = [:]
        parameters["type"] = "mobile"
        let endpoint = VerifikURL.Base + VerifikURL.Credentials + HttpUtils.buildQueryString(fromDictionary: parameters)
        let request = NSMutableURLRequest(url: NSURL(string: endpoint)! as URL)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: vc, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            // Ensure the data object is not nil otherwise callback with empty dictionary.
            guard error == nil else {
                vc.configError(error: "There was an error configuring Verifik SDK")
                return
            }
            guard let data = data else {
                print("Verifik error: Couldn't get Verifik credentials")
                vc.configError(error: "Couldn't get Verifik credentials, contact Verifik support team")
                return
            }
            if let responseJSONObj = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject]{
                
                if let responseJSONData = try? JSONSerialization.jsonObject(with: Data((responseJSONObj["data"] as? String)?.utf8 ?? "".utf8), options: JSONSerialization.ReadingOptions.allowFragments) as? [AnyObject]{
                    
                    guard responseJSONData.count > 2 else{ return }
                    let prodKeyText = HttpUtils.parseProdKeyText(responseJSONData[0].description ?? "")
                    let deviceKeyIdentifier = responseJSONData[1] as? String
                    let publicFaceScanEncryptionKey = responseJSONData[2] as? String
                    
                    let bundle = Bundle(for: type(of: vc))
                    let bundleId = bundle.bundleIdentifier ?? "---"
                    
                    if !prodKeyText.contains(bundleId){
                        print("Verifik error: Bundle ID isn't registered, please contact Verifik Support Team")
                        vc.configError(error: "Bundle ID isn't registered, please contact Verifik Support Team")
                        return
                    }
                    
                    /*
                     let prodKeyText = """
                     # FaceTec Mobile SDK license
                     appId      = co.verifik.VerifikKit
                     expiryDate = 2023-02-10
                     key        = 00304502201a33be21ddb1b037f1bf83a9c2de56a8d29f244260cae71c9f5176e8875cc6ea022100a1287422056c7d5e611f58e7be07e5ee4db32e01341514e70e731c7948ec3671
                     """
                     let deviceKeyIdentifier = "dSIbWmqD0mIiN3UU6wC1WrHO20v1dCKk"
                     let publicFaceScanEncryptionKey =
                     "-----BEGIN PUBLIC KEY-----\n" +
                     "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5PxZ3DLj+zP6T6HFgzzk\n" +
                     "M77LdzP3fojBoLasw7EfzvLMnJNUlyRb5m8e5QyyJxI+wRjsALHvFgLzGwxM8ehz\n" +
                     "DqqBZed+f4w33GgQXFZOS4AOvyPbALgCYoLehigLAbbCNTkeY5RDcmmSI/sbp+s6\n" +
                     "mAiAKKvCdIqe17bltZ/rfEoL3gPKEfLXeN549LTj3XBp0hvG4loQ6eC1E1tRzSkf\n" +
                     "GJD4GIVvR+j12gXAaftj3ahfYxioBH7F7HQxzmWkwDyn3bqU54eaiB7f0ftsPpWM\n" +
                     "ceUaqkL2DZUvgN0efEJjnWy5y1/Gkq5GGWCROI9XG/SwXJ30BbVUehTbVcD70+ZF\n" +
                     "8QIDAQAB\n" +
                     "-----END PUBLIC KEY-----"
                     */
                    if deviceKeyIdentifier != nil, publicFaceScanEncryptionKey != nil {
                        credentialsCallback(deviceKeyIdentifier!, publicFaceScanEncryptionKey!, prodKeyText)
                        return
                    }
                    else {
                        print("Verifik error: Credentials with wrong format, please contact Verifik Support Team")
                        vc.configError(error: "Credentials with wrong format, please contact Verifik Support Team")
                    }
                }
                if let responseJSONCode = responseJSONObj["code"] as? String,
                    responseJSONCode == "InvalidCredentials"{
                    vc.configError(error: "There was an error configuring Verifik SDK, please check your keys")
                }
            }
            
        })
        task.resume()
    }
    
    func getSessionToken(vc: VerifikProtocol, token: String,
                         sessionTokenCallback: @escaping (String) -> ()) {
        
        let endpoint = VerifikURL.Base + VerifikURL.Session
        let request = NSMutableURLRequest(url: NSURL(string: endpoint)! as URL)
        request.httpMethod = "GET"
        // Required parameters to interact with the FaceTec Managed Testing API.
        request.addValue(FaceTec.sdk.createFaceTecAPIUserAgentString(""), forHTTPHeaderField: "X-User-Agent")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: vc, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            // Ensure the data object is not nil otherwise callback with empty dictionary.
            guard let data = data else {
                print("Verifik Error: Exception raised while getting session data.")
                vc.sessionError(error: "Exception raised while getting session data, please contact Verifik Support Team")
                return
            }
            if let responseJSONObj = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] {
                if let sessionToken = responseJSONObj["data"] as? String{
                    sessionTokenCallback(sessionToken)
                    return
                }
                else {
                    print("Verifik Error: Exception raised while setting session data.")
                    vc.sessionError(error: "Exception raised while setting session data, please contact Verifik Support Team")
                }
            }
        })
        task.resume()
    }
}
