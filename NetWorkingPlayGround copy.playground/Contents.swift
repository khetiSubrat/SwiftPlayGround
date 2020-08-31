import UIKit

var str = "Hello, playground"

struct MyGitHub: Codable {
    let name: String?
    let location: String?
    let followers: Int?
    let avatar_url: URL?
    let public_repo: Int?
}


let url: String?
url = "https://api.github.com/users/shashikant86"

URLSession.shared.dataTask(with: URL(string: url!)!) { (data, response, error) in
    if error != nil {
        print("The error is \(String(describing: error))")
    } else {
        print(data!)
        guard let data = data else {
            return
        }
        do {
            let decoder = JSONDecoder()
            let gitData = try decoder.decode(MyGitHub.self, from: data)
            print("The gitData is \(gitData)")
        } catch let error {
            print("The error is \(error)")
        }
    }
}.resume()
