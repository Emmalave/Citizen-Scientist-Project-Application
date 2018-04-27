//
//  KeyChallengeContentManager.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/18/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation
import UIKit


class KeyChallengeContentManager {
    
    class func fetchContent() -> KeyChallengeContent {
        
        let bodyText1 = "The Citizen Scientist Project of the Key Biscayne Community Foundation and the Village of Key Biscayne sponsor the Key Challenge. Following the example of The Fairchild Challenge and its wider audience and area of concern, the Key Challenge is an island-wide initiative directed at increasing student’s appreciation and knowledge of the island’s natural resources."
        + "\n\n" +
        "The Challenge incorporates 4 disciplines – art, writing, informatics, and science. These disciplines are further broken down into individual and/or group challenges open to various grade levels."
        
        let bodyText2 = "The Challenge starts on September 27, 2017. Registration must be completed by November 10, 2017. And, the Key Challenge concludes on March 31, 2018. Awards will be announced on April 19, 2018. Each individual/ group challenge will be judged by grade groupings. Grades are separated by the following breakdown: Pre-K, Kindergarten and First grade (K), Second and Third grades (3), Fourth and Fifth grades (5), Sixth through Eighth grades (M), Ninth and Tenth grades (H1), Eleventh and Twelfth grades (H2)."
        + "\n\n" +
        "There is also an At-Home category to each of these age groups. Students who are Key Biscayne residents may provide an entry even if their teacher and/or school is not participating in the Key Challenge. Only those projects listed in this brochure which are marked with an asterisk (*) can be entered in the At-Home category."
        + "\n\n" +
        "NEW! This Year’s Key Challenge theme will revolve around Human Impact. The Citizen Science Project is proud to be the recipient of a grant from the Environmental Protection Agency for the purpose of ensuring long term health of shoreline waters of Key Biscayne."
        + "\n\n" +
        "As such, it is important to remember that humans have a major impact on all environments, and that aquatic and shoreline environments in particular have been critical to Key Biscayne’s development and history. We will therefore be focusing our challenges broadly on human impacts on these important environments."
        
        let bodyText5 = "This year’s Key Challenge theme will revolve around Human Impact. The Citizen Science Project is proud to be the recipient of a grant from the Environmental Protection Agency for the purpose of ensuring long term health of shoreline waters of Key Biscayne. As such, it is important to remember that humans have a major impact on all environments, and that aquatic and shoreline environments in particular have been critical to Key Biscayne’s development and history. We will therefore be focusing our challenges broadly on human impacts on these important environments."
        + "\n\n" +
        "The Citizen Scientist Project’s Key Challenge is sponsored by the Key Biscayne Community Foundation, the Village of Key Biscayne, the Fairchild Tropical Botanic Garden, the University of Miami Rosenstiel School of Marine & Atmospheric Science, and the Knight Foundation."
        
        return KeyChallengeContent(
            headerImageName: "key-challenge-1",
            headerLabel1: "THE 2017-18 KEY CHALLENGE LAUNCHES & REGISTRATION OPENS ON SEPTEMBER 27, 2017. REGISTRATION MUST BE COMPLETED BY NOVEMBER 10, 2017.",
            viewKeyChallengeWinners: "VIEW THE 2016-17 KEY CHALLENGE WINNERS",
            headerLabel2: "WELCOME TO THE 2017-18 KEY CHALLENGE: HUMAN IMPACT",
            bodyText1: bodyText1,
            reefImageName: "key-challenge-barnacle",
            bodyText2: bodyText2,
            headerLabel3: "MINI CHALLENGE #2",
            bodyText3: "With advances in technology and more games and apps to keep our minds occupied, we are spending less time noticing the world around us. Combining technology and environmentalism is new technique that allows people to not just live in the world, but to see it and experience their environment as well.",
            learnMoreMiniChallenge: "LEARN MORE",
            headerLabel4: "THE 2017-18 PROGRAM",
            downloadKeyChallengeProgram: Link(text: "Download the 2017-18 Key Challenge program.", url: URL(string: "https://www.keyscience.org/wp-content/uploads/2017/02/kc-2017-brochure-FINAL-WEB.pdf")!),
            issuuImageLink: ImageLink(imageName: "key-challenge-prezi", link: Link(url: URL(string: "https://issuu.com/kbcf/docs/kc-2017-brochure-final-web")!)),
            headerLabel5: "KEY CHALLENGE REGISTRATION CAN ONLY BE COMPLETED ONLINE",
            learnMoreRegistration: Link(text: "LEARN MORE", url: URL(string: "https://www.keyscience.org/projects/key-challenge/")!),
            headerLabel6: "REGISTERED & READY TO PARTICIPATE? HERE ARE THE 2017-18 KEY CHALLENGE PROJECTS",
            bodyText4: "The Citizen Scientist Project’s goal is to secure a future Key Biscayne characterized by the same bounty of natural resources that exist today, thus maintaining the title of “Island Paradise,” while the Key Biscayne Citizen Scientist Lab provides a place to record and organize your findings in and around our island and to learn more about our island.",
            garbageImageName: "key-challenge-pollution",
            bodyText5: bodyText5,
            logoImageName: "foundation-key-logos"
        )
    }
}
