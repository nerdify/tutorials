
import Foundation

struct User: Identifiable, Decodable {
  let id: Int
  let name: String
  let username: String
  let email: String
  
  init(
    id: Int,
    name: String,
    username: String,
    email: String
  ) {
    self.id = id
    self.name = name
    self.username = username
    self.email = email
  }
  
  static let sample = [
    User(id: 1, name: "Jonh Doe", username: "Jonatan61", email: "Kurtis_Bins4@gmail.com"),
    User(id: 2, name: "Kuhn, Prohaska and Pfeffer", username: "Tressie_Murazik", email: "Stephanie_Gislason67@gmail.com"),
    User(id: 3, name: "Dr. Cristina Wiegand", username: "Hilma_Kirlin63", email: "Kristin77@hotmail.com"),
    User(id: 4, name: "Antonio Schumm", username: "Dedric_Pfannerstill94", email: "Jamel39@hotmail.com"),
    User(id: 5, name: "Gina Considine", username: "Leonor_Jakubowski", email: "Gina.Trantow@yahoo.com"),
    User(id: 6, name: "Jonh Doe", username: "Jonatan61", email: "Kurtis_Bins4@gmail.com"),
    User(id: 7, name: "Kuhn, Prohaska and Pfeffer", username: "Tressie_Murazik", email: "Stephanie_Gislason67@gmail.com"),
    User(id: 8, name: "Dr. Cristina Wiegand", username: "Hilma_Kirlin63", email: "Kristin77@hotmail.com"),
  ]
}
