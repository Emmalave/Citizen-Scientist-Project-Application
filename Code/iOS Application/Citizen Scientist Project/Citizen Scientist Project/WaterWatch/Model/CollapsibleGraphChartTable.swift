//
//  CollapsibleGraphChartTable.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/22/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

//
// MARK: - Section Data Structure
//

struct WaterWatchSection {
    
    public var alpha: Float
    var header: String
    var subHeader: String
    var items: [Any]
    var collapsed: Bool
    
    init(alpha: Float, header: String, subHeader: String, items: [Any], collapsed: Bool = true) {
        self.alpha = alpha
        self.header = header
        self.subHeader = subHeader
        self.items = items
        self.collapsed = collapsed
    }
}

//struct WaterWatchCell {
//    var charts: [WaterWatchChart]?
//    var tables: [WaterWatchTable]?
//    var cellType: WaterWatchCellType
//
//    init(charts: [WaterWatchChart]? = nil, tables: [WaterWatchTable], cellType: WaterWatchCellType) {
//        self.charts = charts
//        self.tables = tables
//        self.cellType = cellType
//    }
//
//    init(charts: [WaterWatchChart], tables: [WaterWatchTable]? = nil, cellType: WaterWatchCellType) {
//        self.charts = charts
//        self.tables = tables
//        self.cellType = cellType
//    }

    
    enum WaterWatchCellType {
        case Chart
        case Table
    }
//}

struct WaterWatchChart {
    
    var title: String
    var chartImage: String
    var legendImage: String
    
    init(title: String, chartImage: String, legendImage: String) {
        self.title = title
        self.chartImage = chartImage
        self.legendImage = legendImage
    }
}

struct WaterWatchTable {
    var chartImageName: String
}

