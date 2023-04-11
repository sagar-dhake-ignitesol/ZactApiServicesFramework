//
//  FrameworkManager.swift
//  ZactApiServices
//
//  Created by Sagar Dhake on 10/04/23.
//

import Foundation

class FrameworkManager {
    static private var accessToken = "xP1z4yfs!Jq3PDELKU4MOTqvJ/YGc3vUeSRb7qFo195wCBKBExNpo3jTDn0ClOOP"
    
    static func checkIsAuthorized(accessToken: String) -> Bool {
        return accessToken == self.accessToken
    }
}
