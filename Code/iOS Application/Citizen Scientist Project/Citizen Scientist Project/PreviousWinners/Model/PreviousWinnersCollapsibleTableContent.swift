//
//  PreviousWinnerCollapsibleTableContent.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/18/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation


struct PreviousWinnersTableSection {
    var header: CollapsibleTableHeader
    var rows: [PreviousWinnersTableRow]
}

struct PreviousWinnersTableRow {
    var header: String
    var winners: [PreviousWinners]
}

struct PreviousWinners {
    var rank: PreviousWinnersRank
    var winners: String
}

enum PreviousWinnersRank: String {
    case First = "1st - "
    case Second = "2nd - "
    case Third = "3rd - "
}


