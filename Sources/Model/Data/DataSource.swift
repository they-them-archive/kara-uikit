// Copyright 2020 @they-them.

import Foundation

struct DataSource {
    
    // MARK: Constants
    private static let Key = "kara_json_key"
    
    // MARK: Properties
    // Intermediate object for storing moods for the UI.
    var moods: [Mood] {
        return fetch()
    }
    
    // MARK: Add
    mutating func add(mood: Mood) {
        // Get collection from User Defaults.
        var collection = fetch()
        // Insert new mood at index 0.
        collection.insert(mood, at: 0)
        // Persist collection to User Defaults.
        persist(collection: collection)
    }
    
    // MARK: Remove
    mutating func remove(indexPath: IndexPath) {
        // Get collection from User Defaults.
        var collection = fetch()
        // Remove mood via index path row.
        collection.remove(at: indexPath.row)
        // Persist collection to User Defaults.
        persist(collection: collection)
    }
    
    // MARK: Fetch from UserDefaults
    func fetch() -> [Mood] {
        // Fetch JSON string from UserDefaults.
        guard let jsonString = UserDefaults.standard.string(forKey: DataSource.Key) else {
            // Return empty array if something fails.
            return []
        }
        
        // Convert JSON string to array of Mood structs and return results.
        return DataTransform.array(from: jsonString)
    }
    
    // MARK: Persist to UserDefaults
    mutating func persist(collection: [Mood]) {
        // Get JSON string from collection.
        if let newJsonString = DataTransform.jsonString(from: collection) {
            // Push new JSON string to UserDefaults.
            UserDefaults.standard.setValue(newJsonString, forKey: DataSource.Key)
        }
    }
}
