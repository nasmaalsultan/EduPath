import SwiftUI

struct Brainstorming: View {
    @State private var showSettings = false
    @State private var userInput: String = ""
    @State private var messages: [ChatMessage] = [
        ChatMessage(text: "Hi! Ready to brainstorm your college essay?", isUser: false),
        ChatMessage(text: "What topic are you thinking about?", isUser: false),
        ChatMessage(
            text: """
- Major life events?

- Struggles you overcame?

- Achievements you're proud of?

- Turning points or moments of growth?
""",
            isUser: false
        )
    ]

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color(red: 253/255, green: 244/255, blue: 238/255)
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    HStack {
                        Text("EDUPATH")
                            .font(.system(size: 32, weight: .bold))
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

                        NavigationLink(destination: DashboardView()) {
                            Image(systemName: "house")
                                .font(.title2)
                                .foregroundColor(.orange)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)

                    HStack {
                        Text("Brainstorm Your Essay")
                            .font(.headline)
                            .foregroundColor(Color(red: 254/255, green: 200/255, blue: 63/255))
                        Spacer()
                    }
                    .padding(.horizontal)

                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(messages) { message in
                                HStack {
                                    if message.isUser {
                                        Spacer()
                                        Text(message.text)
                                            .padding()
                                            .background(Color.orange.opacity(0.8))
                                            .foregroundColor(.white)
                                            .cornerRadius(16)
                                            .frame(maxWidth: 240, alignment: .trailing)
                                    } else {
                                        Text(message.text)
                                            .padding()
                                            .background(Color.white)
                                            .cornerRadius(16)
                                            .frame(maxWidth: 240, alignment: .leading)
                                        Spacer()
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding(.vertical)
                    }

                    HStack {
                        TextField("Type your idea here...", text: $userInput)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(red: 254/255, green: 200/255, blue: 63/255), lineWidth: 2)
                            )

                        Button(action: {
                            if !userInput.isEmpty {
                                messages.append(ChatMessage(text: userInput, isUser: true))
                                userInput = ""
                                messages.append(ChatMessage(text: "Interesting! Want to expand on that?", isUser: false))
                            }
                        }) {
                            Image(systemName: "paperplane.fill")
                                .foregroundColor(.orange)
                                .padding(.leading, 8)
                        }
                    }
                    .padding(.horizontal)

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
            }
        }
    }
}

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

#Preview {
    Brainstorming()
}

