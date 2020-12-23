// Copyright 2020 @they-them.

import Foundation

struct DataTransform {
    static func jsonString(from array: [Mood]) -> String? {
        guard let data = try? JSONEncoder().encode(array) else {
            return nil
        }
        
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    static func array(from jsonString: String) -> [Mood] {
        guard let data = jsonString.data(using: .utf8),
              let array = try? JSONDecoder().decode([Mood].self, from: data) else {
            return []
        }
        
        return array
    }
}
