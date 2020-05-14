//
//  SwipingVC.swift
//  UI Programmaticly
//
//  Created by Mr. Bear on 11.05.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import UIKit
class SwipingVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [Page(imageName: "First", headerText: "Project idea", bodyText: "In this slide we must show main project idea"),
                 Page(imageName: "Second", headerText: "Strong sides", bodyText: "There we talk about idea strong sides"),
                 Page(imageName: "Third", headerText: "Customer motivation", bodyText: "Need show customer advantages of early birds"),
                 Page(imageName: "Fourth", headerText: "Thank for stay with us", bodyText: "Thank for you attention. Hope to see soon")]
 
    private let bottomControllContainer: UIStackView = {
        
        let view = UIStackView()
        view.distribution = .fillProportionally
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    } ()
    
    private let previousButton: UIButton = {
        
        let view = UIButton(type: .system)
        view.setTitle("PREV", for: .normal)
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        view.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(goToPrevPage), for: .touchUpInside)

        return view
    }()
    
    private let nextButton: UIButton = {
        
        let view = UIButton(type: .system)
        view.setTitle("NEXT", for: .normal)
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        view.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addTarget(self, action: #selector(goNextPage), for: .touchUpInside)
        
        return view
    }()

    
    private lazy var pageController: UIPageControl = {
        
        let view = UIPageControl()
        view.currentPage = 0
        view .numberOfPages = pages.count
        view.pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.currentPageIndicatorTintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        return view
    }()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(bottomControllContainer)
        
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellID")
        setUpBottomControll()

    }
    
//MARK:- Button funcs
    
    @objc private func goNextPage() {
        
        let nextIndex = min(pageController.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        collectionView.scrollToItem(at: indexPath,
                                    at: .centeredHorizontally,
                                    animated: true)
        pageController.currentPage = nextIndex
    }
    
    @objc private func goToPrevPage() {
          
          let nextIndex = max(pageController.currentPage - 1 , 0)
          let indexPath = IndexPath(item: nextIndex, section: 0)
          collectionView.scrollToItem(at: indexPath,
                                      at: .centeredHorizontally,
                                      animated: true)
          pageController.currentPage = nextIndex
      }
    
//    MARK: - View setup
    
    private func setUpBottomControll() {
          
           self.bottomControllContainer.addArrangedSubview(self.previousButton)
           self.bottomControllContainer.addArrangedSubview(self.pageController)
           self.bottomControllContainer.addArrangedSubview(self.nextButton)
        
       NSLayoutConstraint.activate([
        bottomControllContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        bottomControllContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        bottomControllContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        bottomControllContainer.heightAnchor.constraint(equalToConstant: 50)
        ])
       }
    
  //Scroll view setup
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        pageController.currentPage = Int(targetContentOffset.pointee.x/view.frame.width)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
