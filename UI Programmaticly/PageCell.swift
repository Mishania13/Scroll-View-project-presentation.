//
//  PageCell.swift
//  UI Programmaticly
//
//  Created by Mr. Bear on 11.05.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    //MARK: View logic + elements create
    
    var page: Page? {
        didSet {
            guard let nonOptionalPage = page else {
                print ("can't unwrap page")
                return
            }
            //Image setting
            mainImageView.image = UIImage(named: nonOptionalPage.imageName)
            //Text label setting
            let paragraphStyle = NSMutableParagraphStyle()
                   paragraphStyle.alignment = .center
                   
            let attributedText = NSMutableAttributedString(string: nonOptionalPage.headerText, attributes:
                       [.font: UIFont.boldSystemFont(ofSize: 20),.foregroundColor: UIColor.black,
                        .paragraphStyle: paragraphStyle
                   ])
                   
                   attributedText.append(NSAttributedString(
                    string: "\n\n\(nonOptionalPage.bodyText)",
                       attributes:
                       [.font: UIFont.systemFont(ofSize: 15),
                        .foregroundColor: UIColor.gray,
                        .paragraphStyle: paragraphStyle
                   ]))
            
            descriptionTextView.attributedText = attributedText
        }
    }
    
    private var mainImageView: UIImageView = {
        
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
   private let descriptionTextView: UITextView = {
       
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.isEditable = false
        view.isScrollEnabled = false
        
        return view
    }()
    
    //MARK: - View setups
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(descriptionTextView)
        
        setupLayout()
    }
    
    private func setupLayout () {
        
        let topImageContainerView = UIView()
        
        addSubview(topImageContainerView)
        topImageContainerView.addSubview(mainImageView)

        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            topImageContainerView.widthAnchor.constraint(equalTo: widthAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
            topImageContainerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            mainImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            mainImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            mainImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.8),
            
            descriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: topImageContainerView.bounds.height/40),
            descriptionTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            descriptionTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
