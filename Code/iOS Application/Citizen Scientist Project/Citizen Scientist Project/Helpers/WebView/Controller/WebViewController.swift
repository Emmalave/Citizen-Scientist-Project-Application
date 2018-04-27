//
//  WebKitViewController.swift
//  Test
//
//  Created by David Gonzalez on 2/28/18.
//  Copyright © 2018 David Gonzalez. All rights reserved.
//

import UIKit

protocol WebViewControllerDelegate: class {
    func loadResource(resource: String, type: String)
}

class WebViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    
    static let segueId = "segueToWebView"
    //var urlRequest: URLRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
    }
}

extension WebViewController: WebViewControllerDelegate {
    
    func loadResource(resource: String, type: String)
    {
        let _ = self.view
        
        if let path = Bundle.main.path(forResource: resource, ofType: type){
            
            if let url = NSURL(string: path){
                let urlRequest = URLRequest(url: url as URL)
                webView.loadRequest(urlRequest)
            }
            
        }else {
            // TODO: show error popup w/ timer "File resource could not be loaded. File not found?"
            navigationController!.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}
