import SwiftUI

struct ContentView: View {
    @StateObject private var userManager = UserManager() // Local user manager

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(userManager.users) { user in
                        VStack(alignment: .leading) {
                            Text("\(user.firstName) \(user.lastName)")
                                .font(.headline)
                            Text("Age: \(user.age), Gender: \(user.gender)")
                                .font(.subheadline)
                        }
                    }
                    .onDelete(perform: userManager.deleteUser)
                }

                NavigationLink(destination: AddUserView(userManager: userManager)) {
                    Text("Add User")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding()
                }
            }
            .navigationTitle("Local Users")
        }
    }
}
