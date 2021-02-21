//
//  MoviesService.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import Foundation
import Alamofire

 protocol MoviesServiceProtocol {
    func fetchTopMovies(completion: @escaping (_ movie: Movie?, _ error: Error?) -> Void)
}

class MoviesService: MoviesServiceProtocol {
    let decoder = JSONDecoder()

    public init() { }
    
    func fetchTopMovies(completion: @escaping (_ movie: Movie?, _ error: Error?) -> Void) {
        var params = Parameters.init()
        params["api_key"] = Constants.shared.apiKey
        
        let url = URL(string: Constants.shared.baseUrl)
        
        self.requestWith(url: url, method: .get, parameters: params, encoding: URLEncoding.queryString) { (response) in
            
            guard let data = response?.data else { return }
            do {
                let movieResponse = try self.decoder.decode(Movie.self, from: data)
                completion(movieResponse, nil)
            } catch let jsonError {
                print("Error serializing json.Network.characters:", jsonError)
                completion(nil, jsonError)
            }
        }
    }
}

// MARK: RequestWith
extension MoviesService {
    
    func requestWith(url: URL!, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding, completionHandler: @escaping (_ response: DataResponse<Any>?) -> Void) {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: nil)
            .debugLog()
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                
                print(String(data: response.data!, encoding: .utf8) ?? "")
                
                switch response.result {
                    case .success:
                        completionHandler(response)
                    case .failure(let error):
                        if response.response?.statusCode == 401 {
                            print("Network.requestWith.error.Unauthorized:", error)
                            completionHandler(nil)
                        } else {
                            print("Network.requestWith.error:", error)
                            completionHandler(nil)
                    }
                }
        }
    }
}
// MARK: Request extension
extension Request {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint("================================================================================================")
        debugPrint(self)
        debugPrint("================================================================================================")
        #endif
        return self
    }
}
