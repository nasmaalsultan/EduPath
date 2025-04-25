import SwiftUI

struct Tutoring: View {
    @State private var showSettings = false
    @State private var showChatBot = false
    @State private var subject = ""
    @State private var topic = ""
    @State private var response: String? = nil

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color(red: 253/255, green: 244/255, blue: 238/255)
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 16) {
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

                        Text("Smart Tutoring with AcaBot")
                            .font(.headline)
                            .foregroundColor(Color(red: 254/255, green: 200/255, blue: 63/255))
                            .padding(.horizontal)
                    }

                    ScrollView {
                        VStack(spacing: 16) {
                            VStack(spacing: 12) {
                                HStack {
                                    Image(systemName: "book.closed.fill")
                                        .foregroundColor(.orange)
                                    Text("What do you need help with?")
                                        .font(.headline)
                                }
                                .padding(.bottom, 4)

                                TextField("Subject (e.g., Physics)", text: $subject)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(12)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.orange, lineWidth: 1)
                                    )

                                TextField("Topic (e.g., Newton's Third Law)", text: $topic)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(12)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.orange, lineWidth: 1)
                                    )

                                Button(action: {
                  
                                    response = "Newton's Third Law: For every action, there's an equal and opposite reaction."
                                }) {
                                    HStack {
                                        Image(systemName: "paperplane.fill")
                                        Text("Ask AcaBot")
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                }

                                if let response = response {
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("AcaBot says:")
                                            .font(.headline)
                                            .foregroundColor(.orange)

                                        Text(response)
                                            .padding()
                                            .background(Color(red: 255/255, green: 233/255, blue: 211/255))
                                            .cornerRadius(12)
                                    }
                                    .padding(.top)
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                            .padding(.horizontal)
                        }
                        .padding(.vertical)
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
            .navigationBarHidden(true)
        }
    }
}
#Preview {
    Tutoring()
}

