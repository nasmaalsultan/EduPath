import SwiftUI

struct UKPersonalStatement: View {
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

                    
                    Text("Personal Statements: UK Russel Group")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(red: 254/255, green: 200/255, blue: 63/255))
                        .padding(.horizontal)


                    ScrollView {
                        VStack(spacing: 24) {
                
                            NavigationLink(destination: LSEexample()) {
                                ExampleCard(
                                    imageName: "lse",
                                    title: "London School of Economics",
                                    major: "Economics",
                                    classYear: "2024"
                                )
                            }

     
                            ExampleCard(
                                imageName: "manchester",
                                title: "University of Manchester",
                                major: "Psychology",
                                classYear: "2026"
                            )

          
                            ExampleCard(
                                imageName: "oxford",
                                title: "University of Oxford",
                                major: "Computer Science",
                                classYear: "2026"
                            )
                        }
                        .padding(.horizontal)
                    }

                    
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
struct ExampleCard: View {
    var imageName: String
    var title: String
    var major: String
    var classYear: String

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color(red: 51/255, green: 68/255, blue: 82/255))
                Text("Major: \(major)")
                    .foregroundColor(.gray)
                Text("Class of \(classYear)")
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}
#Preview {
    UKPersonalStatement()
}
