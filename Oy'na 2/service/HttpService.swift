protocol HttpService {
    func authorizingUserBy(phoneNumber: String, password: String, callback: (_ token: String?) -> ())
    func registration(user: RegisrationUser, callback: (_ token: String?) -> ())
}
