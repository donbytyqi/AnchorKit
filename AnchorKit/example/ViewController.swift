//
//  ViewController.swift
//  AnchorKit
//
//  Created by Don Bytyqi on 10.3.21.
//

import UIKit

class ViewController: UIViewController {
    
    private let redView: UIView = {
        let rv = UIView()
        rv.backgroundColor = .red
        return rv
    }()
    
    private let blueView: UIView = {
        let rv = UIView()
        rv.backgroundColor = .blue
        return rv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(redView)
        view.addSubview(blueView)
        
        redView.addAnchors(with: [.top(to: view.safeAreaLayoutGuide.topAnchor, constant: 0), .centerX(to: view.centerXAnchor, constant: 0), .size(.init(width: 50, height: 50))])
        blueView.addAnchors(with: [.top(to: redView.bottomAnchor, constant: 16), .width(constant: 50), .height(constant: 50), .centerX(to: redView.centerXAnchor, constant: 0)])
        
    }

}

