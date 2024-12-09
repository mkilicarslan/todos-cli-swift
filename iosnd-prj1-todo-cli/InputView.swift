class InputView {
    private let todosManager: TodosManager

    init(todosManager: TodosManager) {
        self.todosManager = todosManager
    }
    
    func getTodoTitle() -> String {
        print("Enter the title of the todo: ")
        var title = ""
        while title.isEmpty {
            if let input = readLine() {
                title = input
            }
        }
        return title
    }

    func getIndex() -> Int {
        print("Enter the index of the todo: ")
        var index = -1
        while index == -1 {
            guard let input = readLine() else { continue }
            guard let intInput = Int(input) else {
                print("Invalid input. Please enter a number.")
                continue
            }

            if todosManager.isValidIndex(intInput - 1) {
                index = intInput - 1
            } else {
                print("Invalid index. Please try again.")
            }
        }
        return index
    }
}
