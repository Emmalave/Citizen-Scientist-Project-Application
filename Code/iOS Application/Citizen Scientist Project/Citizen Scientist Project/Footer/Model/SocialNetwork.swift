//
//  SocialNetwork.swift
//  Citizen Scientist Project
//
//  Created by David Gonzalez on 2/9/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation
import UIKit

struct SocialNetworkUrl {
    let scheme: String
    let page: String
    
    func openPage() {
        ExternalAppManager.openPage(scheme: self.scheme, page: self.page)
    }
}

enum SocialNetwork {
    case Facebook, GooglePlus, Twitter, Instagram, YouTube
    func url() -> SocialNetworkUrl {
        switch self {
        case .Facebook: return SocialNetworkUrl(scheme: "fb://profile/281441965302293", page: "https://www.facebook.com/CitizenScientist")
        case .Twitter: return SocialNetworkUrl(scheme: "twitter:///user?screen_name=kbcfoundation1", page: "https://twitter.com/kbcfoundation1")
        case .GooglePlus: return SocialNetworkUrl(scheme: "gplus://plus.google.com/u/0/102610607563883245895", page: "https://plus.google.com/102610607563883245895")
        case .Instagram: return SocialNetworkUrl(scheme: "instagram://user?username=kbcitizenscience", page:"https://www.instagram.com/kbcitizenscience")
        case .YouTube: return SocialNetworkUrl(scheme: "youtube://www.youtube.com/channel/UCplpQu3cqOyS4Tylnk9llRQ", page:"https://www.youtube.com/channel/UCplpQu3cqOyS4Tylnk9llRQ")
        }
    }
    func openPage() {
        self.url().openPage()
    }
}
