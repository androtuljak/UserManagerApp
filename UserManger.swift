import Foundation

class UserManager: ObservableObject {
    @Published var users: [User] = []

    func addUser(user: User) {
        users.append(user)
    }

    func deleteUser(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
}
