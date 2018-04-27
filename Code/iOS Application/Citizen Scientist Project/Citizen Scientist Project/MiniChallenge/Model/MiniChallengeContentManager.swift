//
//  MiniChallengeContentManager.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/9/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation


class MiniChallengeContentManager {
    
    class func fetchContent() -> MiniChallengeContent {
        
        let bodyText1 = "The 2017-18 Mini Challenge #2 focuses on iNaturalist Species observations. To participate, register below and then download the iNaturalist app to add observations to our iNaturalist project."
        
        let bodyText2 = "Florida is host to thousands of species of plants and animals.  Some of them are unique just to this region of the country, while some are nonnative or invasive, having been introduced from other countries."
        + "\n\n" +
        "Many of us are familiar with the more visible species: natives like turtles, manatees, green anoles, and mangroves, and nonnatives like iguanas, brown anoles, Burmese pythons, and Australian pine.  However, there are thousands more that go unnoticed in our everyday lives. With advances in technology and more games and apps to keep our minds occupied, we are spending less time noticing the world around us.  Combining technology and environmentalism is new technique that allows people to not just live in the world, but to see it and experience their environment as well."
        
        let bodyText3 = "The 2017-18 Mini Challenge #2 focuses on iNaturalist Species observations. To participate, register below and then download the iNaturalist app (iPhone and Android). Once your account is setup, you will need to search for the “2017-18 Mini Challenge #2” project to find and join the project. When posting your observations, you can add your observations to the project via the Projects button typically located just above the Save button."
        
        let bodyText4 = "• The Mini Challenge will run from February 15, 2018 through March 14, 2018"
        + "\n\n" +
        "• The Mini Challenge involves observing, photographing, and identifying organisms using iNaturalist."
        + "\n\n" +
        "• The goal is to identify the largest number of organisms and most species. Two awards will be given out: (1) One for the most total observations; and (2) One for most number of different species observed."
        + "\n\n" +
        "• The observations must be made on Virginia Key or Key Biscayne. Observations made outside Virginia Key or Key Biscayne will not be counted! Observations can be made in the parks on the Keys (i.e. Crandon, Bill Baggs, Virginia Key Park), in Key Biscayne municipality, or offshore of either island (as long as it is not too far that it can be confused for another coast)."
        + "\n\n" +
        "• In order to participate in the mini challenge, you must register online and provide the following information: iNaturalist username, Your full name (if participating as an individual), School name, Grade, Teacher’s name, and Whether you are participating as an individual or as a class."
        + "\n\n" +
        "• Entire classes may participate in the challenge by having their teacher manage an iNaturalist account for the whole class. This may be better for younger classes, especially if the children in younger classes do not have phones. Individual students may also participate in the mini challenge by using their own iNaturalist accounts. Classes with older students will probably be better suited for participating in this manner. However, either way of participating is acceptable for all grades. Please be sure to note on the registration form if you are participating as an individual or a class."
        + "\n\n" +
        "• Registration must be submitted by February 22, 2018."
        + "\n\n" +
        "• Tutorials on how to use iNaturalist will be uploaded online. If you have any questions or concerns, please contact us."
        + "\n\n" +
        "• Make sure photographs are clear. Unclear photos will be difficult to identify"
        
        let downloadiNaturalist = ExternalApp(title: "Download iNaturalist", scheme: "421397028", page: "https://itunes.apple.com/us/app/inaturalist/id421397028")
        
        let makeAnObservation = Link(text: "Make an Observation", url: URL(string: "https://www.inaturalist.org/projects/2017-18-mini-challenge-2")!)
        
        let registerOnline = Link(text: "Register Online", url: URL(string: "https://www.keyscience.org/projects/key-challenge/mini/")!)
        
        let content = MiniChallengeContent(imageName: "mini-challenge-header", headerLabel1: "2017-18 MINI CHALLENGE #2", bodyText1: bodyText1, downloadiNaturalist: downloadiNaturalist, bodyText2: bodyText2, makeAnObservation: makeAnObservation, headerLabel2: "GETTING STARTED WITH THE MINI-CHALLENGE & iNATURALIST", bodyText3: bodyText3, headerLabel3: "NEED HELP WITH iNATURALIST? CHECK OUT THESE TUTORIALS FROM iNATURALIST", headerLabel4: "2017-18 MINI CHALLENGE #2 RULES", bodyText4: bodyText4, registerOnline: registerOnline)
        
        return content
    }
}
