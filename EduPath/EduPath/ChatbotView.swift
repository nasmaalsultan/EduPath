import SwiftUI

struct ChatbotView: View {
    @State private var userInput = ""
    @State private var chatLog: [String] = ["Hi! I’m AcaBot 🤖. Ask me anything!"]

    func sendMessage() {
        guard let url = URL(string: "http://127.0.0.1:8000/chat") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = ["message": userInput]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data,
               let response = try? JSONDecoder().decode(ChatResponse.self, from: data) {
                DispatchQueue.main.async {
                    chatLog.append("You: \(userInput)")
                    chatLog.append("AcaBot: \(response.reply)")
                    userInput = ""
                }
            }
        }.resume()
    }

    var body: some View {
        VStack {
            ScrollView {
                ForEach(chatLog, id: \.self) { message in
                    Text(message).padding(4)
                }
            }

            HStack {
                TextField("Ask AcaBot...", text: $userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Send") {
                    sendMessage()
                }
            }
            .padding()
        }
        .padding()
    }
}

struct ChatResponse: Decodable {
    let reply: String
}

