
import Foundation


class TodosManager {
    private var todos: [Todo] = []
    private let cacheProvider: Cache
    
    init(cacheProvider: Cache) {
        self.cacheProvider = cacheProvider

        if let todos = cacheProvider.load() {
            self.todos = todos
        }
    }

    func add(_ title: String) {
        let todo = Todo(title: title)
        todos.append(todo)
        saveTodos()
        print("📌 Todo added!")
    }
    
    func listTodos() {
        print("📝 Todos:")

        if todos.isEmpty {
            return print("No todos yet!")
        }

        for (index, todo) in todos.enumerated() {
            print("\(index + 1). \(todo.description)")
        }
    }
    
    func toggleCompletion(at index: Int) {
        todos[index].isCompleted.toggle()
        saveTodos()
        print("🔄 Todo completion status toggled!")
    }
    
    func delete(at index: Int) {
        todos.remove(at: index)
        saveTodos()
        print("🗑 Todo deleted!")
    }

    private func saveTodos() {
        if cacheProvider.save(todos: todos) == false {
            print("Failed to save todos.")
        }
    }

    func isValidIndex(_ index: Int) -> Bool {
        return index >= 0 && index < todos.count
    }
}

