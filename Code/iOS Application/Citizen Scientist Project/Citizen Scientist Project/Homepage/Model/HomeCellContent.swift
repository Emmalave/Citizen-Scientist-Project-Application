//
//  CollectionViewCellContent.swift
//  Citizen Scientist Project
//
//  Created by David Gonzalez on 2/9/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation
import UIKit

struct HomepageCell {
    
    var id: Int
    var page: Page
    var parent: Page
    var imageName: String
    var labelHeader: String
    var labelSubHeader: String
    var cellType: CellType
    var expandableProperty: Expandable?
    var arrowImageName: String?
    
    enum CellType {
        case Regular // half of full width
        case Super   // full width
    }
    
    init(id: Int, page: Page, parent: Page, imageName: String, labelHeader: String, labelSubHeader: String, cellType: CellType, arrowImageName: String? = HomeContentManager.DOWN_ARROW_IMAGE_NAME){
        self.id = id
        self.page = page
        self.parent = parent
        self.imageName = imageName
        self.labelHeader = labelHeader
        self.labelSubHeader = labelSubHeader
        self.cellType = cellType
        self.arrowImageName = arrowImageName
    }
    
    var setCellId:Int {
        get {
            return id
        }
        mutating set(ID) {
            id = ID
        }
    }
    
    
}

struct CellLabelsProperties {
    var labelHeaderProperty: LabelProperties?
    var labelSubHeaderProperty: LabelProperties?
    
    init(){}
}

struct LabelProperties {
    var font: UIFont?
    var color: UIColor?
    var alignment: NSTextAlignment?
    
    init(){}
}

struct Expandable {
    var isExpanded: Bool
    var childrenCount: Int
}
