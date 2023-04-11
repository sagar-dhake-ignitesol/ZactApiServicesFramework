//
//  File.swift
//  
//
//  Created by Sagar Dhake on 31/03/23.
//

import Foundation

public struct ZactApprovalItem {
    public var role: String?
    public var action: String?
    public var reason: String?
    public var date: Double?
    public var user: ZactUserInfo?
    public var impersonator: ZactUserInfo?
    public var authority: String?
    public var type: String?
    public var status: String?
    public var overrides: String?
    
    init() {
        user = ZactUserInfo()
    }
}

extension ZactApprovalItem: Codable {
    
    enum CodingKeys: String, CodingKey {
        case user = "user"
        case role = "role"
        case date = "date"
        case reason = "reason"
        case action = "action"
        case authority = "authority"
        case type = "type"
        case status = "status"
        case overrides = "overrides"
        case impersonator = "impersonator"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user = try values.decodeIfPresent(ZactUserInfo.self, forKey: .user)
        role = try values.decodeIfPresent(String.self, forKey: .role)
        date = try values.decodeIfPresent(Double.self, forKey: .date)
        action = try values.decodeIfPresent(String.self, forKey: .action)
        reason = try values.decodeIfPresent(String.self, forKey: .reason)
        authority = try values.decodeIfPresent(String.self, forKey: .authority)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        overrides = try values.decodeIfPresent(String.self, forKey: .overrides)
        impersonator = try values.decodeIfPresent(ZactUserInfo.self, forKey: .impersonator)
    }
}
