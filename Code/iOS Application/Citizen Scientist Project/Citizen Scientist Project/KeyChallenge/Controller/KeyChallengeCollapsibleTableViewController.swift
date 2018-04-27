//
//  KeyChallengeCollapsibleTableViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/18/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class KeyChallengeCollapsibleTableViewController: UITableViewController {

    var sections: [KeyChallengeTableSection] = KeyChallengeCollapsibleTableContentManager.fetchContent()
    
    static weak var delegate: KeyChallengeViewControllerDelegate?
    
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
    
    // Signal the KeyCHallengeViewController container's height constraint to update its size to wrap tableview
    override func viewDidLayoutSubviews() {
        KeyChallengeCollapsibleTableViewController.delegate?.setContainerHeight(height: tableViewHeight)
    }

    

}

extension KeyChallengeCollapsibleTableViewController {
    
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "KeyChallengeCollapsibleTableViewCell") as! KeyChallengeCollapsibleTableViewCell
        
        let keyChallengeSectionCellContent = sections[indexPath.section].rows[indexPath.row]
        cell.setUp(content: keyChallengeSectionCellContent)
        
        return cell
    }
    
    // Table Row Height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // Table Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableCell(withIdentifier: "KeyChallengeCollapsibleTableViewHeader") as! KeyChallengeCollapsibleTableViewHeader
        header.delegate = self
        sections[section].header.section = section
        
        let keyChallengeSectionHeaderContent = sections[section].header
        header.setUp(content: keyChallengeSectionHeaderContent)
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
}

//
// MARK: - Section Header Delegate
//
extension KeyChallengeCollapsibleTableViewController: KeyChallengeCollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: KeyChallengeCollapsibleTableViewHeader, section: Int) {
        let collapsed = !sections[section].header.collapsed!
        
        // Toggle collapse
        sections[section].header.collapsed = collapsed
        header.updateArrowDirection(collapsed)
        
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
        tableView.reloadData()
        
        
    }
    
}
