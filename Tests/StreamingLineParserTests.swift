import Foundation
import XCTest

// Add StreamingLineParser.swift to the same test target, or import its module.
final class StreamingLineParserTests: XCTestCase {
    func testSplitsAcrossChunks() {
        var parser = StreamingLineParser()
        XCTAssertEqual(parser.append(Data("data: hel".utf8)), [])
        XCTAssertEqual(parser.append(Data("lo\n\n".utf8)), ["data: hello", ""])
        XCTAssertNil(parser.finish())
    }

    func testCRLFAndFinalLine() {
        var parser = StreamingLineParser()
        XCTAssertEqual(parser.append(Data("event: demo\r\n".utf8)), ["event: demo"])
        XCTAssertEqual(parser.append(Data("data: final".utf8)), [])
        XCTAssertEqual(parser.finish(), "data: final")
    }

    func testSplitUTF8Character() {
        var parser = StreamingLineParser()
        let bytes = Array("data: café\n".utf8)
        XCTAssertEqual(parser.append(Data(bytes.prefix(bytes.count - 2))), [])
        XCTAssertEqual(parser.append(Data(bytes.suffix(2))), ["data: café"])
    }
}
