//
//  KeyChallengeCollapsibleTableContent.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/18/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

struct KeyChallengeTableSection {
    var header: CollapsibleTableHeader
    var rows: [KeyChallengeTableRow]
}

struct KeyChallengeTableRow {
    var header: String
    var subHeader: String
    var bodyText: String
}
