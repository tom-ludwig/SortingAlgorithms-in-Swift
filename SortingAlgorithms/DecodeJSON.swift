//
//  DecodeJSON.swift
//  SortingAlgorithms
//
//  Created by Tommy Ludwig on 01.06.23.
//

import Foundation

class DecodeJSON {
    func decodeJSON<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("Couldn't find \(filename)")
        }
        
        do {
            data = try Data(contentsOf: fileURL)
        } catch {
            fatalError("Unresolved error while creating data: \(error.localizedDescription)")
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            fatalError("Unresolved error while decoding data \(error.localizedDescription)")
        }
    }
}
