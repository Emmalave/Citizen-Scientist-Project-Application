//
//  CollapsibleTableViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/22/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

//
// MARK: - View Controller
//
class CollapsibleTableViewController: UITableViewController {
    
    var sections = CollapsibleTableContentManager.fetchTableContent()
    
    static weak var delegate: WaterWatchContainerViewDelegate?
    
    var tableViewHeight: CGFloat {
        tableView.layoutIfNeeded()
        return tableView.contentSize.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Auto resizing the height of the cell
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.sectionFooterHeight = UITableViewAutomaticDimension
        
    }
    
}

//
// MARK: - View Controller DataSource and Delegate
//

extension CollapsibleTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    // Display all rows for a section that is expanded. If section is collapsed return 0 rows to display for that section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let collapsed = sections[section].collapsed
        return collapsed ? 0 : sections[section].items.count
    }
    
    // Table Row Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let waterWatchChartContent = sections[indexPath.section].items[indexPath.row] as? WaterWatchChart {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WaterWatchTableViewCellChart") as! WaterWatchTableViewCellChart
            cell.setUp(content: waterWatchChartContent)
            return cell
        }
        if let waterWatchTableContent = sections[indexPath.section].items[indexPath.row] as? WaterWatchTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WaterWatchCollapsibleTableViewCellTable") as! WaterWatchCollapsibleTableViewCellTable
            cell.setUp(content: waterWatchTableContent)
            return cell
        }
        
        return UITableViewCell()
    }
    
    // Table Row Height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    // Table Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableCell(withIdentifier: "WaterWatchTableViewHeaderCell") as! WaterWatchTableViewHeaderCell
        header.delegate = self
        
        let waterWatchSection = sections[section]
        header.setUp(content: waterWatchSection, section: section)
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    
    // Signal the WaterWatchViewController container's height constraint to update its size to wrap tableview
    override func viewDidLayoutSubviews() {
        CollapsibleTableViewController.delegate?.setContainerHeight(height: tableViewHeight)
    }
    
}

//
// MARK: - Section Header Delegate
//
extension CollapsibleTableViewController: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: WaterWatchTableViewHeaderCell, section: Int) {
        let collapsed = !sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = collapsed
        header.updateArrowDirection(collapsed)
        
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
        tableView.reloadData()
        
        
    }
    
}

