//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Jamila Ruzimetova on 3/11/24.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
//        finding the file to load
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
//        try to load out the file
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
//        Assinging enum case .formatted with a parameter "formatter" to the property "dateDecodingSt" of the object "decoder"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from a bundle")
        }
        return loaded
    }
}
