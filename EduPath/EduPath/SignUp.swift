import SwiftUI

struct SignUp: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var dob = ""
    @State private var password = ""
    @State private var nationality = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                

                HStack {
                    NavigationLink(destination: Login()) {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(Color(red: 232/255, green: 97/255, blue: 61/255))
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)


                Text("Create Account")
                    .font(.system(size: 32, weight: .bold))
                    .padding(.horizontal)

                VStack(spacing: 16) {
                    SignUpField(icon: "person", placeholder: "First Name", text: $firstName)
                    SignUpField(icon: "person", placeholder: "Last Name", text: $lastName)
                    SignUpField(icon: "envelope.open", placeholder: "Email", text: $email)
                    SignUpField(icon: "calendar", placeholder: "Date Of Birth", text: $dob)
                    SignUpField(icon: "lock", placeholder: "Password", text: $password, isSecure: true)
                    SignUpField(icon: "house", placeholder: "Nationality", text: $nationality)
                }
                .padding(.horizontal)

                HStack {
                    Spacer()
                    NavigationLink(destination: DashboardView()) {
                        HStack {
                            Text("SIGN UP")
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
                .padding(.top, 20)

                Spacer()


                HStack {
                    Spacer()
                    Text("Already have an account?")
                        .foregroundColor(.gray)
                    NavigationLink(destination: Login()) {
                        Text("Log In")
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


struct SignUpField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Color(red: 232/255, green: 97/255, blue: 61/255))
            
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.1), radius: 3, x: 0, y: 1)
    }
}

#Preview {
    SignUp()
}

