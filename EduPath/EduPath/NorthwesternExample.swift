import SwiftUI

struct NorthwesternExample: View {
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
                        Text("Northwestern University")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color(red: 236/255, green: 194/255, blue: 71/255))

                        Text("Mathematics")
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
                            From an early age, I've been captivated by the elegance of mathematics—the way complex problems can be unraveled through logical reasoning and creative thinking. Growing up in a multicultural household, I often found myself bridging different perspectives, which naturally extended to my approach in problem-solving. This blend of analytical rigor and open-mindedness has been the cornerstone of my academic journey.

                            In high school, I spearheaded a peer-led math tutoring program, aiming to make mathematics more accessible and less intimidating for students struggling with the subject. This experience not only honed my leadership skills but also deepened my appreciation for collaborative learning environments.

                            At Northwestern, I am eager to immerse myself in the vibrant mathematical community within the Weinberg College of Arts and Sciences. The university’s emphasis on interdisciplinary studies resonates with my belief that mathematics is not isolated but interconnected with various fields. I am particularly interested in exploring courses that intersect mathematics with computer science and economics, areas where analytical skills can drive innovation.

                            Beyond academics, I look forward to contributing to student-led organizations such as the Northwestern Undergraduate Math Society, where I can engage with peers who share my passion and perhaps initiate outreach programs to local schools, fostering a love for mathematics in younger students.

                            Northwestern’s commitment to fostering a diverse and inclusive community aligns with my own values. I am excited about the prospect of engaging in dialogues that challenge my perspectives and broaden my understanding, both within and outside the classroom.

                            In essence, I envision my time at Northwestern as an opportunity to deepen my mathematical knowledge, collaborate with a diverse cohort of thinkers, and contribute meaningfully to the university’s dynamic community.
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
    NorthwesternExample()
}

