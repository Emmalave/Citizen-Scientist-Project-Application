//
//  iNaturalistDownloadStepsViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/30/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

protocol iNaturalistDownloadStepsPageVCDelegate: class {
    func setupPageController(numberOfPages: Int)
    func turnPageController(to index: Int)
}

class iNaturalistDownloadStepsPageViewController: UIPageViewController {
    
    weak var pageViewControllerDelegate: iNaturalistDownloadStepsPageVCDelegate?
    
    let downloadContent = iNaturalistContentManager.fetchDownloadContent()
    
    lazy var controllers: [UIViewController] = {
        let storyboard = UIStoryboard(name: Storyboard.MiniChallenge, bundle: nil)
        var controllers = [UIViewController]()
        
        
        for _ in downloadContent {
            let iNaturalistDownloadStepVC = storyboard.instantiateViewController(withIdentifier: Storyboard.iNaturalistStepViewController)
            controllers.append(iNaturalistDownloadStepVC)
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
            if viewController === vc{
                if let iNaturalistImageVC = viewController as? iNaturalistDownloadStepViewController{
                    iNaturalistImageVC.image = self.downloadContent[index].imageName
                    iNaturalistImageVC.text = self.downloadContent[index].title
                    
                    self.pageViewControllerDelegate?.turnPageController(to: index)
                }
            }
        }
    }

}

// MARK: - UIPageViewControllerDataSource

extension iNaturalistDownloadStepsPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.index(of: viewController){
            if index > 0 { // if it is not the firt controller
                return controllers[index - 1] // previous controller
            }
        }
        return nil // does not wrap around
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.index(of: viewController){
            if index < controllers.count - 1 { // if it is not the last controller
                return controllers[index + 1] // next controller
            }
        }
        
        return nil // does not wrap around
    }
    
}

// MARK: - UIPageViewControllerDelegate

extension iNaturalistDownloadStepsPageViewController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.configureDisplaying(viewController: pendingViewControllers.first as! iNaturalistDownloadStepViewController)
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed{
            self.configureDisplaying(viewController: previousViewControllers.first as! iNaturalistDownloadStepViewController)
        }
    }
}
