//: A UIKit based Playground for presenting user interface
  
import UIKit
import Network
import PlaygroundSupport


struct Users: Codable {
    let name: String
    let username: String
    let email: String
}

struct Album: Codable {
    let userId: Int
    let id: Int
    let title: String
}

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
        getUserData()
        getAlbumData()
    }
    
    func getUserData() {
//        let service = Service()
//        service.sendRequest("http://jsonplaceholder.typicode.com/users") { (r: Result<[Users], NetworkErroCode>) -> (Void) in
//            switch r {
//            case .success(let data):
//                print(data)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        NetworkEngine.Request(endPoint: UsersEndPoint.getUsersList) { (r: Result<[Users], NetworkErroCode>) -> (Void) in
            switch r {
            case .success(let users):
                print(users)
            case .failure(let error):
                print(error)
        }
        
    }
}
    func getAlbumData() {
//        let service = Service()
//        service.sendRequest("http://jsonplaceholder.typicode.com/albums") { (r: Result<[Album], NetworkErroCode>) -> (Void) in
//            switch r {
//            case .success(let album):
//                print(album)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        NetworkEngine.Request(endPoint: UsersEndPoint.getPost) { (r: Result<[Album], NetworkErroCode>) -> (Void) in
            switch r {
            case .success(let album):
                print(album)
            case .failure(let code):
                print(code)
            }
        }
    }
    
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()



enum NetworkErroCode: Error {
     case badNetwork(String)
     case somethingWrong
     case failedtoParse(String)
     case emptyData
}


class Service {
    func sendRequest<T: Codable>(_ str: String, completion:@escaping(Result<[T], NetworkErroCode>)-> (Void)) {
        let url = URL(string: str)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
             
            let httpResponse = response as? HTTPURLResponse
            
            if httpResponse?.statusCode == 200 {
                guard let data = data else {
                    completion(.failure(NetworkErroCode.emptyData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode([T].self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(NetworkErroCode.failedtoParse("Failed to parse")))
                }
            } else if httpResponse?.statusCode == 401 {
                completion(.failure(NetworkErroCode.badNetwork("Bad Request")))
            } else {
                completion(.failure(NetworkErroCode.somethingWrong))
            }
        }.resume()
    }
}

// MARK: Generic Network Layer

protocol EndPoints {
    var schema: String { get }
    
    var baseURL: String {  get }
    
    var path: String { get }
    
    var method: String { get }
    
    //var parameters: [URLQueryItem] { get }
}

enum UsersEndPoint: EndPoints {
    
    case getUsersList
    case getPost
    
    var schema: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "jsonplaceholder.typicode.com"
        }
    }
    
    var path: String {
        switch self {
        case .getUsersList:
            return "/users"
        case .getPost:
            return "/albums"
        }
        
        
    }
        
    var method: String {
        switch  self {
        case .getUsersList:
            return "Get"
        case .getPost:
            return "Get"
        }
    }
}


class NetworkEngine {
    class func Request<T: Codable>(endPoint: EndPoints, completion: @escaping (Result<[T], NetworkErroCode>) -> (Void)) {
        
        var component =  URLComponents()
        
        component.scheme = endPoint.schema
        component.host = endPoint.baseURL
        component.path = endPoint.path
        
    
        guard let url = component.url else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(.failure(NetworkErroCode.emptyData))
                return
            }
            
            do {
                let d =  try JSONDecoder().decode([T].self, from: data)
                completion(.success(d))
            } catch {
                completion(.failure(NetworkErroCode.failedtoParse("Unable to decode data")))
            }
        }.resume()
        
    }
}
