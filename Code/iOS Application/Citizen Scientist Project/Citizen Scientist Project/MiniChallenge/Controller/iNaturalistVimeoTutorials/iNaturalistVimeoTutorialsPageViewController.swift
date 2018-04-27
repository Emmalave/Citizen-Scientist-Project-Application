//
//  iNaturalistVimeoTutorialsPageViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/30/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

protocol iNaturalistVimeoTutorialsPageVCDelegate: class {
    func setupPageController(numberOfPages: Int)
    func turnPageController(to index: Int)
}

class iNaturalistVimeoTutorialsPageViewController: UIPageViewController {

    var vimeoImages: [UIImage]?
    var iNaturalistVideoTitles: [String]?
    
    weak var pageViewControllerDelegate: iNaturalistVimeoTutorialsPageVCDelegate?
    
    let vimeoContent = iNaturalistContentManager.fetchVimeoContent()
    
    
    lazy var controllers: [UIViewController] = {
        let storyboard = UIStoryboard(name: Storyboard.MiniChallenge, bundle: nil)
        var controllers = [UIViewController]()
        
        
        for _ in vimeoContent {
            let iNaturalistVimeoTutorialVC = storyboard.instantiateViewController(withIdentifier: Storyboard.iNaturalistVimeoTutorialViewController)
            controllers.append(iNaturalistVimeoTutorialVC)
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
                if let iNaturalistVimeoTutorialVC = viewController as? iNaturalistVimeoTutorialViewController{
                    iNaturalistVimeoTutorialVC.image = self.vimeoContent[index].imageLink.imageName
                    iNaturalistVimeoTutorialVC.text = self.vimeoContent[index].imageLink.link.text
                    iNaturalistVimeoTutorialVC.link = self.vimeoContent[index].imageLink.link.url
                    self.pageViewControllerDelegate?.turnPageController(to: index)
                }
            }
        }
    }

}

// MARK: - UIPageViewControllerDataSource

extension iNaturalistVimeoTutorialsPageViewController: UIPageViewControllerDataSource {
    
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

extension iNaturalistVimeoTutorialsPageViewController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.configureDisplaying(viewController: pendingViewControllers.first as! iNaturalistVimeoTutorialViewController)
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed{
            self.configureDisplaying(viewController: previousViewControllers.first as! iNaturalistVimeoTutorialViewController)
        }
    }
}
