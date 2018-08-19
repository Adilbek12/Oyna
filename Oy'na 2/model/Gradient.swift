import UIKit

class Gradient {
    public let top: UIColor?
    public let middle: UIColor?
    public let bottom: UIColor?
    
    init (t: UIColor?, m: UIColor?, b: UIColor?) {
        self.top = t
        self.middle = m
        self.bottom = b
    }
}
