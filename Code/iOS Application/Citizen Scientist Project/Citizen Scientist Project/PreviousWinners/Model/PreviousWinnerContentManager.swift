//
//  PreviousWinnerContentManager.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/18/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

class PreviousWinnersContentManager {
    
    class func fetchContent() -> PreviousWinnersContent {
        let bodyText = "The 2016-2017 Key Challenge has been our biggest year yet!  Nearly 1000 students participated from all the Key schools and submitted amazing work in all categories."
        + "\n\n" +
        "Our theme this year was water quality and shoreline conservation, in line with our EPA grant for environmental education, \"Establishing the stewardship methodology to ensure the longterm health of shoreline waters of a developed barrier island.\""
        + "\n\n" +
        "We encouraged students to look closer at the aquatic environments around them and discover not only what makes Key Biscayne’s ecology unique, but also to develop interest and excitement about the different facets of our unique environment."
        + "\n\n" +
        "We had a total of 45 prize-winning entries by classes, groups, and individuals, ranging from Pre-K to 11th Grade."
        + "\n\n" +
        "Congratulations to everyone that participated!"
        return PreviousWinnersContent(headerImageName: "previous-winners-header-image", headerLabel: "CONGRATULATIONS TO OUR 2016-17 WINNERS", winnersImageName: "key-challenge-winners", bodyText: bodyText)
    }
}
