//
//  OurPartnersContent.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/27/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

struct OurPartnersContent {
    var headerImageName: String
    var labelHeader1: String
    var bodyText1: String
    var labelHeader2: String
    var bodyText2: String
}

enum Partners {
    case First
    case Second
}

struct OurPartnersCell {
    var partner: ImageLink
}


