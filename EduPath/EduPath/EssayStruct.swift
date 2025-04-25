import SwiftUI

struct EssayStruct: View {
    @State private var showSettings = false
    @State private var showChatBot = false
    
    @State private var expandedSection: String? = nil

    let essayTypes: [(id: String, title: String, icon: String, structure: [String])] = [
        ("uk", "UK Personal Statement 🇬🇧", "crown.fill", [
            "1. Why you chose this subject",
            "2. Academic achievements & interest",
            "3. Relevant extracurriculars & work experience",
            "4. Personal qualities & skills",
            "5. Closing: future goals"
        ]),
        ("canada", "Canadian Personal Statement 🍁", "mapleleaf", [
            "1. Your story: a meaningful experience",
            "2. How it shaped you",
            "3. What it reveals about your values",
            "4. Why you’ll thrive in university"
        ]),
        ("commonapp", "Common App Essay 🇺🇸", "doc.text.fill", [
            "1. Hook: attention-grabbing intro",
            "2. Personal narrative with reflection",
            "3. Insight & growth",
            "4. Strong conclusion that ties it together"
        ]),
        ("supplements", "Supplemental Essays ✍️", "pencil.and.outline", [
            "1. Why this school? (Be specific)",
            "2. How you’ll contribute to campus",
            "3. Academic fit and programs",
            "4. Personality or identity prompts"
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

                    Text("Essay Structure Guide")
                        .font(.headline)
                        .foregroundColor(Color(red: 254/255, green: 200/255, blue: 63/255))
                        .padding(.horizontal)

                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(essayTypes, id: \.id) { type in
                                VStack(spacing: 0) {
                                    Button(action: {
                                        withAnimation {
                                            expandedSection = expandedSection == type.id ? nil : type.id
                                        }
                                    }) {
                                        HStack {
                                            Image(systemName: type.icon)
                                                .foregroundColor(.orange)
                                            Text(type.title)
                                                .font(.headline)
                                                .foregroundColor(.black)
                                            Spacer()
                                            Image(systemName: expandedSection == type.id ? "chevron.up" : "chevron.down")
                                                .foregroundColor(.gray)
                                        }
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(16)
                                        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                                        .padding(.horizontal)
                                    }

                                    if expandedSection == type.id {
                                        VStack(alignment: .leading, spacing: 8) {
                                            ForEach(type.structure, id: \.self) { point in
                                                Text("• " + point)
                                                    .foregroundColor(.black)
                                                    .padding(.vertical, 2)
                                            }
                                        }
                                        .padding()
                                        .background(Color(red: 255/255, green: 233/255, blue: 211/255))
                                        .cornerRadius(12)
                                        .padding([.horizontal, .bottom])
                                        .transition(.opacity.combined(with: .move(edge: .top)))
                                    }
                                }
                            }
                        }
                        .padding(.vertical)
                    }

                    Button(action: {
                        showChatBot.toggle()
                    }) {
                        HStack {
                            Image(systemName: "message")
                            Text("Stuck? Ask AcaBot!")
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
    EssayStruct()
}
