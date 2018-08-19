class AuthorizationUser {
    public var phoneNumber: String?
    public var password: String?
    
    init() {}
    
    init(phoneNumber: String?, password: String?) {
        self.phoneNumber = phoneNumber
        self.password = password
    }
    
    public func getParams() -> [String: Any] {
        return [
            "phone_number": phoneNumber!,
            "passowrd": password!
        ]
    }
}
