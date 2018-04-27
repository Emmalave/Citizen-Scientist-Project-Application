//
//  AboutUsExplorePageViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/24/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

//TODO: reuse this in all pages that implement horizontal sliders
protocol HorizontalPageViewControllerDelegate: class {
    func setupPageController(numberOfPages: Int)
    func turnPageController(to index: Int)
}

class AboutUsExplorePageViewController: UIPageViewController {

    let exploreContent: [AboutUsExploreContent] = AboutUsContentManager.fetchExploreContent()
    
    weak var pageViewControllerDelegate: HorizontalPageViewControllerDelegate?
    
    lazy var controllers: [UIViewController] = {
        let storyboard = UIStoryboard(name: Storyboard.AboutUs, bundle: nil)
        var controllers = [UIViewController]()
        
        
        for _ in exploreContent {
            let aboutUsExploreVC = storyboard.instantiateViewController(withIdentifier: Storyboard.AboutUsExploreViewController)
            controllers.append(aboutUsExploreVC)
        }
        
        
        self.pageViewControllerDelegate?.setupPageController(numberOfPages: controllers.count)
        
        return controllers
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        dataSource = self
        delegate = self
        
        self.turnToPage(index: 0)
    }
    
    func turnToPage(index: Int){
        let controller = controllers[index]
        var direction = UIPageViewControllerNavigationDirection.forward
        
        if let currentVC = viewControllers?.first{
            let currentIndex = controllers.index(of: currentVC)!
            if currentIndex > index {
                direction = .reverse
            }
        }
        
        self.configureDisplaying(viewController: controller)
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
    }
    
    func configureDisplaying(viewController: UIViewController){
        for (index, vc) in controllers.enumerated(){
            if viewController === vc {
                if let aboutUsExploreVC = viewController as? AboutUsExploreViewController{
                    aboutUsExploreVC.image = self.exploreContent[index].imageName
                    aboutUsExploreVC.title = self.exploreContent[index].title
                    aboutUsExploreVC.text = self.exploreContent[index].text
                    
                    self.pageViewControllerDelegate?.turnPageController(to: index)
                }
            }
        }
    }

}


// MARK: - UIPageViewControllerDataSource

extension AboutUsExplorePageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.index(of: viewController){
            if index > 0 { // if it is not the firt controller
                return controllers[index - 1] // previous controller
            }
        }
        return controllers.last // wraps around to last view controller
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.index(of: viewController){
            if index < controllers.count - 1 { // if it is not the last controller
                return controllers[index + 1] // next controller
            }
        }
        
        return controllers.first // wraps around to first view controller
    }
    
}


// MARK: - UIPageViewControllerDelegate

extension AboutUsExplorePageViewController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.configureDisplaying(viewController: pendingViewControllers.first as! AboutUsExploreViewController)
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed{
            self.configureDisplaying(viewController: previousViewControllers.first as! AboutUsExploreViewController)
        }
    }
}
