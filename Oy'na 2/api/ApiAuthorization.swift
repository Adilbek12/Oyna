import Foundation

class ApiAuthorization {
    
    private let httpService: HttpService
    
    init() {
        httpService = HttpService.init()
    }
    
    public func authorizing(user: AuthorizationUser, callback: ((String?)->())?) {

    }
    
    public func registration(user: RegisrationUser, callback: ((String?)->())) {
        
    }
}
