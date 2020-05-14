//
//  ViewController.swift
//  UI Programmaticly
//
//  Created by Mr. Bear on 11.05.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let container: UIStackView = {
        let view = UIStackView()
        view.tintColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        
        
        return view
    }()
    
    let button: UIButton = {
        let view = UIButton(type: .system)
        
        view.backgroundColor = .blue
        view.setTitle("sasa", for: .normal)
        view.addTarget(self, action: #selector(tapping), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .red
        
        view.addSubview(container)
        container.addSubview(button)
        container.addSubview(button)

        container.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/2)
        button.frame = CGRect(x: container.center.x, y: container.center.y, width: 100, height: 50)
    }
    
    @objc func tapping() {
        print("Tap tap tap")
    }
}

