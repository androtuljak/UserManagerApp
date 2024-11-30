import SwiftUI

@main
struct UserManagerApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                // Task 1: Local Users
                ContentView()
                    .tabItem {
                        Label("Local Users", systemImage: "person.3")
                    }

                // Task 2: API Users
                APIUserListView()
                    .tabItem {
                        Label("API Users", systemImage: "network")
                    }
            }
        }
    }
}
