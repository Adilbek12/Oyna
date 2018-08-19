import Foundation

class HttpService {
    
    public typealias callbackFuncType = ((Data?, URLResponse?, Error?)->())
    
    public func get(urlString: String, params: [String: Any], callback: callbackFuncType?) {
        let urlRequest = getUrlRequest(urlString: urlString)!
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            callback?(data, response, error)
        }
        task.resume()
    }
    
    
    public func post(urlString: String, params: [String: Any], callback: callbackFuncType?) {

        var urlRequest = getUrlRequest(urlString: urlString)!
        urlRequest.httpBody = convertToJsonData(params: params)
        
        urlRequest.httpMethod = "POST"
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            callback!(data, response, error)
        }
        task.resume()
    }
    
    public func remove(urlString: String, params: [String: Any], callback: callbackFuncType?) {
        
        var urlRequest = getUrlRequest(urlString: urlString)!
        urlRequest.httpMethod = "DELETE"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            callback?(data, response, error)
        }
        task.resume()
    }
    
    private func getUrlRequest(urlString: String) -> URLRequest? {
        let todosEndpoint: String = urlString
        guard let todosURL = URL(string: todosEndpoint) else {
            print("Error: cannot create URL")
            return nil
        }
        return URLRequest(url: todosURL)
    }
    
    private func convertToJsonData(params: [String: Any]) -> Data? {
        var jsonTodo: Data?
        do {
            jsonTodo = try JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("Error: cannot create JSON from todo")
            return nil
        }
        return jsonTodo
    }
}
