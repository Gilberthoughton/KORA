# KORA — Public Engineering Samples

A small, standalone portfolio of engineering techniques relevant to native applications, streaming interfaces, and performance testing.

**This is not KORA's production source code.** The examples are independently written, use synthetic data, and contain no production endpoints, credentials, internal system topology, model prompts, or proprietary decision logic.

## Samples
- `Sources/StreamingLineParser.swift` — dependency-free incremental UTF-8/SSE line parsing.
- `Sources/MockConversationView.swift` — SwiftUI conversation UI backed by local example messages.
- `Tests/StreamingLineParserTests.swift` — focused parser behavior tests.

## Review and run
The parser and tests can be added to a fresh Swift package (Swift 6 / Foundation and XCTest). The UI sample requires SwiftUI on an Apple platform. These examples have not been executed in this repository's CI; no performance or production-equivalence claims are made.

## Security boundary
Never add actual KORA source files, secrets, configuration, service URLs, user records, proprietary algorithms, internal documentation, or copied production Git history. All future changes must be reviewed independently before merging.

Created as a clean public portfolio, separate from the private KORAPRIME project.
