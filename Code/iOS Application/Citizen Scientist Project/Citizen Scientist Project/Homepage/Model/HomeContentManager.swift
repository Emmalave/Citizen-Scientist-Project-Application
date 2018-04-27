//
//  CollectionViewContentManager.swift
//  Citizen Scientist Project
//
//  Created by David Gonzalez on 2/9/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation
import UIKit


extension Array where Iterator.Element == HomepageCell {
    func nextAvailableCell(fromIndex: Int) -> HomepageCell{
        
        let cpsLabIndex = HomeContentManager.getPageId(page: .CSPLab)
        let cspLabChildren = self[cpsLabIndex].expandableProperty?.childrenCount
        let cspLabExpandedProperty = self[cpsLabIndex].expandableProperty?.isExpanded
        
        // check if CSP Lab cell has been expanded
        if cspLabExpandedProperty == false  && fromIndex > cpsLabIndex {
            return self[fromIndex + cspLabChildren!]
        }
        return self[fromIndex]
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
        let index = HomeContentManager.getPageId(page: page)
        return self[index].id
    }
    
    
}

//TODO: extend Page enum to get Homepage Id
//extension Page {
//    static var HomepageId: Int {
//
//        return ContentManager.getPageId(page: Page.Home)
//    }
//}



class HomeContentManager {
    
    static let headerLabelFontSizeSuperCell: CGFloat = 14
    static let subHeaderLabelFontSizeSuperCell: CGFloat = 22
    static let headerLabelFontSizeRegularCell: CGFloat = 8
    static let subHeaderLabelFontSizeRegularCell: CGFloat = 18
    static let globalLightBlue = UIColor(displayP3Red: 95/255.0, green: 172/255.0, blue: 223/255.0, alpha: 1.0)
    static let labelLeftRightPadding: CGFloat = 8
    static let NUMBER_OF_CELLS = 16
    static let SHADOW_IMAGE_NAME = "20-homepage-image-shadow"
    static let UP_ARROW_IMAGE_NAME = "white-up-arrow"
    static let DOWN_ARROW_IMAGE_NAME = "white-down-arrow"
    private static let CSPLAB_CHILDREN_COUNT = 4
    static let CSPLAB_CHILDREN_DEFAULT_VISIBILITY = false // false = children not visible by default, true children visible by default
    
    
    private static var HomepageContent: Dictionary<Page, HomepageCell> = [
        
        .Home: HomepageCell(id: nextPageId(), page: .Home, parent: .Home, imageName: "1-welcome-home", labelHeader: "Welcome to the", labelSubHeader: "CITIZEN SCIENTIST PROJECT", cellType: .Super),
        
        .News: HomepageCell(id: nextPageId(), page: .News, parent: .News, imageName: "2-news-home", labelHeader: "CITIZEN SCIENTIST PROJECT", labelSubHeader: "LOCAL NEWS", cellType: .Regular),
        
        .Events: HomepageCell(id: nextPageId(), page: .Events, parent: .Events, imageName: "3-events-home", labelHeader: "CITIZEN SCIENTIST PROJECT", labelSubHeader: "EVENTS", cellType: .Regular),
        
        .KeyChallenge: HomepageCell(id: nextPageId(), page: .KeyChallenge, parent: .KeyChallenge, imageName: "4-key-challenge-home", labelHeader: "CSP 2017-18", labelSubHeader: "KEY CHALLENGE", cellType: .Regular),
        
        .ReefRestoration: HomepageCell(id: nextPageId(), page: .ReefRestoration, parent: .ReefRestoration, imageName: "5-reef-restoration-home", labelHeader: "KEY BISCAYNE", labelSubHeader: "REEF RESTORATION", cellType: .Regular),
        
        .CSPLab: HomepageCell(id: nextPageId(), page: .CSPLab, parent: .CSPLab, imageName: "6-lab-home-new", labelHeader: "Welcome to the", labelSubHeader: "CSP LAB", cellType: .Super, arrowImageName: getDefaultArrowImageName(page: .CSPLab)),
        
        .Learn: HomepageCell(id: nextPageId(), page: .Learn, parent: .CSPLab, imageName: "7-lab-learn", labelHeader: "CSP LAB", labelSubHeader: "LEARN", cellType: .Regular),
        
        .Explore: HomepageCell(id: nextPageId(), page: .Explore, parent: .CSPLab, imageName: "8-lab-explore", labelHeader: "CSP LAB", labelSubHeader: "EXPLORE", cellType: .Regular),
        
        .Record: HomepageCell(id: nextPageId(), page: .Record, parent: .CSPLab, imageName: "9-lab-record", labelHeader: "CSP LAB", labelSubHeader: "RECORD", cellType: .Regular),
        
        .Review: HomepageCell(id: nextPageId(), page: .Review, parent: .CSPLab, imageName: "10-lab-review", labelHeader: "CSP LAB", labelSubHeader: "REVIEW", cellType: .Regular),
        
        .WaterWatch: HomepageCell(id: nextPageId(), page: .WaterWatch, parent: .WaterWatch, imageName: "11-water-watch-home", labelHeader: "KEY BISCAYNE", labelSubHeader: "WATER WATCH", cellType: .Regular),
        
        .SeaLevelRise: HomepageCell(id: nextPageId(), page: .SeaLevelRise, parent: .SeaLevelRise, imageName: "12-sea-level-home", labelHeader: "KEY BISCAYNE", labelSubHeader: "SEA LEVEL RISE", cellType: .Regular),
        
        .LectureSeries: HomepageCell(id: nextPageId(), page: .LectureSeries, parent: .LectureSeries, imageName: "13-lectures-home", labelHeader: "CITIZEN SCIENTIST PROJECT", labelSubHeader: "LECTURE SERIES", cellType: .Regular),
        
        .FieldActivities: HomepageCell(id: nextPageId(), page: .FieldActivities, parent: .FieldActivities, imageName: "14-field-activities-home", labelHeader: "CITIZEN SCIENTIST PROJECT", labelSubHeader: "FIELD ACTIVITIES", cellType: .Regular),
        
        .OurPartners: HomepageCell(id: nextPageId(), page: .OurPartners, parent: .OurPartners, imageName: "15-partners-home", labelHeader: "CITIZEN SCIENTIST PROJECT", labelSubHeader: "OUR PARTNERS", cellType: .Regular),
        
        .ContactUs: HomepageCell(id: nextPageId(), page: .ContactUs, parent: .ContactUs, imageName: "16-contact-home", labelHeader: "CITIZEN SCIENTIST PROJECT", labelSubHeader: "CONTACT US", cellType: .Regular),
    ]
    
