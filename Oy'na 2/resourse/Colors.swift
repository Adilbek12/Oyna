import UIKit

struct Colors {
    
    public static let BORDER_COLOR = getColor(r: 170, g: 208, b: 156)
    public static let PLACEHOLDER_COLOR = getColor(r: 255, g: 255, b: 255)
    
    public static let GRAY = Gradient.init(t: getColor(r: 255, g: 255, b: 255), m: nil, b: getColor(r: 100, g: 100, b: 100))
    public static let RED = Gradient.init(t: getColor(r: 255, g: 9, b: 9), m: nil, b: getColor(r: 128, g: 5, b: 5))
    
    public static func getColor(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
