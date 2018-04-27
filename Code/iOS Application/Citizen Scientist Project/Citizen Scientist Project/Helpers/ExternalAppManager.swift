//
//  ExternalApplicationManager.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/6/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation
import UIKit

struct ExternalApp {
    var title: String
    var scheme: String?
    var page: String
    
    init(title: String, scheme: String? = nil, page: String){
        self.title = title
        self.scheme = scheme
        self.page = page
    }
}

class ExternalAppManager {
    
    static func openPage(scheme: String? = nil, page: String) {
        openPage(scheme: scheme, page: NSURL(string: page)! as URL)
    }
    
    static func openPage(scheme: String? = nil, page: URL) {
        
        if let appScheme = scheme {
            if let schemeUrl = NSURL(string: appScheme){
                if UIApplication.shared.canOpenURL(schemeUrl as URL) {
                    // if application is found in the user phone, open application
                    UIApplication.shared.open(schemeUrl as URL, options: [:], completionHandler: nil)
                    return
                }
            }
        }
        
        // Openning application fail, attempt openning using default browser
        UIApplication.shared.open(page, options: [:], completionHandler: nil)
        
    }
}
