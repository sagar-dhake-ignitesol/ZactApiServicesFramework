//
//  File.swift
//  
//
//  Created by Sagar Dhake on 31/03/23.
//

import Foundation

public struct ZactMerchantRating : Codable, Equatable {
    public var rating : Float?
    public var feedback : String?
    
    enum CodingKeys: String, CodingKey {
        
        case rating = "rating"
        case feedback = "feedback"
    }
    
    public init(rating: Float, feedback: String){
        self.rating = rating
        self.feedback = feedback
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rating = try values.decodeIfPresent(Float.self, forKey: .rating)
        feedback = try values.decodeIfPresent(String.self, forKey: .feedback)
    }
}
