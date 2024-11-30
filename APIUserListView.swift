import SwiftUI

struct APIUserListView: View {
    @State private var apiUsers: [APIUser] = []
    @State private var isLoading = true

    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView("Loading API Users...")
                } else if apiUsers.isEmpty {
                    Text("No API Users Found")
                } else {
                    List(apiUsers) { user in
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.email)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("API Users")
            .onAppear(perform: fetchAPIUsers)
        }
    }

    func fetchAPIUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }

            if let users = try? JSONDecoder().decode([APIUser].self, from: data) {
                DispatchQueue.main.async {
                    self.apiUsers = users
                    self.isLoading = false
                }
            }
        }.resume()
    }
}

struct APIUser: Identifiable, Codable {
    let id: Int
    let name: String
    let email: String
}
