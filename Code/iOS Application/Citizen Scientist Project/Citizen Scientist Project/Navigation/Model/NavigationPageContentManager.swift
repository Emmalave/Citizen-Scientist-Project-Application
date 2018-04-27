//
//  NavigationPageContentManager.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/9/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation
import UIKit



extension Array where Iterator.Element == NavigationPageCell {
    
    func nextAvailableCell(fromIndex: Int) -> NavigationPageCell{
        
        var index = 0
        var i = 0
        
        while(i < self.count){
            if(index == fromIndex){
                return self[i]
            }
            if(!(self[i].expandableProperty?.isExpanded)!){
                i += (self[i].expandableProperty?.childrenCount)!
            }
            index += 1
            i += 1
        }
        
        return self[fromIndex] // this line should not be reached ever. return in loop is assumed to always be execute
    }
    
    func numberOfExpandedCells() -> Int{
        var count = 0
        for index in 0..<self.count {
            count = count + 1
            
            let expandable = self[index].expandableProperty?.isExpanded
            
            // If a particular cell is not expanded, substract the number of children hidden under that cell
            if expandable == false {
                let childrenCount = self[index].expandableProperty?.childrenCount
                count = count - childrenCount!
            }
        }
        return count
    }
    
    func getCellId(page: Page) -> Int {
        let index = NavigationPageContentManager.getPageId(page: page)
        return self[index].id
    }
    
    
}

class NavigationPageContentManager {
    
    private static let CSPLAB_CHILDREN_COUNT = 4
    static let CSPLAB_CHILDREN_DEFAULT_VISIBILITY = false // false = children not visible by default, true children visible by default
    private static let PROGRAMS_CHILDREN_COUNT = 6
    static let PROGRAMS_CHILDREN_DEFAULT_VISIBILITY = false // false = children not visible by default, true children visible by default
    private static let RESOURCES_CHILDREN_COUNT = 5
    static let RESOURCES_CHILDREN_DEFAULT_VISIBILITY = false // false = children not visible by default, true children visible by default
    static let DOWN_ARROW_IMAGE_NAME = "downwards-arrow-key"
    static let UP_ARROW_IMAGE_NAME = "upwards-arrow-key"
    
    
    class func fetchContent() -> [NavigationPageCell] {
        return getNavigationPageCellContentData()
    }
    
    private class func getNavigationPageCellContentData() -> [NavigationPageCell] {
        let numberOfCells = NavigationPageContentManager.getNumberOfCells()
        var navigationCellContent = [NavigationPageCell?](repeating: nil, count: numberOfCells)
        
        let pages = Array(NavigationPageContent.keys)
        
        for page in pages {
            
            if var cell = NavigationPageContent[page] {
                // get Expandable property
                cell.expandableProperty = getCellExpandableProperty(cell: cell)
                // Insert NavigationPageCell at position specified in the cell id property
                let index = cell.id
                navigationCellContent[index] = cell
            }
        }
        
        return navigationCellContent as! [NavigationPageCell]
    }
    
    private static var NavigationPageContent: Dictionary<Page, NavigationPageCell> = [
        
        .Home: NavigationPageCell(id: nextPageId(), page: .Home, parent: .Home, imageName: "home", title: "Home"),
        
        .Profile: NavigationPageCell(id: nextPageId(), page: .Profile, parent: .Profile, imageName: "profile", title: "Profile"),
        
        .GeoHunt: NavigationPageCell(id: nextPageId(), page: .GeoHunt, parent: .GeoHunt, imageName: "geohunt", title: "Geo Hunt"),
        
        .CSPLab: NavigationPageCell(id: nextPageId(), page: .CSPLab, parent: .CSPLab, imageName: "csplab", title: "CSP Lab", arrowImageName: getDefaultArrowImageName(page: .CSPLab)),
        
        .Learn: NavigationPageCell(id: nextPageId(), page: .Learn, parent: .CSPLab, imageName: "learn", title: "Learn"),
        
        .Explore: NavigationPageCell(id: nextPageId(), page: .Explore, parent: .CSPLab, imageName: "explore", title: "Explore"),
        
        .Record: NavigationPageCell(id: nextPageId(), page: .Record, parent: .CSPLab, imageName: "record", title: "Record"),
        
        .Review: NavigationPageCell(id: nextPageId(), page: .Review, parent: .CSPLab, imageName: "review", title: "Review"),
        
        .Programs: NavigationPageCell(id: nextPageId(), page: .Programs, parent: .Programs, imageName: "programs", title: "Programs", arrowImageName: getDefaultArrowImageName(page: .Programs)),
        
        .KeyChallenge: NavigationPageCell(id: nextPageId(), page: .KeyChallenge, parent: .Programs, imageName: "keychallenge", title: "Key Challenge"),
        
        .SeaLevelRise: NavigationPageCell(id: nextPageId(), page: .SeaLevelRise, parent: .Programs, imageName: "sealevel", title: "Sea Level Rise"),
        
        .WaterWatch: NavigationPageCell(id: nextPageId(), page: .WaterWatch, parent: .Programs, imageName: "waterwatch", title: "WaterWatch"),
        
        .ReefRestoration: NavigationPageCell(id: nextPageId(), page: .ReefRestoration, parent: .Programs, imageName: "reefrestoration", title: "Reef Restoration"),
        
        .LectureSeries: NavigationPageCell(id: nextPageId(), page: .LectureSeries, parent: .Programs, imageName: "lectures", title: "Lecture Series"),
        
        .FieldActivities: NavigationPageCell(id: nextPageId(), page: .FieldActivities, parent: .Programs, imageName: "fieldactivities", title: "Field Activities"),
        
        .Events: NavigationPageCell(id: nextPageId(), page: .Events, parent: .Events, imageName: "events", title: "Events"),
        
        .News: NavigationPageCell(id: nextPageId(), page: .News, parent: .News, imageName: "news", title: "News"),
        
        .Resources: NavigationPageCell(id: nextPageId(), page: .Resources, parent: .Resources, imageName: "resources", title: "Resources", arrowImageName: getDefaultArrowImageName(page: .CSPLab)),
        
        .AboutUs: NavigationPageCell(id: nextPageId(), page: .AboutUs, parent: .Resources, imageName: "about", title: "About Us"),
        
        .OurBiomes: NavigationPageCell(id: nextPageId(), page: .OurBiomes, parent: .Resources, imageName: "biomes", title: "Our Biomes"),
        
        .NewsLetter: NavigationPageCell(id: nextPageId(), page: .NewsLetter, parent: .Resources, imageName: "newsletters", title: "Newsletters"),
        
        .OurPartners: NavigationPageCell(id: nextPageId(), page: .OurPartners, parent: .Resources, imageName: "partners", title: "Our Partners"),
        
        .ContactUs: NavigationPageCell(id: nextPageId(), page: .ContactUs, parent: .Resources, imageName: "contact", title: "Contact Us"),
        
        ]
    
