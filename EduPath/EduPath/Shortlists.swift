import SwiftUI

struct Shortlists: View {
    @State private var showSettings = false
    @State private var showChatBot = false

    let regions = [
        ("North America 🗽", [
            ("University of Michigan", "11%"),
            ("Ohio State University", "62%"),
            ("University of Wisconsin-Madison", "13%")
        ]),
        ("Europe 🏰", [
            ("ETH Zurich", "7%"),
            ("Lund University", "13%"),
            ("University of Amsterdam", "53%")
        ]),
        ("United Kingdom 🎓", [
            ("University of Bristol", "11%"),
            ("Kings College London", "23%"),
            ("University of Manchester", "9%")
        ]),
        ("Middle East and More 🐪", [
            ("NYUAD", "11%"),
            ("American University of Sharjah", "13%"),
            ("American University of Dubai", "9%")
        ])
    ]

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

                    Text("Explore Your Options")
                        .font(.headline)
                        .foregroundColor(Color(red: 254/255, green: 200/255, blue: 63/255))
                        .padding(.horizontal)

                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(regions, id: \.0) { region in
                                VStack(alignment: .leading, spacing: 12) {
                                    HStack {
                                        Text(region.0)
                                            .font(.headline)
                                            .foregroundColor(.orange)
                                        Spacer()
                                        Button(action: {
                                           
                                        }) {
                                            Image(systemName: "plus.circle.fill")
                                                .foregroundColor(.orange)
                                        }
                                    }

                                    ForEach(region.1, id: \.0) { university in
                                        HStack {
                                            Text(university.0)
                                                .foregroundColor(.black)
                                            Spacer()
                                            Text(university.1)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                                .padding(.horizontal)
                            }
                        }
                        .padding(.vertical)
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
#Preview {
    Shortlists()
}
