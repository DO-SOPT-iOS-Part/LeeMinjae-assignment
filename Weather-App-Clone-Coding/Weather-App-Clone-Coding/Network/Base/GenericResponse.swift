//
//  GenericResponse.swift
//  Weather-App-Clone-Coding
//
//  Created by 민 on 12/19/23.
//

import Foundation

struct GenericResponse<T: Codable>: Codable {
    
    var code: Int
    var message: String
    var data: T?
    
    enum CodingKeys: CodingKey {
        case code
        case message
        case data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = (try? values.decode(Int.self, forKey: .code)) ?? -1
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
    }
}
