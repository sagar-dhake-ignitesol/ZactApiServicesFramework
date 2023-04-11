//
//  File.swift
//  
//
//  Created by Sagar Dhake on 31/03/23.
//

import Foundation

public struct ZactOrganization : Codable {
    public let uuid : String?
    public let key : String?
    public let displayName : String?
    public let description : String?
    public let address : ZactAddress?
    public let timeZone : String?
    public let phone : String?
    public let domainNames : [String]?
    public let secondaryAdmins : [String]?
    public let accUsers : [String]?
    public let approvalRoles : [String]?
    public let division: ZactDivision?
    
    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case key = "key"
        case displayName = "displayName"
        case description = "description"
        case address = "address"
        case timeZone = "timeZone"
        case phone = "phone"
        case domainNames = "domainNames"
        case secondaryAdmins = "secondaryAdmins"
        case accUsers = "accUsers"
        case approvalRoles = "approvalRoles"
        case division = "division"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        displayName = try values.decodeIfPresent(String.self, forKey: .displayName)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        address = try values.decodeIfPresent(ZactAddress.self, forKey: .address)
        timeZone = try values.decodeIfPresent(String.self, forKey: .timeZone)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        domainNames = try values.decodeIfPresent([String].self, forKey: .domainNames)
        secondaryAdmins = try values.decodeIfPresent([String].self, forKey: .secondaryAdmins)
        accUsers = try values.decodeIfPresent([String].self, forKey: .accUsers)
        approvalRoles = try values.decodeIfPresent([String].self, forKey: .approvalRoles)
        division = try values.decodeIfPresent(ZactDivision.self, forKey: .division)
    }
}

public struct ZactDivision : Codable {
    var uuid : String?
    var displayName : String?
    var timeZone : String?
    var address: ZactAddress?
    
    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case displayName = "displayName"
        case timeZone = "timeZone"
        case address = "address"
    }
 
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
        displayName = try values.decodeIfPresent(String.self, forKey: .displayName)
        timeZone = try values.decodeIfPresent(String.self, forKey: .timeZone)
        address = try values.decodeIfPresent(ZactAddress.self, forKey: .address)
    }
}
