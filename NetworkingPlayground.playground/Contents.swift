import UIKit

var str = "Networking Session"

struct GitData: Codable {
    let login: String
    let id: String
}

// Resource structure which takes a URL and Closure which is Generic. Return the data model after parsing.
struct Resource<T> {
    let url: URL
    let parse:(Data)->T
}

class WebService {
    func load<T>(resource:Resource<T>, completion:@escaping(T)->()) {
        URLSession.shared.dataTask(with: resource.url) { (data, response, error) in
            guard let data =  data else {
                return
            }
            print(data)
            completion(resource.parse(data))
           
            
        }.resume()
        
    }
}

var resource =  Resource<GitData>(url: URL(string: "https://api.github.com/users/shashikant86")!) { data in
        let value = try? JSONDecoder().decode(GitData.self, from: data)
        return value!
}


var webService = WebService()
webService.load(resource: resource) { data in
  print(data)
}
