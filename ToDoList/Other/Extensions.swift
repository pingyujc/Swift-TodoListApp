//
//  Extensions.swift
//  ToDoList
//
//  Created by Jonathan Chen on 5/15/24.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any]? {
        do {
            let data = try JSONEncoder().encode(self)
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
            return dictionary
        } catch {
            print("Error converting \(self) to dictionary: \(error)")
            return nil
        }
    }
}
