//
//  HttpHelper.swift
//  VerifikKit
//
//  Created by Carlos Bleck on 04/11/22.
//

import Foundation

class HttpUtils{
    
    static func buildQueryString(fromDictionary parameters: [String:String]) -> String {
        var urlVars:[String] = []
        
        for (k, value) in parameters {
            let value = value as NSString
            if let encodedValue = value.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
                urlVars.append(k + "=" + encodedValue)
            }
        }

        return urlVars.isEmpty ? "" : "?" + urlVars.joined(separator: "&")
    }
    
    static func parseProdKeyText(_ prodKeyText: String) -> String{
        var newProdKeyText = prodKeyText
        newProdKeyText = newProdKeyText.replacingOccurrences(of: "{", with: "", options: .literal, range: nil)
        newProdKeyText = newProdKeyText.replacingOccurrences(of: "}", with: "", options: .literal, range: nil)
        newProdKeyText = newProdKeyText.replacingOccurrences(of: ";", with: "", options: .literal, range: nil)
        newProdKeyText = newProdKeyText.replacingOccurrences(of: "\"", with: "", options: .literal, range: nil)
        newProdKeyText = newProdKeyText.replacingOccurrences(of: ":", with: "=", options: .literal, range: nil)
        newProdKeyText = newProdKeyText.replacingOccurrences(of: "_", with: ",", options: .literal, range: nil)
        return newProdKeyText
    }
}
