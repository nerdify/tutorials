import SwiftUI

final class ShimmerViewModel: ObservableObject {
  @Published var isLoading = false
  @Published var users: [User] = User.sample
  
  @MainActor
  func fetchUsers() async {
    defer { isLoading = false }
    do {
      isLoading = true
      let duration = Duration(secondsComponent: 4, attosecondsComponent: 0)
      try await Task.sleep(for: duration)
      let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
      let (data, _) = try await URLSession.shared.data(from: url)
      users = try JSONDecoder().decode([User].self, from: data)
    } catch {
      users = []
      print(error.localizedDescription)
    }
  }
  
}


struct ContentView: View {
  @StateObject private var viewModel = ShimmerViewModel()
  
  var body: some View {
    NavigationStack {
      ScrollView {
        ForEach(viewModel.users) { user in
          LazyVStack {
            UserRow(user: user)
              .padding(.horizontal, 16)
              .redactShimmer(condition: viewModel.isLoading)
              
          }
        }
      }
      .navigationTitle("User")
      .background {
        Color(uiColor: UIColor.secondarySystemBackground)
          .edgesIgnoringSafeArea(.all)
      }
    }
    .task { await viewModel.fetchUsers() }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
