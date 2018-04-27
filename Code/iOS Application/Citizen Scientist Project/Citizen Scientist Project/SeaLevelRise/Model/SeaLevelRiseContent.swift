//
//  SeaLevelRise.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/6/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

struct SeaLevelRiseContent {
    var headerImageName: String
    var labelHeader1: String
    var bodyText1: String
    var preziImage: ImageLink
    var labelHeader2: String
    var bodyText2: String
    var surveyLink: Link?
    var surveyResource: FileResource?
    
    
    init(headerImageName: String, labelHeader1: String, bodyText1: String, preziImage: ImageLink, labelHeader2: String, bodyText2: String, surveyLink: Link? = nil, surveyResource: FileResource? = nil){
        
        self.headerImageName = headerImageName
        self.labelHeader1 = labelHeader1
        self.bodyText1 = bodyText1
        self.preziImage = preziImage
        self.labelHeader2 = labelHeader2
        self.bodyText2 = bodyText2
        self.surveyLink = surveyLink
        self.surveyResource = surveyResource
        
    }
}

