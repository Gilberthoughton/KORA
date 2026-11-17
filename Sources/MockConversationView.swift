import SwiftUI

/// A synthetic UI example. No network, model, persistence, or product logic.
struct MockConversationView: View {
    private let messages: [(speaker: String, text: String)] = [
        ("Visitor", "Can you summarize the design?"),
        ("Assistant", "This is a local interface demonstration."),
        ("Visitor", "Does it connect to a service?"),
        ("Assistant", "No. All messages are synthetic.")
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(messages.indices, id: \.self) { index in
                        let message = messages[index]
                        VStack(alignment: .leading, spacing: 4) {
                            Text(message.speaker)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Text(message.text)
                                .padding(12)
                                .background(.quaternary, in: RoundedRectangle(cornerRadius: 12))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .accessibilityElement(children: .combine)
                    }
                }
                .padding()
            }
            .navigationTitle("Conversation Demo")
        }
    }
}
