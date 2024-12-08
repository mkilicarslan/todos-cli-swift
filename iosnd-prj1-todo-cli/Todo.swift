import Foundation


struct Todo {
    var id: UUID
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool = false) {
        self.id = UUID()
        self.title = title
        self.isCompleted = isCompleted
    }
}

extension Todo: CustomStringConvertible {
    var description: String {
        let icon = isCompleted ? "✅" : "❌"
        return "\(icon) \(title)"
    }
}

extension Todo: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case isCompleted
    }
    
     init(from decoder: Decoder) throws {
         let container = try decoder.container(keyedBy: CodingKeys.self)
         id = try container.decode(UUID.self, forKey: .id)
         title = try container.decode(String.self, forKey: .title)
         isCompleted = try container.decode(Bool.self, forKey: .isCompleted)
     }
    
     func encode(to encoder: Encoder) throws {
         var container = encoder.container(keyedBy: CodingKeys.self)
         try container.encode(id, forKey: .id)
         try container.encode(title, forKey: .title)
         try container.encode(isCompleted, forKey: .isCompleted)
     }
}
