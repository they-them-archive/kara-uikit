// Copyright 2020 @they-them.

import Foundation

enum MoodType: String, Codable {
    case great
    case good
    case alright
    case bad
    case horrible
}

struct Mood: Encodable, Decodable, Identifiable {
    
    // MARK: Properties
    // Unique identifier for each mood entry.
    let id: UUID
    // Mood type such as great, good, alright, etc for each entry.
    let type: MoodType
    // Date of when the entry was created.
    let createdAt: Date
    
    // Enum for encoding and decoding Mood instances.
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        // Created at is changed to snake case in the JSON.
        case createdAt = "created_at"
    }
    
    // MARK: Encodable
    func encode(to encoder: Encoder) throws {
        // Create container using CodingKeys enum.
        var container = encoder.container(keyedBy: CodingKeys.self)
        // Encode id for key id.
        try container.encode(id, forKey: .id)
        // Encode type for key type.
        try container.encode(type, forKey: .type)
        // Encode createdAt for key created_at.
        try container.encode(createdAt, forKey: .createdAt)
    }
    
    // MARK: Decodable Initializer
    init(from decoder: Decoder) throws {
        // Create container using CodingKeys enum.
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // Decode id as UUID type.
        id = try container.decode(UUID.self, forKey: .id)
        // Decode type as MoodType type.
        type = try container.decode(MoodType.self, forKey: .type)
        // Decode createdAt as Date type.
        createdAt = try container.decode(Date.self, forKey: .createdAt)
    }
    
    // MARK: Convenience Initializer
    init(id: String, type: MoodType, createdAt: Date) {
        // Assign id to UUID initialization or create new UUID.
        self.id = UUID(uuidString: id) ?? UUID()
        // Assign type to self.type.
        self.type = type
        // Assign createdAt to self.createdAt.
        self.createdAt = createdAt
    }
    
    init(type: MoodType, createdAt: Date) {
        // Create new UUID and assign to self.id.
        self.id = UUID()
        // Assign type to self.type.
        self.type = type
        // Assign createdAt to self.createdAt.
        self.createdAt = createdAt
    }
}
