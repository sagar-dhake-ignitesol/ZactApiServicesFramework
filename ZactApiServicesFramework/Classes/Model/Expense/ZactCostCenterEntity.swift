//
//  File.swift
//  
//
//  Created by Sagar Dhake on 30/03/23.
//

import Foundation

public struct ZactCostCenterEntity: Equatable {
    public var uuid : String?
    public var label : String?
    public var enabled : Bool?
    public var desc : String?
    
    public init(){
        
    }
    
    public init(_ uuid: String?) {
        self.uuid = uuid
    }
    
    public init(_ label: String) {
        self.label = label
    }
    
    public init(uuid: String, label: String, enabled: Bool = true, desc: String? = nil){
        self.uuid = uuid
        self.label = label
        self.enabled = enabled
        self.desc = desc
    }
}

extension ZactCostCenterEntity: Codable {
    
    enum CodingKeys: String, CodingKey {
        
        case uuid = "uuid"
        case label = "label"
        case enabled = "enabled"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
        label = try values.decodeIfPresent(String.self, forKey: .label)
        enabled = try values.decodeIfPresent(Bool.self, forKey: .enabled)
    }
}
