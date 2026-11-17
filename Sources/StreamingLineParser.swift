import Foundation

/// Standalone SSE line parser for demonstrations and unit testing.
/// This sample deliberately does not connect to a network service.
public struct StreamingLineParser {
    private var pending = Data()

    public init() {}

    /// Accepts arbitrary UTF-8 byte chunks and emits complete newline-delimited lines.
    /// The final partial line is retained until another chunk arrives or finish() is called.
    public mutating func append(_ bytes: Data) -> [String] {
        pending.append(bytes)
        var lines: [String] = []
        while let newline = pending.firstIndex(of: 0x0A) {
            let raw = pending.prefix(upTo: newline)
            var line = Data(raw)
            if line.last == 0x0D { line.removeLast() }
            lines.append(String(decoding: line, as: UTF8.self))
            pending.removeSubrange(...newline)
        }
        return lines
    }

    public mutating func finish() -> String? {
        guard !pending.isEmpty else { return nil }
        defer { pending.removeAll() }
        var line = pending
        if line.last == 0x0D { line.removeLast() }
        return String(decoding: line, as: UTF8.self)
    }
}
