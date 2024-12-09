import Foundation

protocol Cache {
    func save(todos: [Todo]) -> Bool
    func load() -> [Todo]?
}

class FileSystemCache: Cache {
    private static let cachePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("todos.json").path
    
    func save(todos: [Todo]) -> Bool {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(todos)
            return FileManager.default.createFile(atPath: FileSystemCache.cachePath, contents: data, attributes: nil)
        } catch {
            print("Error saving todos: \(error)")
            return false
        }
    }

    func load() -> [Todo]? {
        if let data = FileManager.default.contents(atPath: FileSystemCache.cachePath) {
            let decoder = JSONDecoder()
            do {
                let todos = try decoder.decode([Todo].self, from: data)
                return todos
            } catch {
                print("Error loading todos: \(error)")
                return nil
            }
        }
        return nil
    }
}

class InMemoryCache: Cache {
    private var todos: [Todo] = []

    func save(todos: [Todo]) -> Bool {
        self.todos = todos
        return true
    }

    func load() -> [Todo]? {
        return todos
    }
}
