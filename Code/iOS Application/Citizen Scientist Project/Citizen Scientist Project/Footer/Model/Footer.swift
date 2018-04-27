//
//  SectionFooter.swift
//  Citizen Scientist Project
//
//  Created by David Gonzalez on 2/9/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

struct FooterSection {
    var title: String?
}


enum FooterIcon: String {
    case Facebook = "facebook-footer-icon"
    case Twitter = "twitter-footer-icon"
    case GooglePlus = "google-footer-icon"
    case Youtube = "youtube-footer-icon"
    case Instagram = "instagram-footer-icon"
}

class Footer {
    
    class func fetchData() -> FooterSection
    {
        var footerSection = FooterSection()
        
        footerSection.title = "KEY BISCAYNE COMMUNITY FOUNDATION"
        
        return footerSection
    }
}
