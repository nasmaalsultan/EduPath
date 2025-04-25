import SwiftUI

struct Activities: View {
    @State private var showSettings = false
    @State private var showChatBot = false
    @State private var acaBotInput: String = ""

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color(red: 253/255, green: 244/255, blue: 238/255)
                    .ignoresSafeArea()

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

                    Text("Build Your Profile")
                        .font(.headline)
                        .foregroundColor(Color(red: 254/255, green: 200/255, blue: 63/255))
                        .padding(.horizontal)

                    ScrollView {
                        VStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Text("Extracurriculars:")
                                        .font(.headline)
                                        .foregroundColor(.orange)
                                    Spacer()
                                    Button(action: {}) {
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(.orange)
                                    }
                                }

                                ExtracurricularCard(icon: "briefcase.fill", title: "Internship: HSBC Bank", year: "2024")
                                ExtracurricularCard(icon: "trash.fill", title: "Volunteering: Beach Clean", year: "2024")
                                ExtracurricularCard(icon: "building.columns.fill", title: "Leadership: Head Boy")
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                            .padding(.horizontal)

                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Image(systemName: "brain.head.profile")
                                    Text("Explore New ECAs with AcaBot!")
                                        .font(.headline)
                                        .foregroundColor(.orange)
                                }

                                Text("Got any quick ECA ideas I can try out?")
                                    .padding(.top, 8)
                                    .padding(.bottom, 4)

                                Text("You can try launching a \"Green Tech Day\" at school – combine tech and sustainability in one day")
                                    .padding()
                                    .background(Color(red: 255/255, green: 233/255, blue: 211/255))
                                    .cornerRadius(12)

                                Text("Would you like me to help with implementation?")
                                    .padding()
                                    .background(Color(red: 255/255, green: 233/255, blue: 211/255))
                                    .cornerRadius(12)

                                HStack {
                                    TextField("Type here to ask AcaBot", text: $acaBotInput)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(12)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color(red: 254/255, green: 200/255, blue: 63/255), lineWidth: 2)
                                        )

                                    Button(action: {
                                        print("User asked: \(acaBotInput)")
                                        acaBotInput = ""
                                    }) {
                                        Image(systemName: "paperplane.fill")
                                            .foregroundColor(.orange)
                                            .padding(.leading, 8)
                                    }
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
        }
    }
}

struct ExtracurricularCard: View {
    var icon: String
    var title: String
    var year: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Image(systemName: icon)
                Text(title)
                    .bold()
                Spacer()
                Image(systemName: "pencil")
                    .foregroundColor(.orange)
            }

            Text("Add a Description")
                .foregroundColor(.gray)

            if let year = year {
                Text(year)
                    .foregroundColor(.orange)
                    .font(.caption)
            }
        }
        .padding()
        .background(Color(red: 253/255, green: 244/255, blue: 238/255))
        .cornerRadius(12)
    }
}

#Preview {
    Activities()
}

