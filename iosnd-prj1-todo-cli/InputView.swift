class InputView {
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
        print("Enter the number of the todo: ")
        var index = -1
        while index < 0 {
            if let input = readLine(), let inputInt = Int(input) {
                index = inputInt
            }
        }
        return index - 1
    }
}
