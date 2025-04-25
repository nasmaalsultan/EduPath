import SwiftUI

struct LSEexample: View {
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
                        Text("London School of Economics")
                            .font(.title)
                            .bold()
                            .foregroundColor(.orange)

                        Text("Economics")
                            .font(.headline)
                            .foregroundColor(.orange)

                        Text("Class of 2024")
                            .font(.subheadline)
                            .foregroundColor(.orange)
                    }
                    .padding(.horizontal)

           
                    ScrollView {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("""
                            Examination of any quality newspaper will probably demonstrate that more of the headlines address economic problems than any other topic. The importance and relevance of economic-related disciplines to the modern world have led me to want to pursue the study of the subject at a higher level. I am particularly interested in the behaviour of firms and organisations from an economic point of view, and I have based my A-level coursework in this field.

                            During my study, I have encountered many real-life complexities, and while attempting to explain these theories, I have developed a keen interest in analysing and understanding how the world of business is influenced by economics. I have created an economics revision website for A-level and GCSE students. It is primarily intended to help younger students gain an understanding of core economic principles, but has also helped me improve my own computer and presentational skills.

                            I regularly read newspapers and economic publications to stay updated with economic developments, and I am able to use my mathematical and analytical skills to apply different economic theories to a range of real-life economic situations. Last year, I took part in an economics and business project called Young Enterprise in which I set up a small company and sold products to students at our school. I enjoyed the chance to put some of my business economic theory into practice and was able to enhance my management and communication skills. I also gained a distinction in the associated exam.

                            To gain practical experience in the workplace, I worked for two weeks at a small software company specialising in financial software. I currently have a part-time job, and this has taught me much about teamwork, responsibility, and time management in the workplace. In my spare time, I enjoy reading, swimming, sketching, and solving puzzles and logic problems. I have redesigned and been responsible for the maintenance of my school’s website.

                            I believe that I will gain a highly marketable set of skills from the study of economics at university. I have found economics to be a challenging and diverse discipline, and I am interested in both macro and microeconomics. It is this variation of perspective, combined with its real-world importance, that makes economics an appealing subject to study at university.
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
    LSEexample()
}
