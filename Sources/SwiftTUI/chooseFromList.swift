import Foundation

public func chooseFromList<T: CustomStringConvertible>(_ list: [T], prompt: String) -> T {
    assert(!list.isEmpty)

    if list.count == 1 {
        print([
            "?".brightGreen.bold,
            prompt.bold,
            list[0].description.brightCyan
        ].joined(separator: " "))
        return list[0]
    }

    Termios.enterRawMode()
    Cursor.hide()
    defer {
        Cursor.show()
        Termios.pop()
    }

    print([
        "?".brightGreen.bold,
        prompt.bold,
        "[Use arrows to move]".brightCyan
    ].joined(separator: " "))

    var selectedIndex = 0
    while true {
        for (index, option) in list.enumerated() {
            if index == selectedIndex {
                print("> \(option)".brightCyan.bold)
            } else {
                print("  \(option)")
            }
        }
        let key = Key.read()
        switch key {
        case Key.up:
            selectedIndex = max(selectedIndex - 1, 0)
        case Key.down:
            selectedIndex = min(selectedIndex + 1, list.count - 1)
        case "\n":
            Cursor.moveUp(by: list.count + 1)
            Cursor.clearBelow()
            print([
                "?".brightGreen.bold,
                prompt.bold,
                list[selectedIndex].description.brightCyan
            ].joined(separator: " "))
            return list[selectedIndex]
        default: break
        }
        Cursor.moveUp(by: list.count)
    }
}
