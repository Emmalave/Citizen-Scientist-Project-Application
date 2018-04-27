//
//  SeaLevelRiseContentManager.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/6/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

class SeaLevelRiseContentManager {
    
    class func fetchContent() -> SeaLevelRiseContent {
        
        let bodyText1 = "As an island community, the effects of changes in climate have special significance for the Village of Key Biscayne.  Issues such as flooding, salt water intrusion, and king tides already affect our community, and will worsen if we do not take action."
        + "\n\n" +
        "The Village of Key Biscayne and the Key Biscayne Community Foundation are working with Coastal Risk Consulting, Inc. in order to map the affected areas and create a strategy to protect our investments on Key Biscayne by being prepared for changes in sea level and weather patterns."
        let bodyText2 = "We have also gathered input from the general public in the form of a survey and two Townhall Community Forums. View the Sea Level Rise Survey results here:"
        
        let surveyResource = FileResource(text: "Survey Results", resource: "Survey-Results-2-6-2017", fileType: .PDF)
        let surveyLink = Link(text: "Survey Results", url: URL(string: "https://www.keyscience.org/wp-content/uploads/2017/02/Survey-Results-2-6-2017.pdf")!)
        
        let preziLink = Link(text: "Survey Results", url: URL(string: "https://prezi.com/embed/cj5dj1zp9ujg/?bgcolor=ffffff&lock_to_path=0&autoplay=0&autohide_ctrls=0&landing_data=bHVZZmNaNDBIWnNjdEVENDRhZDFNZGNIUE43MHdLNWpsdFJLb2ZHanI5aEFub3ZObExNbWNaSVR1b1JYZGJMTVFBPT0&landing_sign=-Wwf32H6Hg-0vgwKlb7IbvFkJefHCjRWxICXzd2tyI0")!)
        let preziImage = ImageLink(imageName: "prezi-sea-level-rise", link: preziLink)
        
        
        let seaLevelRiseContent = SeaLevelRiseContent(headerImageName: "sea-level-rise", labelHeader1: "SEA LEVEL RISE", bodyText1: bodyText1, preziImage: preziImage, labelHeader2: "PUBLIC SURVEY ON SEA LEVEL RISE", bodyText2: bodyText2, surveyLink: surveyLink, surveyResource: surveyResource)
        
        return seaLevelRiseContent
    }
}
