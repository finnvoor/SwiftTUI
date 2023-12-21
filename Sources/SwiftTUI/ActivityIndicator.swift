import Foundation

public enum ActivityIndicator {
    // MARK: Public

    public static func start() {
        task = Task {
            var frames = ["⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"]
            while !Task.isCancelled {
                print(frames[0].bold)
                Cursor.moveUp()
                try? await Task.sleep(nanoseconds: 80_000_000)
                guard !Task.isCancelled else { return }
                Cursor.clearToEndOfLine()
                frames.append(frames.removeFirst())
            }
        }
    }

    public static func stop() {
        task?.cancel()
        Cursor.clearToEndOfLine()
    }

    // MARK: Private

    private static var task: Task<Void, Never>?
}
