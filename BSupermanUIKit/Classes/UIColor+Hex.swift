
import UIKit

/// How to use.
/*Generating UIColors*/
//let colorWithHex = UIColor("#ff8942")
//let colorWithoutHex = UIColor("ff8942")
//let colorWithHexAndAlhpa = UIColor("#ff8942DF")
//let colorWithoutHexAndAlhpa = UIColor("ff8942DF")
//let shortColorWithHex = UIColor("#fff")
//let shortColorWithoutHex = UIColor("fff")
//let shortColorWithHexAndAlpha = UIColor("#FFFD")
//let shortColorWithoutHexAndAlpha = UIColor("#FFFD")

/*Generating Hex Strings from UIColor*/
//let colorWithHex = UIColor("#ff8942")
//let stringFromColor = colorWithHex.hex


public extension UIColor {
    typealias Hex = String
    
    convenience init(_ hex: Hex, alpha: CGFloat? = nil) {

        if let hexType = Type(from: hex), let components = hexType.components()
        {
            self.init(red: components.red, green: components.green, blue: components.blue, alpha: alpha ?? components.alpha)
        }
        else
        {
            self.init(red: 0, green: 0, blue: 0, alpha: 0)
        }
    }
    
    /// The string hex value representation of the current color
    var hex: Hex {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0, rgb: Int
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        if a == 1 { // no alpha value set, we are returning the short version
            rgb = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
            return String(format: "#%06x", rgb)
        } else {
            rgb = (Int)(r*255)<<24 | (Int)(g*255)<<16 | (Int)(b*255)<<8 | (Int)(a*255)<<0
            return String(format: "#%08x", rgb)
        }
    }
    
    private enum `Type` {
        
        case RGBshort(rgb: Hex)
        case RGBshortAlpha(rgba: Hex)
        case RGB(rgb: Hex)
        case RGBA(rgba: Hex)
        
        init?(from hex: Hex) {
            
            var hexString = hex
            hexString.removeHashIfNecessary()
            
            guard let t = Type.transform(hex: hexString) else {
                return nil
            }
            
            self = t
        }
        
        static func transform(hex string: Hex) -> Type? {
            switch string.count {
            case 3:
                return .RGBshort(rgb: string)
            case 4:
                return .RGBshortAlpha(rgba: string)
            case 6:
                return .RGB(rgb: string)
            case 8:
                return .RGBA(rgba: string)
            default:
                return nil
            }
        }
        
        var value: Hex {
            switch self {
            case .RGBshort(let rgb):
                return rgb
            case .RGBshortAlpha(let rgba):
                return rgba
            case .RGB(let rgb):
                return rgb
            case .RGBA(let rgba):
                return rgba
            }
        }
        
        typealias rgbComponents = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
        func components() -> rgbComponents? {
            
            var hexValue: UInt32 = 0
            guard Scanner(string: value).scanHexInt32(&hexValue) else {
                return nil
            }
            
            let r, g, b, a, divisor: CGFloat
            
            switch self {
            case .RGBshort(_):
                divisor = 15
                r = CGFloat((hexValue & 0xF00) >> 8) / divisor
                g = CGFloat((hexValue & 0x0F0) >> 4) / divisor
                b = CGFloat( hexValue & 0x00F) / divisor
                a = 1
            case .RGBshortAlpha(_):
                divisor = 15
                r = CGFloat((hexValue & 0xF000) >> 12) / divisor
                g = CGFloat((hexValue & 0x0F00) >> 8) / divisor
                b = CGFloat((hexValue & 0x00F0) >> 4) / divisor
                a = CGFloat( hexValue & 0x000F) / divisor
            case .RGB(_):
                divisor = 255
                r = CGFloat((hexValue & 0xFF0000) >> 16) / divisor
                g = CGFloat((hexValue & 0x00FF00) >> 8) / divisor
                b = CGFloat( hexValue & 0x0000FF) / divisor
                a = 1
            case .RGBA(_):
                divisor = 255
                r = CGFloat((hexValue & 0xFF000000) >> 24) / divisor
                g = CGFloat((hexValue & 0x00FF0000) >> 16) / divisor
                b = CGFloat((hexValue & 0x0000FF00) >> 8) / divisor
                a = CGFloat( hexValue & 0x000000FF) / divisor
            }
            
            return (red: r, green: g, blue: b, alpha: a)
        }
    }

    func add(overlay: UIColor) -> UIColor {
        var bgR: CGFloat = 0
        var bgG: CGFloat = 0
        var bgB: CGFloat = 0
        var bgA: CGFloat = 0
        
        var fgR: CGFloat = 0
        var fgG: CGFloat = 0
        var fgB: CGFloat = 0
        var fgA: CGFloat = 0
        
        self.getRed(&bgR, green: &bgG, blue: &bgB, alpha: &bgA)
        overlay.getRed(&fgR, green: &fgG, blue: &fgB, alpha: &fgA)
        
        let r = fgA * fgR + (1 - fgA) * bgR
        let g = fgA * fgG + (1 - fgA) * bgG
        let b = fgA * fgB + (1 - fgA) * bgB
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }

}

private extension String {
    
    mutating func removeHashIfNecessary() {
        if hasPrefix("#") {
            self = replacingOccurrences(of: "#", with: "")
        }
    }
}

