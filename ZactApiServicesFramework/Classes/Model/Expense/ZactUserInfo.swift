//
//  File.swift
//  
//
//  Created by Sagar Dhake on 31/03/23.
//

import Foundation

public struct ZactUserInfo : Codable, ZactUserProtocol {
    public var uuid : String?
    public var firstName : String?
    public var lastName : String?
    public var email : String?
    public var picture : String?
    public var active: Bool?
    public var roles: [String]?
    public var organization: ZactOrganization?
    public var mobilePhone: String?
    public var businessPhone: String?
    public var setupComplete:Bool?
    public var manager: ZactManager?
    public var address: ZactAddress?
    
    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case firstName = "firstName"
        case lastName = "lastName"
        case email = "email"
        case picture = "picture"
        case active = "active"
        case roles = "roles"
        case organization = "organization"
        case mobilePhone = "mobilePhone"
        case businessPhone = "businessPhone"
        case setupComplete = "setupComplete"
        case manager = "manager"
        case address = "address"
    }
    
    public init(){
        email = ""
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        picture = try values.decodeIfPresent(String.self, forKey: .picture)
        active = try values.decodeIfPresent(Bool.self, forKey: .active)
        roles = try values.decodeIfPresent([String].self, forKey: .roles)
        organization = try values.decodeIfPresent(ZactOrganization.self, forKey: .organization)
        businessPhone = try values.decodeIfPresent(String.self, forKey: .businessPhone)
        setupComplete = try values.decodeIfPresent(Bool.self, forKey: .setupComplete)
        manager = try values.decodeIfPresent(ZactManager.self, forKey: .manager)
        address = try values.decodeIfPresent(ZactAddress.self, forKey: .address)
    }
}