    class func fetchCellContent() -> [HomepageCell]
    {
        return getContentData()
    }
    
    private class func getNumberOfCells() -> Int {
        return HomepageContent.count
    }
    
    private class func getContentData() -> [HomepageCell]
    {
        let numbOfCells = HomeContentManager.getNumberOfCells()
        var contentData = [HomepageCell?](repeating: nil, count: numbOfCells)
        
        let pages = Array(HomepageContent.keys)
        
        for page in pages {
            
            if var cell = HomepageContent[page] {
                // get Expandable property
                cell.expandableProperty = getCellExpandableProperty(cell: cell)
                // Insert HomepageCell at position specified in the cell id property
                let index = cell.id
                contentData[index] = cell
            }
            
        }
        
        return contentData as! [HomepageCell]
    }

    // Used by the CollectionViewCell to set up label properties
    class func getCellLabelsProperties(cell: HomepageCell) -> CellLabelsProperties
    {
        
        let cellType = cell.cellType
        
        var cellLabelsProperties = CellLabelsProperties()
        var headerLabelProperties = LabelProperties()
        var subHeaderLabelProperties = LabelProperties()
        
        switch cellType {
        case .Super:
            headerLabelProperties.font = UIFont(name: "HelveticaNeue-MediumItalic", size: headerLabelFontSizeSuperCell)!
            headerLabelProperties.color = UIColor.white
            headerLabelProperties.alignment = NSTextAlignment.center
            subHeaderLabelProperties.font = UIFont(name: "HelveticaNeue-Bold", size: subHeaderLabelFontSizeSuperCell)!
            subHeaderLabelProperties.color = UIColor.white
            subHeaderLabelProperties.alignment = NSTextAlignment.center
        default:
            headerLabelProperties.font = UIFont(name: "HelveticaNeue-Bold", size: headerLabelFontSizeRegularCell)!
            headerLabelProperties.color = globalLightBlue
            headerLabelProperties.alignment = NSTextAlignment.left
            subHeaderLabelProperties.font = UIFont(name: "HelveticaNeue-Bold", size: subHeaderLabelFontSizeRegularCell)!
            subHeaderLabelProperties.color = UIColor.white
            subHeaderLabelProperties.alignment = NSTextAlignment.left
        }
        
        cellLabelsProperties.labelHeaderProperty = headerLabelProperties
        cellLabelsProperties.labelSubHeaderProperty = subHeaderLabelProperties
        return cellLabelsProperties
    }
    
    
    class func getCellExpandableProperty(cell: HomepageCell) -> Expandable {
        
        let page = cell.page
        
        switch page {
            
        case .CSPLab:
            return Expandable(isExpanded: CSPLAB_CHILDREN_DEFAULT_VISIBILITY, childrenCount: CSPLAB_CHILDREN_COUNT)
        default:
            return Expandable(isExpanded: true, childrenCount: 0)
            
        }
    }
    
    class func getPageId(page: Page) -> Int {
        return HomepageContent[page]!.id
    }
    
    class func getPageChildren(page: Page) -> [Page] {
        var children = [Page]()
        
        for (_, cell) in HomepageContent {
            if (cell.page != cell.parent) && (cell.parent == page) {
                children.append(cell.page)
            }
        }
        return children
    }
    
    private class func nextPageId() -> Int{
        struct IDHolder {
            static var id = 0
        }
        let id = IDHolder.id
        IDHolder.id += 1
        return id
    }
    
    class func updateCellContentIds(cells: inout [HomepageCell]) {
        var hiddenCells = 0
        var invalidCells = 0
        var invalidId = 1
        for index in 0..<cells.count {
            if (cells[index].expandableProperty?.isExpanded)! == false{
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
            case .CSPLab: pageVisibility = HomeContentManager.CSPLAB_CHILDREN_DEFAULT_VISIBILITY
            default: pageVisibility = false
        }
        
        return pageVisibility ? HomeContentManager.UP_ARROW_IMAGE_NAME : HomeContentManager.DOWN_ARROW_IMAGE_NAME
    }
}
