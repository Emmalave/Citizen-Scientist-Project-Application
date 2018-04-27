//
//  PreviousWinnersCollapsibleTableViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/18/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

// MARK: - Previous Winners View Controller

class PreviousWinnersCollapsibleTableViewController: UITableViewController {

    var sections: [PreviousWinnersTableSection] = PreviousWinnersCollapsibleTableContentManager.fetchTableContent()
    
    static weak var delegate: PreviousWinnersViewControllerDelegate?
    
    var tableViewHeight: CGFloat {
        tableView.layoutIfNeeded()
        return tableView.contentSize.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
        
        // Auto resizing the height of the cell
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.sectionFooterHeight = UITableViewAutomaticDimension
    }

    

}

extension PreviousWinnersCollapsibleTableViewController {
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let collapsed = sections[section].header.collapsed
        return collapsed! ? 0 : sections[section].rows.count
    }
    
    // Table Row Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreviousWinnersCollapsibleTableViewCell") as! PreviousWinnersCollapsibleTableViewCell
        
        let previousWinnersSectionCellContent = sections[indexPath.section].rows[indexPath.row]
        cell.setUp(content: previousWinnersSectionCellContent)
        
        return cell
    }
    
    // Table Row Height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // Table Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableCell(withIdentifier: "PreviousWinnersCollapsibleTableViewHeader") as! PreviousWinnersCollapsibleTableViewHeader
        header.delegate = self
        sections[section].header.section = section
        
        let previousWinnersSectionHeaderContent = sections[section].header
        header.setUp(content: previousWinnersSectionHeaderContent)
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    // Signal the PreviousWinnersViewController container's height constraint to update its size to wrap tableview
    override func viewDidLayoutSubviews() {
        PreviousWinnersCollapsibleTableViewController.delegate?.setContainerHeight(height: tableViewHeight)
    }
    
}

//
// MARK: - Section Header Delegate
//
extension PreviousWinnersCollapsibleTableViewController: PreviousWinnersCollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: PreviousWinnersCollapsibleTableViewHeader, section: Int) {
        let collapsed = !sections[section].header.collapsed!
        
        // Toggle collapse
        sections[section].header.collapsed = collapsed
        header.updateArrowDirection(collapsed)
        
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
        tableView.reloadData()
        
        
    }
    
}


