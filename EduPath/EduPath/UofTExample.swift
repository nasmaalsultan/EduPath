import SwiftUI

struct UofTExample: View {
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
                        Text("University of Toronto")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color(red: 254/255, green: 200/255, blue: 63/255))

                        Text("Medicine")
                            .font(.headline)
                            .foregroundColor(.orange)

                        Text("Class of 2025")
                            .font(.subheadline)
                            .foregroundColor(.orange)
                    }
                    .padding(.horizontal)

            
                    ScrollView {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("""
                            My fascination with medicine began while volunteering at a local community clinic. I saw how doctors weren’t just solving biological problems—they were also building relationships, providing comfort, and earning trust. That experience shifted my perspective: medicine isn’t just a career rooted in science, it’s a lifelong commitment to service and empathy. It made me want to become the kind of doctor who’s not only technically skilled but also emotionally intelligent and culturally aware.

                            Motivated by this experience, I dove into biology and chemistry, quickly developing a passion for how the human body works—particularly the immune and nervous systems. I became curious about how diseases operate at a molecular level, how genetics influence recovery, and how we can design treatments that are both effective and equitable. I even started a school club where we explored medical case studies and debated the ethics of new healthcare technologies. These discussions deepened my interest in the intersection of science, ethics, and public health.

                            The University of Toronto’s Life Sciences program offers the ideal academic environment for this journey. I’m especially excited about the Human Biology major and the option to explore areas like neuroscience and global health. The ability to take courses across disciplines will help me build a well-rounded foundation for medical school. I’m also drawn to UofT’s strong research culture—programs like the Research Opportunity Program (ROP) and access to affiliated hospitals such as Toronto General and SickKids would give me the chance to learn from some of the best in the world.

                            Outside the classroom, I look forward to getting involved in student-led initiatives like the Hart House Medical Society or volunteering through the UofT chapter of the Canadian Red Cross. I want to be part of a community where I can grow not only as a student, but as a future leader in healthcare.

                            Ultimately, I’m choosing UofT because it’s more than a university—it’s a place where I can combine my passion for science with my desire to make a meaningful impact. I know it will challenge and shape me into the kind of doctor I aspire to be.
                            """)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(radius: 2)
                                .padding(.horizontal)
                        }
                        .padding(.bottom, 16)
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

#Preview {
    UofTExample()
}

