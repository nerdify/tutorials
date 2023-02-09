import SwiftUI


struct UserRow: View {
  private let user: User
  
  init(user: User) {
    self.user = user
  }
  
  var body: some View {
    VStack {
      HStack {
        AvatarView(person: user)
        VStack(alignment: .leading, spacing: 4) {
          Text("\(user.name)")
            .font(.callout)
            .fontWeight(.heavy)
          Text(user.email.lowercased())
            .font(.caption)
          
        }.padding(.leading, 2)
        Spacer()
      }
      .padding(.vertical, 6)
      .padding(.horizontal, 16)
    }
    .padding(.vertical, 8)
    .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
      .fill(Color(uiColor: UIColor.systemBackground)))
  }
}



struct AvatarView: View {
  private let user: User
  
  init(person: User) {
    self.user = person
  }
  
  var body: some View {
    INITIALS_VIEW
  }
  
  private var INITIALS_VIEW: some View {
    Circle()
      .frame(width: 48)
      .foregroundColor(Color(uiColor: UIColor.secondarySystemBackground))
      .overlay(
        
        Image("Logo")
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
      )
  }
}



extension String {
  var initials: String {
    let formatter = PersonNameComponentsFormatter()
    if let components = formatter.personNameComponents(from: self) {
      formatter.style = .abbreviated
      return formatter.string(from: components)
    } else {
      return ""
    }
  }
}
