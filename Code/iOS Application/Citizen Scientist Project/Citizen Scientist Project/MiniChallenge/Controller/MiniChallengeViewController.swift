//
//  MiniChallengeViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/29/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit
import StoreKit

class MiniChallengeViewController: UIViewController, SKStoreProductViewControllerDelegate {

    // Create a store product view controller.
    var storeProductViewController = SKStoreProductViewController()
    
    @IBOutlet weak var iNaturalistDownloadView: iNaturalistDownloadView!
    @IBOutlet weak var iNaturalistVimeoTutorialView: iNaturalistVimeoTutorialView!
    
    @IBOutlet var miniChallengeView: MiniChallengeView!
   
    let miniChallengeContent = MiniChallengeContentManager.fetchContent()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeProductViewController.delegate = self
        
        miniChallengeView.setUp(content: miniChallengeContent)
        
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
    }
    
    
    @IBAction func clickDownloadiNaturalistAppButton(_ sender: UIButton) {
        
        // Create a product dictionary using the App Store's iTunes identifer.
        let parametersDict = [SKStoreProductParameterITunesItemIdentifier: miniChallengeContent.downloadiNaturalist.scheme!]
        
        /* Attempt to load it, present the store product view controller if success
         and print an error message, otherwise. */
        storeProductViewController.loadProduct(withParameters: parametersDict, completionBlock: { (status: Bool, error: Error?) -> Void in
            if status {
                self.present(self.storeProductViewController, animated: true, completion: nil)
                return
            }
            else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }}})
        
        
        // App Store URL. Attempt to open application link using user's default web-browser
        let appStoreLink = miniChallengeContent.downloadiNaturalist.page

        /* First create a URL, then check whether there is an installed app that can
         open it on the device. */
        if let url = URL(string: appStoreLink), UIApplication.shared.canOpenURL(url) {
            // Attempt to open the URL.
            UIApplication.shared.open(url, options: [:], completionHandler: {(success: Bool) in
                if success {
                    print("Launching \(url) was successful")
                }})
        }
        
        
    }
    
    @IBAction func clickMakeAnObservationButton(_ sender: UIButton) {
        UIApplication.shared.open(miniChallengeContent.makeAnObservation.url, options: [:], completionHandler: nil)
    }
    @IBAction func clickRegisterOnlineButton(_ sender: UIButton) {
        UIApplication.shared.open(miniChallengeContent.registerOnline.url, options: [:], completionHandler: nil)
    }
    
    
    
    // MARK: - iNaturalist Download Steps & Vimeo Tutorial Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showiNaturalistDownloadStepsPageVC{
            if let iNaturalistDownloadStepPageVC = segue.destination as? iNaturalistDownloadStepsPageViewController{
                iNaturalistDownloadStepPageVC.pageViewControllerDelegate = iNaturalistDownloadView
            }
        }
        
        if segue.identifier == Storyboard.showiNaturalistVimeoTutorialPageVC{
            if let iNaturalistVimeoTutorialPageVC = segue.destination as? iNaturalistVimeoTutorialsPageViewController{
                iNaturalistVimeoTutorialPageVC.pageViewControllerDelegate = iNaturalistVimeoTutorialView
            }
        }
        
    }
    
    // Let's dismiss the presented store product view controller.
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        viewController.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
