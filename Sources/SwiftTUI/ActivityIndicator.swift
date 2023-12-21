import Foundation

public enum ActivityIndicator {
    // MARK: Public

    public static func start() {
        task = Task {
            var frames = ["⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"]
            while !Task.isCancelled {
                Cursor.clearToEndOfLine()
                print(frames[0].bold)
                frames.append(frames.removeFirst())
                Cursor.moveUp()
                try? await Task.sleep(nanoseconds: 80_000_000)
            }
        }
    }

    public static func stop() {
        task?.cancel()
    }

    // MARK: Private

    private static var task: Task<Void, Never>?
}
