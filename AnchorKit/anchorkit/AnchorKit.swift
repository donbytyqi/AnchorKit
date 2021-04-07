/*
 
 This is an old extension I wrote mostly to deal with the fact that I always forget to set 'translatesAutoresizingMaskIntoConstraints' to false, although it also simplifies the autolayout constraints a bit and removes clutter.
 
 */

import UIKit

extension Array {
    
    // hacky way but it gets the job done
    func getDuplicateAnchors() -> [String] {
        
        var items = [String: Int]()
        var array = [String]()
        
        for i in self {
            if let anchor = i as? AnchorLayoutConstraint {
                if items[anchor.name] == nil {
                    items[anchor.name] = 1
                } else {
                    items[anchor.name]! += 1
                    if !array.contains(anchor.name) {
                        array.append(anchor.name)
                    }
                }
            }
        }
        
        return array
    }
    
}

extension UIView {
    
    fileprivate func disableAutoresizingIntoConstraints() {
        if self.translatesAutoresizingMaskIntoConstraints {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func hasDuplicateConstraints() -> Bool {
        let duplicateAnchors = constraints.getDuplicateAnchors()
        
        if duplicateAnchors.count > 0 {
            print("Please remove the following duplicate anchors: \(duplicateAnchors.joined(separator: ","))")
        }
        
        return duplicateAnchors.count > 0
    }
    
    func addAnchors(with constraints: [AnchorLayoutConstraint]) {
        
        guard !hasDuplicateConstraints() else { return }
        
        constraints.forEach({
            activate(anchor: $0, for: self)
        })
        
    }
    
    func activate(anchor: AnchorLayoutConstraint, for view: UIView) {
        switch anchor {
        case .centerY(to: let to, let constant):
            view.pinCenterY(to: to, constant: constant)
        case .centerX(to: let to, let constant):
            view.pinCenterX(to: to, constant: constant)
        case .top(to: let to, let constant):
            view.pinTop(to: to, constant: constant)
        case .left(to: let to, let constant):
            view.pinLeft(to: to, constant: constant)
        case .bottom(to: let to, let constant):
            view.pinBottom(to: to, constant: constant)
        case .right(to: let to, let constant):
            view.pinRight(to: to, constant: constant)
        case .width(constant: let constant, let to):
            if to != nil {
                view.pinWidth(to: to!, constant: constant)
            } else {
                view.setWidth(to: constant)
            }
        case .height(constant: let constant, let to):
            if to != nil {
                view.pinHeight(to: to!, constant: constant)
            } else {
                view.setHeight(to: constant)
            }
            
        case .size(let size):
            view.setWidth(to: size.width)
            view.setHeight(to: size.height)
        }
    }
    
    func pinTop(to: NSLayoutYAxisAnchor, constant: CGFloat) {
        disableAutoresizingIntoConstraints()
        self.topAnchor.constraint(equalTo: to, constant: constant).isActive = true
    }
    
    func pinBottom(to: NSLayoutYAxisAnchor, constant: CGFloat) {
        disableAutoresizingIntoConstraints()
        self.bottomAnchor.constraint(equalTo: to, constant: constant).isActive = true
    }
    
    func pinLeft(to: NSLayoutXAxisAnchor, constant: CGFloat) {
        disableAutoresizingIntoConstraints()
        self.leftAnchor.constraint(equalTo: to, constant: constant).isActive = true
    }
    
    func pinRight(to: NSLayoutXAxisAnchor, constant: CGFloat) {
        disableAutoresizingIntoConstraints()
        self.rightAnchor.constraint(equalTo: to, constant: constant).isActive = true
    }
    
    func pinCenterY(to: NSLayoutYAxisAnchor, constant: CGFloat) {
        disableAutoresizingIntoConstraints()
        self.centerYAnchor.constraint(equalTo: to, constant: constant).isActive = true
    }
    
    func pinCenterX(to: NSLayoutXAxisAnchor, constant: CGFloat) {
        disableAutoresizingIntoConstraints()
        self.centerXAnchor.constraint(equalTo: to, constant: constant).isActive = true
    }
    
    func pinWidth(to: NSLayoutDimension, constant: CGFloat = 0.0) {
        disableAutoresizingIntoConstraints()
        self.widthAnchor.constraint(equalTo: to, constant: constant).isActive = true
    }
    
    func pinHeight(to: NSLayoutDimension, constant: CGFloat = 0.0) {
        disableAutoresizingIntoConstraints()
        self.heightAnchor.constraint(equalTo: to, constant: constant).isActive = true
    }
    
    func setHeight(to: CGFloat) {
        disableAutoresizingIntoConstraints()
        self.heightAnchor.constraint(equalToConstant: to).isActive = true
    }
    
    func setWidth(to: CGFloat) {
        disableAutoresizingIntoConstraints()
        self.widthAnchor.constraint(equalToConstant: to).isActive = true
    }
    
}
