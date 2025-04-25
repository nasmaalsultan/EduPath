import SwiftUI

struct CornellExample: View {
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
                        Text("Cornell University")
                            .font(.title)
                            .bold()
                            .foregroundColor(.orange)

                        Text("Computer Science")
                            .font(.headline)
                            .foregroundColor(.orange)

                        Text("Class of 2026")
                            .font(.subheadline)
                            .foregroundColor(.orange)
                    }
                    .padding(.horizontal)

                
                    ScrollView {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("""
                            The first time I wrote a program, it was to solve a Sudoku puzzle. As I watched the algorithm fill in each cell, I felt a surge of excitement—this was more than just code; it was a tool to solve real problems. This initial spark led me to explore the vast field of Computer Science, where I found a passion for developing solutions that can impact lives.

                            In high school, I joined the robotics club, where I was responsible for programming the autonomous navigation system. Collaborating with peers, we faced challenges that required innovative thinking and precise coding. This experience taught me the importance of teamwork and the real-world applications of Computer Science.

                            I also undertook a personal project to develop a mobile app that helps visually impaired individuals navigate public spaces using auditory cues. This endeavor combined my technical skills with a desire to contribute positively to society. It reinforced my belief that technology should be accessible and inclusive.

                            Cornell’s College of Engineering stands out to me because of its interdisciplinary approach and commitment to societal impact. The opportunity to engage in projects like those at the Cornell Initiative for Digital Agriculture aligns with my interest in using technology to address global challenges. Additionally, the diverse course offerings will allow me to explore areas like artificial intelligence and human-computer interaction, further broadening my understanding and skill set.

                            I am particularly drawn to the collaborative environment at Cornell, where students and faculty work together across disciplines. I look forward to contributing my perspective and learning from others, fostering a community where innovation thrives.

                            Pursuing Computer Science at Cornell will equip me with the knowledge and experience to develop technologies that are not only advanced but also ethical and inclusive. I am excited about the prospect of being part of a community that values both technical excellence and societal responsibility.
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
    CornellExample()
}

