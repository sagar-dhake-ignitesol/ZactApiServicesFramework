//
//  FrameworkManager.swift
//  ZactApiServices
//
//  Created by Sagar Dhake on 10/04/23.
//

import Foundation

class FrameworkManager {
    
    /// Access token required to verify authorised user
    static private var accessToken = "xP1z4yfs!Jq3PDELKU4MOTqvJ/YGc3vUeSRb7qFo195wCBKBExNpo3jTDn0ClOOP"
    
    /**
          It is used to checked whether passed access token is correct.
     
        - parameter accessToken: If wrong access token, framework will not be accessible.
     
        - Returns: Boolean is passed token is correct.
    */
    static func checkIsAuthorized(accessToken: String) -> Bool {
        return accessToken == self.accessToken
    }
}
