//
//  iNaturalistContentManager.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/9/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

class iNaturalistContentManager {
    
    class func fetchDownloadContent() -> [iNaturalistDownloadContent] {
        var downloadContent = [iNaturalistDownloadContent]()
        
        downloadContent.append(iNaturalistDownloadContent(imageName: "iphone-icon", title: "1. DOWNLOAD THE iNATURALIST APP AND CREATE AN ACCOUNT."))
        downloadContent.append(iNaturalistDownloadContent(imageName: "search-icon", title: "2. SEARCH iNATURALIST PROJECTS FOR “2017-18 MINI CHALLENGE #2” AND JOIN THE PROJECT."))
        downloadContent.append(iNaturalistDownloadContent(imageName: "camera-icon", title: "3. WHILE MAKING YOUR OBSERVATIONS, ADD THEM TO THE “2017-18 MINI CHALLENGE #2” PROJECT."))
        
        return downloadContent
    }
    
    
    class func fetchVimeoContent() -> [iNaturalistVimeoContent] {
        var vimeoContent = [iNaturalistVimeoContent]()
        
        vimeoContent.append(iNaturalistVimeoContent(imageLink: ImageLink(imageName: "vimeo-1", link: Link(text: "MAKING AN OBSERVATION ON A MOBILE DEVICE", url: URL(string: "https://vimeo.com/162581545")!))))
        vimeoContent.append(iNaturalistVimeoContent(imageLink: ImageLink(imageName: "vimeo-2", link: Link(text: "ADDING AN OBSERVATION VIA THE WEB", url: URL(string: "https://vimeo.com/167431843")!))))
        vimeoContent.append(iNaturalistVimeoContent(imageLink: ImageLink(imageName: "vimeo-3", link: Link(text: "HOW TO TAKE IDENTIFIABLE PHOTOS", url: URL(string: "https://vimeo.com/167341998")!))))
        
        return vimeoContent
    }
}
