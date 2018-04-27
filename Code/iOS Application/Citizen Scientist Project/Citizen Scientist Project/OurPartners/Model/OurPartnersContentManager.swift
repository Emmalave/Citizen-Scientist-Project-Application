//
//  OurPartnersContentManager.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/27/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

class OurPartnersContentManager {
    
    class func fetchContent() -> OurPartnersContent {
        return OurPartnersContent(headerImageName: "partners-header", labelHeader1: "THE CITIZEN SCIENTIST PROJECT’S PARTNERS", bodyText1: "The Key Biscayne Citizen Scientist Project’s partners include Key Biscayne Community Foundation, Village of Key Biscayne, University of Miami Rosenstiel School of Marine and Atmospheric Science, Knight Foundation, The Fairchild Challenge, and Google Earth.", labelHeader2: "THE CITIZEN SCIENTIST PROJECT’S SPONSORS", bodyText2: "The Key Biscayne Citizen Scientist Project would like to thank & recognize our many program sponsors: Biscayne Bay Waterkeepers, Florida Park Service, The Islander News, KeyBis, Key Biscayne K-8 Center, Key Biscayne Magazine, Key Biscayne Chamber of Commerce, Key Biscayne Community Church Day School, Key Biscayne Presbyterian Church School, MAST Academy, Principals’ Coalition, Marjory Stoneman Douglas Biscayne Nature Center, St. Agnes Academy KB, and St. Christopher’s by the Sea.")
    }
    
    class func fetchFirstPartners() -> [OurPartnersCell] {
        resetPartnersId()
        return [
            OurPartnersCell(partner: ImageLink(imageName: "11-kbcf-logo-square-thegem-person-thegem-person", link: Link(url: URL(string: "http://www.kbcf.org/")!))),
            OurPartnersCell(partner: ImageLink(imageName: "12-village-logo-square-thegem-person-thegem-person", link: Link(url: URL(string: "http://keybiscayne.fl.gov/")!))),
            OurPartnersCell(partner: ImageLink(imageName: "13-um-rsmas-logo-thegem-person-thegem-person", link: Link(url: URL(string: "http://www.rsmas.miami.edu/")!))),
            OurPartnersCell(partner: ImageLink(imageName: "14-knight-foundation-logo-thegem-person-thegem-person", link: Link(url: URL(string: "http://www.knightfoundation.org/")!))),
        ]
    }
    
    class func fetchSecondPartners() -> [OurPartnersCell] {
        resetPartnersId()
        return [
            OurPartnersCell(partner: ImageLink(imageName: "21-biscayne-bay-waterkeeper-thegem-person", link: Link(url: URL(string: "https://www.keyscience.org/")!))),
            OurPartnersCell(partner: ImageLink(imageName: "22-fairchild-challenge-logo-thegem-person-thegem-person", link: Link(url: URL(string: "http://www.fairchildgarden.org/education/the-fairchild-challenge")!))),
            OurPartnersCell(partner: ImageLink(imageName: "23-florida-park-service-thegem-person", link: Link(url: URL(string: "https://www.floridastateparks.org/")!))),
            OurPartnersCell(partner: ImageLink(imageName: "24-the-islander-news-thegem-person", link: Link(url: URL(string: "http://www.islandernews.com/")!))),
            OurPartnersCell(partner: ImageLink(imageName: "25-keybis-thegem-person", link: Link(url: URL(string: "http://keybiscayneportal.com/")!))),
            OurPartnersCell(partner: ImageLink(imageName: "26-keybiscayne-k-8-center-thegem-person", link: Link(url: URL(string: "http://keybiscayne.dadeschools.net/")!))),
            OurPartnersCell(partner: ImageLink(imageName: "27-keybiscayne-magazine-thegem-person", link: Link(url: URL(string: "http://keybiscaynemag.com/")!))),
            OurPartnersCell(partner: ImageLink(imageName: "28-kb-chamber-of-commerce-thegem-person", link: Link(url: URL(string: "http://www.keybiscaynechamber.org/")!))),
            OurPartnersCell(partner: ImageLink(imageName: "29-kb-community-church-thegem-person", link: Link(url: URL(string: "http://www.kbccdayschool.com/")!))),
            OurPartnersCell(partner: ImageLink(imageName: "30-kb-presbyterian-school-thegem-person", link: Link(url: URL(string: "http://www.kbpcschool.org/")!))),
            OurPartnersCell(partner: ImageLink(imageName: "31-biscayne-nature-center-thegem-person", link: Link(url: URL(string: "http://www.biscaynenaturecenter.org/")!))),
            OurPartnersCell(partner: ImageLink(imageName: "32-mast-academy-thegem-person", link: Link(url: URL(string: "http://www.gomakos.org/")!))),
            OurPartnersCell(partner: ImageLink(imageName: "33-principals-coalition-thegem-person", link: Link(url: URL(string: "https://www.kbcf.org/programs/principals-coalition/")!))),
            OurPartnersCell(partner: ImageLink(imageName: "34-st-agnes-academy-thegem-person", link: Link(url: URL(string: "http://www.stakb.org/")!))),
            OurPartnersCell(partner: ImageLink(imageName: "35-st-christophers-by-the-sea-thegem-person", link: Link(url: URL(string: "http://www.stchriskb.org/")!))),
        ]
    }
    
    private struct IDHolder {
        static var id = 0
    }
    
    class private func nextPartnerId() -> Int{
        let id = IDHolder.id
        IDHolder.id += 1
        return id
    }
    
    class private func resetPartnersId() {
        IDHolder.id = 0
    }
}
