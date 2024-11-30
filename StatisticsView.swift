mport SwiftUI

struct StatisticsView: View {
    let users: [User]

    var body: some View {
        VStack(spacing: 16) {
            Text("Statistics")
                .font(.largeTitle)
                .bold()

            Text("Average Age: \(String(format: "%.2f", averageAge()))")
                .font(.title2)

            VStack(alignment: .leading, spacing: 8) {
                Text("Gender Distribution:")
                    .font(.title3)
                    .bold()
                Text("Male: \(String(format: "%.2f%%", genderPercentage(for: "Male")))")
                Text("Female: \(String(format: "%.2f%%", genderPercentage(for: "Female")))")
            }
            .padding()
        }
    }

    func averageAge() -> Double {
        guard !users.isEmpty else { return 0.0 }
        let totalAge = users.reduce(0) { $0 + $1.age }
        return Double(totalAge) / Double(users.count)
    }

    func genderPercentage(for gender: String) -> Double {
        guard !users.isEmpty else { return 0.0 }
        let count = users.filter { $0.gender == gender }.count
        return (Double(count) / Double(users.count)) * 100
    }
}
