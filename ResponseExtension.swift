//
//  NetworkExtensions.swift
//  Owl Monitoring
//
//  Created by 김동혁 on 2017. 10. 10..
//  Copyright © 2017년 KongTech. All rights reserved.
//

import Foundation
import Moya

extension Response {
    func mapObject<T>(_ type: T.Type) throws -> T where T : Decodable {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(type, from: data)
        } catch (let error) {
            throw error
        }
    }
    
    func mapObject<T>(_ type: T.Type, key: String) throws -> T where T : Decodable {
        let decoder = JSONDecoder()
        do {
            let map = try mapJSON() as! [String : Any]
            if let data = map[key] {
                let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            
                return try decoder.decode(type, from: jsonData)
            } else {
                throw MoyaError.jsonMapping(self)
            }
        } catch (let error) {
            throw error
        }
    }
}
