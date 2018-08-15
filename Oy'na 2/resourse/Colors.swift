import UIKit

struct Colors {
    public static let GREEN = getColor(r: 0, g: 83, b: 3)
    
    public struct Special {
        public static let BORDER_COLOR = getColor(r: 170, g: 208, b: 156)
        public static let PLACEHOLDER_COLOR = getColor(r: 255, g: 255, b: 255)
    }
    
    public struct Gradient {
        public static let GRAY = [getColor(r: 255, g: 255, b: 255), getColor(r: 100, g: 100, b: 100)]
    }
    
    public static func getColor(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
