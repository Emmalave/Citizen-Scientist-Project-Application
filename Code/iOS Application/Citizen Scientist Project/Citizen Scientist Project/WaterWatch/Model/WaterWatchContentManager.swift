//
//  WaterWatchContentManager.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/9/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

class WaterWatchContentManager {
    
    class func fetchContentData() -> WaterWatchContent{
        return getContentData()
    }
    
    private static let bodyText1 =
        "Biscayne Bay Water Watch (BBWW) is a community-based volunteer water quality monitoring program developed and managed by the UF/IFAS Sea Grant Extension Program in Miami-Dade County. The goal of BBWW is to garner attention to the health of Biscayne Bay and promote awareness about the importance of water quality on our local environment and economy."
            + "\n\n" +
            "UF/IFAS Sea Grant Extension is partnering with local organizations to adopt water monitoring sites throughout Biscayne Bay and surrounding waters. Their volunteers are trained to collect chemical and physical parameters once a month at their adopted site(s). Field-based data includes temperature, pH, salinity, and dissolved oxygen. Water samples are collected for analysis of total nitrogen, total phosphorus, ammonia, silica, and chlorophyll a."
            + "\n\n" +
            "The Key Biscayne Community Foundation (through the Citizen Science Project) received a two-year Environmental Education grant from the EPA for water quality and shoreline conservation on Key Biscayne. We are using this grant not only to create educational opportunities for the residents and visitors of the Key, but also to set up more water testing sites. In 2017, we’re sponsoring the first year of a new site near Bear Cut, where one of our partners, Miami Rowing Club, will begin monthly water testing starting in March."
            + "\n\n" +
    "We also hope to set up three Atlantic sites for less intense testing which will include temperature, pH, salinity, and dissolved oxygen."
    
    private static let bodyText2 = "Here are some fact sheets from the Biscayne Bay Water Watch to better understand the following data being collected and reported."
    
    private static let DataMap: Dictionary<String, Any> = [
        "imageName" : "water-watch",
        "labelHeader1" : "BISCAYNE BAY WATER WATCH",
        "biscayneBayLogoImageName" : "key-biscayne-water-watch-logo",
        "bodyText1" : bodyText1,
        "labelHeader2" : "FACT SHEETS",
        "bodyText2" : bodyText2,
        "learnMore" : Link(text: "Learn more about the Biscayne Bay Water Watch.", url: URL(string: "http://sfyl.ifas.ufl.edu/miami-dade/natural-resources/biscayne-bay-water-watch-/")!),
        "dissolvedOxygen" : Link(text: "Dissolved Oxygen", url: URL(string: "http://sfyl.ifas.ufl.edu/media/sfylifasufledu/miami-dade/documents/sea-grant/Dissolved-Oxygen.pdf")!),
        "nutrients" : Link(text: "Nutrients", url: URL(string: "http://sfyl.ifas.ufl.edu/media/sfylifasufledu/miami-dade/documents/sea-grant/Nutrients.pdf")!),
        "chlorophyllA" : Link(text: "Chlorophyll a", url: URL(string: "http://sfyl.ifas.ufl.edu/media/sfylifasufledu/miami-dade/documents/sea-grant/Chlorophyll-a.pdf")!),
        ]
    
    private class func getContentData() -> WaterWatchContent
    {
        let contentData = WaterWatchContent(
            imageName: DataMap["imageName"] as! String,
            headerLabel1: DataMap["labelHeader1"] as! String,
            biscayneBayLogoImageName: DataMap["biscayneBayLogoImageName"] as! String,
            bodyText1: DataMap["bodyText1"] as! String,
            headerLabel2: DataMap["labelHeader2"] as! String,
            bodyText2: DataMap["bodyText2"] as! String,
            learnMore: DataMap["learnMore"] as! Link,
            dissolvedOxygen: DataMap["dissolvedOxygen"] as! Link,
            nutrients: DataMap["nutrients"] as! Link,
            chlorophyllA: DataMap["chlorophyllA"] as! Link
        )
        
        return contentData
    }
}

