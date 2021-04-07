import UIKit

extension AnchorLayoutConstraint: Equatable {
    static func == (lhs: AnchorLayoutConstraint, rhs: AnchorLayoutConstraint) -> Bool {
        return lhs.id == rhs.id
    }
}

enum AnchorLayoutConstraint: Hashable {
    
    case centerY(to: NSLayoutYAxisAnchor, constant: CGFloat = 0.0)
    case centerX(to: NSLayoutXAxisAnchor, constant: CGFloat = 0.0)
    case top(to: NSLayoutYAxisAnchor, constant: CGFloat = 0.0)
    case left(to: NSLayoutXAxisAnchor, constant: CGFloat = 0.0)
    case bottom(to: NSLayoutYAxisAnchor, constant: CGFloat = 0.0)
    case right(to: NSLayoutXAxisAnchor, constant: CGFloat = 0.0)
    case width(constant: CGFloat = 0.0, _ to: NSLayoutDimension? = nil)
    case height(constant: CGFloat = 0.0, _ to: NSLayoutDimension? = nil)
    case size(_ size: AnchorSize)
    
    var id: Int {
        switch self {
        case .centerY(to: _):
            return 1
        case .centerX(to: _):
            return 2
        case .top(to: _):
            return 3
        case .left(to: _):
            return 4
        case .bottom(to: _):
            return 5
        case .right(to: _):
            return 6
        case .width(constant: _, _):
            return 7
        case .height(constant: _, _):
            return 8
        case .size(_):
            return 9
        }
    }
    
    var name: String {
        switch self {
        case .centerY(to: _):
            return "centerY"
        case .centerX(to: _):
            return "centerX"
        case .top(to: _):
            return "top"
        case .left(to: _):
            return "left"
        case .bottom(to: _):
            return "bottom"
        case .right(to: _):
            return "right"
        case .width(constant: _, _):
            return "width"
        case .height(constant: _, _):
            return "height"
        case .size(_):
            return "size"
        }
    }
    
}
