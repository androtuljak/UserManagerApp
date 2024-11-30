import SwiftUI

struct AddUserView: View {
    @ObservedObject var userManager: UserManager

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var gender = "Male"
    @State private var age = ""

    let genders = ["Male", "Female"]

    var body: some View {
        Form {
            Section(header: Text("User Details")) {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                Picker("Gender", selection: $gender) {
                    ForEach(genders, id: \.self) { gender in
                        Text(gender)
                    }
                }
                TextField("Age", text: $age)
                    .keyboardType(.numberPad)
            }

            Button(action: addUser) {
                Text("Save")
            }
        }
        .navigationTitle("Add User")
    }

    func addUser() {
        guard let age = Int(age) else { return }
        let user = User(
            id: UUID(),
            firstName: firstName,
            lastName: lastName,
            gender: gender,
            age: age
        )
        userManager.addUser(user: user)
    }
}
