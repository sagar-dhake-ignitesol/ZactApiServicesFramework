//
//  File.swift
//  
//
//  Created by Sagar Dhake on 31/03/23.
//

import Foundation

public struct ZactAllocation : Codable, Equatable {
    public var distributions : [ZactDistribution]?
    
    enum CodingKeys: String, CodingKey {
        case distributions = "distributions"
    }
    
    public init() {
        
    }
    
    public init(distributions: [ZactDistribution]){
        self.distributions = distributions
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        distributions = try values.decodeIfPresent([ZactDistribution].self, forKey: .distributions)
    }
    
    static public func == (lhs: ZactAllocation, rhs: ZactAllocation) -> Bool {
        return lhs.distributions == rhs.distributions
    }
}
