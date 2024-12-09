import Foundation

class App {
    private let inputView = InputView()
    private let todosManager: TodosManager

    enum CacheProviderOption {
        case fileSystem
        case inMemory
    }

    enum Command {
        case add
        case list
        case toggle
        case delete
        case exit
        case invalid
    }
    
    enum CommandResult {
        case success
        case failure
        case exit
    }

    init(cacheProviderOption: CacheProviderOption = .fileSystem) {
       self.todosManager = TodosManager(cacheProvider: cacheProviderOption == .fileSystem ? FileSystemCache() : InMemoryCache())
    }

    func run() {
        print("Welcome to the Todo CLI!")

        while true {
            let userCommand = getUserCommand()
            let result = handleCommand(userCommand)
            
            if result == .failure {
                print("Invalid command. Please try again.")
            } else if result == .exit {
                print("Goodbye!")
                break
            }
        }
    }
    
    private func getUserCommand() -> Command {
        print("What would you like to do? (add, list, toggle, delete, exit): ")
        
        let input = readLine()
        switch input {
        case "add":
            return .add
        case "list":
            return .list
        case "toggle":
            return .toggle
        case "delete":
            return .delete
        case "exit":
            return .exit
        default:
            return .invalid
        }
    }

    private func handleCommand(_ command: Command) -> CommandResult {
        switch command {
        case .add:
            let title = inputView.getTodoTitle()
            todosManager.add(title)
            return .success
        case .list:
            todosManager.listTodos()
            return .success
        case .toggle:
            let index = inputView.getIndex()
            todosManager.toggleCompletion(at: index)
            return .success
        case .delete:
            let index = inputView.getIndex()
            todosManager.delete(at: index)
            return .success
        case .exit:
            return .exit
        default:
            return .failure
        }
    }
}

