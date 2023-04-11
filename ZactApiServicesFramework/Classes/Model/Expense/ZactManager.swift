//
//  File.swift
//  
//
//  Created by Sagar Dhake on 31/03/23.
//

import Foundation

public struct ZactManager : Codable, ZactUserProtocol {
    public var picture: String?
    public let uuid : String?
    public let firstName : String?
    public let lastName : String?
    public let middleInitial : String?
    public let prefix : String?
    public let suffix : String?
    public let email : String?
    public let mobilePhone : String?
    public let active : Bool?
    public let setupComplete : Bool?
    public let roles : [String]?
    
    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case firstName = "firstName"
        case lastName = "lastName"
        case middleInitial = "middleInitial"
        case prefix = "prefix"
        case suffix = "suffix"
        case email = "email"
        case mobilePhone = "mobilePhone"
        case active = "active"
        case setupComplete = "setupComplete"
        case roles = "roles"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        middleInitial = try values.decodeIfPresent(String.self, forKey: .middleInitial)
        prefix = try values.decodeIfPresent(String.self, forKey: .prefix)
        suffix = try values.decodeIfPresent(String.self, forKey: .suffix)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        mobilePhone = try values.decodeIfPresent(String.self, forKey: .mobilePhone)
        active = try values.decodeIfPresent(Bool.self, forKey: .active)
        setupComplete = try values.decodeIfPresent(Bool.self, forKey: .setupComplete)
        roles = try values.decodeIfPresent([String].self, forKey: .roles)
    }
}
