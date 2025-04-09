import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                    Text("Shortlists")
                }
            
            DummyView(title: "Essays")
                .tabItem {
                    Image(systemName: "doc.text")
                    Text("Essays")
                }
            
            DummyView(title: "Activities")
                .tabItem {
                    Image(systemName: "sportscourt")
                    Text("Activities")
                }
            
            DummyView(title: "Scholarships")
                .tabItem {
                    Image(systemName: "banknote")
                    Text("Scholarships")
                }
            
            DummyView(title: "Tutoring")
                .tabItem {
                    Image(systemName: "highlighter")
                    Text("Tutoring")
                }
        }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("EDUPATH")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color(red: 202/255, green: 102/255, blue: 64/255))
                    
                    Text("Hello, Name")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.primary)
                    
                    Text("Next on Your To-Do List:")
                        .font(.headline)
                        .foregroundColor(Color(red: 214/255, green: 178/255, blue: 47/255))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ToDoItem(text: "Begin your UK shortlist")
                        ToDoItem(text: "Begin your USA shortlist")
                        ToDoItem(text: "Upload transcripts")
                        ToDoItem(text: "Start brainstorming Common App essay")
                        ToDoItem(text: "Explore 2 new scholarships")
                        ToDoItem(text: "Get started with an ECA")
                    }
                    
                    TipCard()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Upcoming Deadlines:")
                            .font(.headline)
                            .foregroundColor(Color(red: 214/255, green: 178/255, blue: 47/255))
                        
                        DeadlineItem(text: "UCAS: Jan 15th")
                        DeadlineItem(text: "Canadian Applications: Jan 15th")
                    }
                    
                    Button(action: {
                        print("AcaBot tapped")
                    }) {
                        HStack {
                            Image(systemName: "bubble.left.and.bubble.right.fill")
                            Text("Questions? Ask AcaBot Anything!")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 239/255, green: 160/255, blue: 99/255))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(radius: 2)
                    }
                    .padding(.top)
                    
                }
                .padding()
            }
        }
    }
}

struct ToDoItem: View {
    let text: String
    var body: some View {
        HStack {
            Image(systemName: "chevron.right.2")
                .foregroundColor(Color(red: 202/255, green: 102/255, blue: 64/255))
            Text(text)
        }
        .foregroundColor(.black)
    }
}

struct TipCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Image(systemName: "pin.fill")
                    .foregroundColor(Color(red: 202/255, green: 102/255, blue: 64/255))
                Text("Today's Tip:")
                    .foregroundColor(Color(red: 202/255, green: 102/255, blue: 64/255))
                    .bold()
            }
            Text("You can apply to scholarships ")
                + Text("after").italic().bold()
                + Text(" getting in too.")
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).stroke(Color.teal, lineWidth: 2))
        .background(Color.white)
        .cornerRadius(12)
    }
}

struct DeadlineItem: View {
    let text: String
    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundColor(.red)
            Text(text)
                .foregroundColor(.black)
        }
    }
}

struct DummyView: View {
    let title: String
    var body: some View {
        Text("\(title) Screen")
            .font(.largeTitle)
            .padding()
    }
}

#Preview {
    ContentView()
}
x
