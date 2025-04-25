import SwiftUI

struct DashboardView: View {
    @State private var showSettings = false
    @State private var showChatBot = false

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color(red: 253/255, green: 244/255, blue: 238/255)
                    .ignoresSafeArea()

                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("EDUPATH")
                            .font(.system(size: 42, weight: .bold))
                            .foregroundColor(Color(red: 232/255, green: 97/255, blue: 61/255))

                        Spacer()

                        Button(action: {
                            showSettings.toggle()
                        }) {
                            Image(systemName: "gearshape")
                                .font(.title2)
                                .foregroundColor(.orange)
                        }
                        .padding(.trailing, 16)

                        Button(action: {
                        }) {
                            Image(systemName: "house")
                                .font(.title2)
                                .foregroundColor(.orange)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)

                    Text("Hello, Imran")
                        .font(.system(size: 32, weight: .bold))
                        .bold()
                        .foregroundColor(Color(red: 232/255, green: 97/255, blue: 61/255))
                        .padding(.horizontal)

                    Text("Next on Your To-Do List:")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color(red: 254/255, green: 200/255, blue: 63/255))
                        .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 12) {
                        ForEach([
                            "Begin your UK shortlist",
                            "Begin your USA shortlist",
                            "Upload transcripts",
                            "Start brainstorming Common App essay",
                            "Explore 2 new scholarships",
                            "Get started with an ECA"
                        ], id: \.self) { task in
                            HStack(alignment: .top) {
                                Text(">>")
                                    .foregroundColor(Color(red: 232/255, green: 97/255, blue: 61/255))
                                Text(task)
                            }
                        }
                    }
                    .padding(.horizontal)

                    HStack {
                        Image(systemName: "pin.fill")
                            .foregroundColor(.orange)
                        VStack(alignment: .leading) {
                            Text("Today's Tip:")
                                .foregroundColor(.orange)
                                .bold()
                            Text("You can apply to scholarships after getting in too.")
                                .foregroundColor(.black)
                                .font(.subheadline)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 3)
                    .padding(.horizontal)

                    Text("Upcoming Deadlines:")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color(red: 254/255, green: 200/255, blue: 63/255))
                        .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("❗ UCAS: Jan 15th")
                        Text("❗ Canadian Applications: Jan 15th")
                    }
                    .padding(.horizontal)

                    Spacer()

                    Button(action: {
                        showChatBot.toggle()
                    }) {
                        HStack {
                            Image(systemName: "message")
                            Text("Questions? Ask AcaBot Anything!")
                                .bold()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 253/255, green: 181/255, blue: 122/255))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding(.horizontal)
                    }

                    Divider()

                    HStack {
                        Spacer()
                        NavigationLink(destination: Shortlists()) {
                            BottomNavItem(icon: "list.bullet", label: "Shortlists")
                        }
                        Spacer()
                        NavigationLink(destination: Essays()) {
                            BottomNavItem(icon: "doc.text", label: "Essays")
                        }
                        Spacer()
                        NavigationLink(destination: Activities()) {
                            BottomNavItem(icon: "sportscourt", label: "Activities")
                        }
                        Spacer()
                        NavigationLink(destination: Scholarships()) {
                            BottomNavItem(icon: "creditcard", label: "Scholarships")
                        }
                        Spacer()
                        NavigationLink(destination: Tutoring()) {
                            BottomNavItem(icon: "person.crop.circle", label: "Tutoring")
                        }
                        Spacer()
                    }
                    .padding(.bottom, 12)
                }

                if showSettings {
                    SettingsPopup(show: $showSettings)
                }

                if showChatBot {
                    ChatBotPopup(show: $showChatBot)
                }
            }
        }
    }
}

struct BottomNavItem: View {
    var icon: String
    var label: String

    var body: some View {
        VStack {
            Image(systemName: icon)
            Text(label)
                .font(.caption2)
        }
        .foregroundColor(.orange)
    }
}

struct SettingsPopup: View {
    @Binding var show: Bool

    var body: some View {
        VStack(spacing: 20) {
            Text("Settings")
                .font(.title2)
                .bold()
            Divider()
            Button("Account Settings") {}
            Button("Notification Settings") {}
            Button("Help") {}
            Button("About Us") {}
            Button("Close") { show = false }
                .foregroundColor(.red)
        }
        .padding()
        .frame(width: 300)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.orange.opacity(0.2), lineWidth: 1)
        )
        .transition(.scale)
        .zIndex(1)
    }
}

struct ChatBotPopup: View {
    @Binding var show: Bool
    @State private var userInput = ""
    @State private var chatLog: [String] = ["Hi! I'm AcaBot 🤖. Ask me anything!"]

    struct ChatResponse: Decodable {
        let reply: String
    }

    func sendMessage() {
        guard !userInput.trimmingCharacters(in: .whitespaces).isEmpty,
              let url = URL(string: "http: 127.0.0.1:8000/chat") else { return }

        let message = userInput
        chatLog.append("You: \(message)")
        userInput = ""

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = ["message": message]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data,
               let response = try? JSONDecoder().decode(ChatResponse.self, from: data) {
                DispatchQueue.main.async {
                    chatLog.append("AcaBot: \(response.reply)")
                }
            }
        }.resume()
    }

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("AcaBot")
                    .font(.headline)
                Spacer()
                Button("X") { show = false }
                    .foregroundColor(.red)
            }
            .padding(.horizontal)

            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(chatLog, id: \.self) { message in
                        Text(message)
                            .padding(6)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                    }
                }
                .padding()
            }

            HStack {
                TextField("Type your question...", text: $userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Send") {
                    sendMessage()
                }
            }
            .padding(.horizontal)
            .padding(.bottom)

        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .frame(width: 320)
        .padding()
        .transition(.scale)
        .zIndex(1)
    }
}

#Preview {
    DashboardView()
}