    private class func getNumberOfCells() -> Int {
        return NavigationPageContent.count
    }
    
    private class func nextPageId() -> Int{
        struct IDHolder {
            static var id = 0
        }
        let id = IDHolder.id
        IDHolder.id += 1
        return id
    }
    
    class func getPageId(page: Page) -> Int {
        return NavigationPageContent[page]!.id
    }
    
    class func getPageChildren(page: Page) -> [Page] {
        var children = [Page]()
        
        for (_, cell) in NavigationPageContent {
            if (cell.page != cell.parent) && (cell.parent == page) {
                children.append(cell.page)
            }
        }
        return children
    }
    
    
    class func getCellExpandableProperty(cell: NavigationPageCell) -> Expandable {
        
        let page = cell.page
        
        switch page {
            
        case .CSPLab:
            return Expandable(isExpanded: CSPLAB_CHILDREN_DEFAULT_VISIBILITY, childrenCount: CSPLAB_CHILDREN_COUNT)
        case .Programs:
            return Expandable(isExpanded: PROGRAMS_CHILDREN_DEFAULT_VISIBILITY, childrenCount: PROGRAMS_CHILDREN_COUNT)
        case .Resources:
            return Expandable(isExpanded: RESOURCES_CHILDREN_DEFAULT_VISIBILITY, childrenCount: RESOURCES_CHILDREN_COUNT)
        default:
            return Expandable(isExpanded: true, childrenCount: 0)
            
        }
    }
    
    class func updateCellContentIds(cells: inout [NavigationPageCell]) {
        var hiddenCells = 0
        var invalidCells = 0
        var invalidId = 1
        for index in 0..<cells.count {
            if (cells[index].expandableProperty?.isExpanded)! == false{ // if it is closed
                let children = cells[index].expandableProperty?.childrenCount
                cells[index].id = index - hiddenCells
                hiddenCells += children!
                invalidCells += children!
            }
            else {
                if (invalidCells > 0) && (cells[index].page != cells[index].parent) { // this cell is hidden, therefore no id
                    cells[index].id = -invalidId // make ids of invalid/hidden cells some unique negative number
                    invalidId += 1
                    invalidCells -= 1 // this value returns back to zero after the last hidden children is processed
                }
                else {
                    cells[index].id = index - hiddenCells
                }
            }
            
        }
    }
    
    class func getDefaultArrowImageName(page: Page) -> String{
        
        var pageVisibility: Bool
        
        switch(page){
            case .CSPLab: pageVisibility = NavigationPageContentManager.CSPLAB_CHILDREN_DEFAULT_VISIBILITY
            case .Programs: pageVisibility = NavigationPageContentManager.PROGRAMS_CHILDREN_DEFAULT_VISIBILITY
            case .Resources: pageVisibility = NavigationPageContentManager.RESOURCES_CHILDREN_DEFAULT_VISIBILITY
            default: pageVisibility = false
        }
        
        return pageVisibility ? NavigationPageContentManager.UP_ARROW_IMAGE_NAME : NavigationPageContentManager.DOWN_ARROW_IMAGE_NAME
    }
    
}
