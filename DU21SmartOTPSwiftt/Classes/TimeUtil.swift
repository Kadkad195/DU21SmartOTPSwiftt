import Foundation

class TimeUtil {
    
    init() {
        
    }
    
    func getTime(_ callback: @escaping (_ time: Int) -> Void) {
        var request = URLRequest(url: URL(string: "http://date.jsontest.com")!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(TimeEntity.self, from: data!)
                callback(responseModel.milliseconds_since_epoch)
            } catch {
                print("KAD GET TIME JSON Serialization error")
            }
        }).resume()
    }
    
}

class TimeEntity: Codable {
    var milliseconds_since_epoch: Int = 0
}
