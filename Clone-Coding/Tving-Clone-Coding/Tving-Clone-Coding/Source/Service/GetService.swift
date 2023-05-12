import Foundation
import Alamofire

class GetService {
    static let shared = GetService()
    func getService <T: Decodable> (from url: String,
                                    callback: @escaping (_ data: T?, _ error: String?) -> ()) {
        let header: HTTPHeaders = ["Content-Type": "application/json",
                                   "Authorization": "Bearer " + Config.apiKey]
        
        AF.request(url,
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: header).response { response in
            dump(response)
            
            do {
                guard let resData = response.data else {
                    callback(nil, "emptyData")
                    return
                }
                let data = try JSONDecoder().decode(T.self, from: resData)
                callback(data, nil)
            } catch {
                callback(nil, error.localizedDescription)
            }
        }
    }
    
}
