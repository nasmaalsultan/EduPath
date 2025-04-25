import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Account Settings", destination: Text("Account Settings Page"))
                NavigationLink("Notification Settings", destination: Text("Notification Settings Page"))
                NavigationLink("Help", destination: Text("Help Page"))
                NavigationLink("About Us", destination: Text("About Us Page"))
            }
            .navigationTitle("Settings")
        }
    }
}
