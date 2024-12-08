class TodosManager {
    private var todos: [Todo] = []

    func add(_ title: String) {
        let todo = Todo(title: title)
        todos.append(todo)
        print("📌 Todo added!")
    }
    
    func listTodos() {
        print("📝 Todos:")
        for (index, todo) in todos.enumerated() {
            print("\(index + 1). \(todo.description)")
        }
    }
    
    func toggleCompletion(at index: Int) {
        todos[index].isCompleted.toggle()
        print("🔄 Todo completion status toggled!")
    }
    
    func delete(at index: Int) {
        todos.remove(at: index)
        print("🗑 Todo deleted!")
    }
}
