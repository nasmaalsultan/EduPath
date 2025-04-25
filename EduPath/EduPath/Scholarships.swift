import SwiftUI

struct Scholarships: View {
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

        
                    HStack {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(Color(red: 254/255, green: 200/255, blue: 63/255))
                        Text("Explore Scholarships")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color(red: 254/255, green: 200/255, blue: 63/255))
                    }
                    .padding(.horizontal)

    
                    ScrollView {
                        VStack(spacing: 20) {
                            ScholarshipBannerCard(
                                imageName: "chevening",
                                title: "Chevening UK Scholarship",
                                amount: "$16,000 – $36,000",
                                location: "London, United Kingdom",
                                tags: ["Need Based", "UK Citizens"]
                            )

                            ScholarshipBannerCard(
                                imageName: "burgerking",
                                title: "Burger King Scholarship",
                                amount: "$1,000 – $60,000",
                                location: "USA & Canada",
                                tags: ["Merit Based"]
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

//card with banner

struct ScholarshipBannerCard: View {
    var imageName: String
    var title: String
    var amount: String
    var location: String
    var tags: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width - 40, height: 150)
                .clipped()
                .cornerRadius(15)

            Text(title)
                .font(.title3)
                .bold()
                .foregroundColor(Color(red: 232/255, green: 97/255, blue: 61/255))

            Text(amount)
                .foregroundColor(Color(red: 232/255, green: 97/255, blue: 61/255))

            HStack(spacing: 5) {
                Image(systemName: "mappin.and.ellipse")
                    .foregroundColor(.orange)
                Text(location)
                    .foregroundColor(.orange)
            }

            Text(tags.joined(separator: " | "))
                .font(.footnote)
                .foregroundColor(.orange)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    Scholarships()
}

