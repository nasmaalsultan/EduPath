import SwiftUI

struct T50AppEssays: View {
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

  
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Application Essays:")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color(red: 236/255, green: 194/255, blue: 71/255))

                        Text("T50 USA Schools")
                            .font(.headline)
                            .foregroundColor(.orange)
                    }
                    .padding(.horizontal)

       
                    ScrollView {
                        VStack(spacing: 20) {

                            NavigationLink(destination: NorthwesternExample()) {
                                UniversityCardView(
                                    imageName: "northwestern",
                                    title: "Northwestern University",
                                    major: "Mathematics",
                                    classYear: "Class of 2025"
                                )
                            }

                     
                            UniversityCardView(
                                imageName: "ucb",
                                title: "University of California, Berkeley",
                                major: "Business",
                                classYear: "Class of 2024"
                            )


                            UniversityCardView(
                                imageName: "vanderbilt",
                                title: "Vanderbilt University",
                                major: "Chemical Engineer",
                                classYear: "Class of 2026"
                            )
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
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
            .navigationBarHidden(true)
        }
    }
}

struct UniversityCardView: View {
    let imageName: String
    let title: String
    let major: String
    let classYear: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 140, height: 100)
                .clipped()
                .cornerRadius(16)

            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)

                Text("Major: \(major)")
                    .font(.subheadline)
                    .foregroundColor(.black)

                Text(classYear)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 2)
    }
}

#Preview {
    T50AppEssays()
}

