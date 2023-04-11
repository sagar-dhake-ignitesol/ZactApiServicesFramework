//
//  File.swift
//  
//
//  Created by Sagar Dhake on 31/03/23.
//

import Foundation

public struct ZactReceipt : Codable, Equatable {
    public var imageBase64: String?
    public var imageUrl: String?
    public var mime: String?
    public var pos: Int?
    public var uid: String?
    
    enum CodingKeys: String, CodingKey {
        case imageBase64 = "imageBase64"
        case imageUrl = "imageUrl"
        case mime = "mime"
        case pos = "pos"
        case uid = "uid"
    }
    
    public init(){
        
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        imageBase64 = try values.decodeIfPresent(String.self, forKey: .imageBase64)
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
        mime = try values.decodeIfPresent(String.self, forKey: .mime)
        pos = try values.decodeIfPresent(Int.self, forKey: .pos)
        uid = try values.decodeIfPresent(String.self, forKey: .uid)
    }
    
    static public func == (lhs: ZactReceipt, rhs: ZactReceipt) -> Bool {
        return lhs.imageUrl == rhs.imageUrl
            && lhs.imageBase64 == rhs.imageBase64
            && lhs.uid == rhs.uid
    }
}

extension ZactReceipt {
    
    public func isImage() -> Bool {
        return mime?.contains("image") ?? false
    }
    
    public func isPdf() -> Bool {
        return mime?.contains("pdf") ?? false
    }
}
