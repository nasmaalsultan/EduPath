import SwiftUI

struct Login: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {


                HStack {
                    NavigationLink(destination: ContentView()) {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(Color(red: 232/255, green: 97/255, blue: 61/255))
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Login")
                        .font(.system(size: 36, weight: .bold))

                    Text("Please sign in to continue.")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)

                HStack {
                    Image(systemName: "envelope.open")
                        .foregroundColor(Color(red: 232/255, green: 97/255, blue: 61/255))
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                .padding(.horizontal)


                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(Color(red: 232/255, green: 97/255, blue: 61/255))
                    SecureField("Password", text: $password)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                .padding(.horizontal)

                HStack {
                    Spacer()
                    NavigationLink(destination: DashboardView()) {
                        HStack {
                            Text("LOG IN")
                                .bold()
                            Image(systemName: "arrow.right")
                        }
                        .padding()
                        .frame(width: 160)
                        .background(Color(red: 232/255, green: 97/255, blue: 61/255))
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .shadow(radius: 4)
                    }
                    Spacer()
                }
                .padding(.top, 10)

                Spacer()


                HStack {
                    Spacer()
                    Text("Don't have an account?")
                        .foregroundColor(.gray)
                    NavigationLink(destination: SignUp()) {
                        Text("Sign Up")
                            .foregroundColor(Color(red: 232/255, green: 97/255, blue: 61/255))
                            .bold()
                    }
                    Spacer()
                }
                .padding(.bottom, 16)
            }
            .background(Color(red: 253/255, green: 244/255, blue: 238/255).ignoresSafeArea())
        }
    }
}

#Preview {
    Login()
}

