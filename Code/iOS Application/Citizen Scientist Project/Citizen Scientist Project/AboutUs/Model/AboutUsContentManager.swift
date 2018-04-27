//
//  AboutUsContentManager.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/24/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

class AboutUsContentManager {
    class func fetchContent() -> AboutUsContent? {
        return nil
    }
    
    class func fetchExploreContent() -> [AboutUsExploreContent] {
        
        let exploreContent = [
            
            AboutUsExploreContent(imageName: "about-us-lab-learn", title: "LEARN ABOUT KEY BISCAYNE", text: "Learn about the mature and wildlife of Key Biscayne with these articles written and compiled by scientists, professionals, and student interns from University of Miami Rosenstiel School of Marine and Atmospheric Science."),
            
            AboutUsExploreContent(imageName: "about-us-lab-explore", title: "EXPLORE KEY BISCAYNE", text: "Virtually explore Key Biscayne and the surrounding area with our interactive maps highlighting each of our seven resources: Beaches, Coral Reefs Green Spaces, Mangroves, Pathways, Seagrasses, and Waterways."),
            
            AboutUsExploreContent(imageName: "about-us-lab-record", title: "RECORD YOUR FINDINGS", text: "Record your findings by uploading your photographs of Key Biscayne nature and wildlife; submitting answers to our Relevant Environmental Questions; and/or sharing your bird sighting observations via our Bird Recorder."),
            
            AboutUsExploreContent(imageName: "about-us-lab-review", title: "REVIEW THE OBSERVATIONS", text: "Review all of the photographic observations made by citizen scientists, professional scientists, student, and interns. This map visualizes user submitted photographs and data to the Citizen Scientist Project’s GIS database."),
            
        ]
        
        return exploreContent
    }
    
    class func fetchGetInvolvedContent() -> [AboutUsGetInvolvedContent] {
        
        let getInvolvedContent = [
            
            AboutUsGetInvolvedContent(imageName: "about-us-key-challenge", title: "KEY CHALLENGE", text: "The Key Challenge is an island-wide initiative directed at increasing student’s appreciation and knowledge of the island’s natural resources.", button: SegueButton(text: "LEARN MORE", page: .KeyChallenge)),
            
            AboutUsGetInvolvedContent(imageName: "about-us-sea-level", title: "SEA LEVEL RISE", text: "As an island community, the effects of changes in climate have special significance for the Key Biscayne, such as flooding, salt water intrusion, and king tides.", button: SegueButton(text: "LEARN MORE", page: .SeaLevelRise)),
            
            AboutUsGetInvolvedContent(imageName: "about-us-water-watch", title: "WATER WATCH", text: "The Water Watch is a community-based volunteer water quality monitoring program working with the UF/IFAS Sea Grant Extension Program.", button: SegueButton(text: "LEARN MORE", page: .WaterWatch)),
            
            AboutUsGetInvolvedContent(imageName: "about-us-reef-restoration", title: "REEF RESTORATION", text: "Working with UM’s coral restoration lab, Reef Restoration propagates threatened Caribbean staghorn coral in underwater coral nurseries.", button: SegueButton(text: "LEARN MORE", page: .ReefRestoration)),
            
            AboutUsGetInvolvedContent(imageName: "about-us-lectures", title: "CSP LECTURE SERIES", text: "The Citizen Scientist Project’s Lecture Series is an ongoing monthly lecture series hosted on Key Biscayne, and the Series is open & free to the public.", button: SegueButton(text: "LEARN MORE", page: .LectureSeries)),
            
            AboutUsGetInvolvedContent(imageName: "about-us-field-activities", title: "CSP FIELD ACTIVITIES", text: "The Water Watch is a community-based volunteer water quality monitoring program working with the UF/IFAS Sea Grant Extension Program.", button: SegueButton(text: "LEARN MORE", page: .FieldActivities)),
        
        ]
        
        return getInvolvedContent
    }
}
