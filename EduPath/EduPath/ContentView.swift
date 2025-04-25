import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(red: 227/255, green: 104/255, blue: 71/255)
                    .ignoresSafeArea()

                Text("EDUPATH")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.white)
                    .position(x: UIScreen.main.bounds.width / 2, y: 210)

                Text("Your Path, Your Future, Our Guide")
                    .font(.subheadline)
                    .foregroundColor(.black.opacity(0.8))
                    .position(x: UIScreen.main.bounds.width / 2, y: 254)

                NavigationLink(destination: Login()) {
                    HStack {
                        Text("Get Started")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .padding(.horizontal, 32)
                    .padding(.vertical, 18)
                    .background(Color(red: 252/255, green: 207/255, blue: 106/255))
                    .foregroundColor(.black)
                    .clipShape(Capsule())
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 4)
                }
                .position(x: UIScreen.main.bounds.width / 2, y: 560)
            }
        }
    }
}

#Preview {
    ContentView()
}

