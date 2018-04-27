//
//  AboutUsGetInvolvedPageViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/24/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class AboutUsGetInvolvedPageViewController: UIPageViewController {

    let getInvolvedContent: [AboutUsGetInvolvedContent] = AboutUsContentManager.fetchGetInvolvedContent()
    
    weak var pageViewControllerDelegate: HorizontalPageViewControllerDelegate?
    
    lazy var controllers: [UIViewController] = {
        let storyboard = UIStoryboard(name: Storyboard.AboutUs, bundle: nil)
        var controllers = [UIViewController]()
        
        
        for _ in getInvolvedContent {
            let aboutUsGetInvolvedVC = storyboard.instantiateViewController(withIdentifier: Storyboard.AboutUsGetInvolvedViewController)
            controllers.append(aboutUsGetInvolvedVC)
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
                if let aboutUsGetInvolvedVC = viewController as? AboutUsGetInvolvedViewController{
                    aboutUsGetInvolvedVC.image = self.getInvolvedContent[index].imageName
                    aboutUsGetInvolvedVC.title = self.getInvolvedContent[index].title
                    aboutUsGetInvolvedVC.text = self.getInvolvedContent[index].text
                    aboutUsGetInvolvedVC.button = self.getInvolvedContent[index].button
                    
                    self.pageViewControllerDelegate?.turnPageController(to: index)
                }
            }
        }
    }

}


// MARK: - UIPageViewControllerDataSource

extension AboutUsGetInvolvedPageViewController: UIPageViewControllerDataSource {
    
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

extension AboutUsGetInvolvedPageViewController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.configureDisplaying(viewController: pendingViewControllers.first as! AboutUsGetInvolvedViewController)
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed{
            self.configureDisplaying(viewController: previousViewControllers.first as! AboutUsGetInvolvedViewController)
        }
    }
}
