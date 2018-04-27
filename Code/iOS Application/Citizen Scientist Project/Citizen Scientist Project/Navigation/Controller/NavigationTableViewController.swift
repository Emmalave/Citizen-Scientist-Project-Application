//
//  NavigationTableViewController.swift
//  Citizen Scientist Project
//
//  Created by Emmanuel Malave on 2/19/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class NavigationTableViewController: UITableViewController{
    let cellIdentifier = "NavigationTableViewCell"
    
    var navigationPageCellContent: [NavigationPageCell] = NavigationPageContentManager.fetchContent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update Id of cell content. Hidden cells should not have a valid id
        NavigationPageContentManager.updateCellContentIds(cells: &navigationPageCellContent)
        
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Storyboard.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return navigationPageCellContent.numberOfExpandedCells()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NavigationTableViewCell  else {
            fatalError("The dequeued cell is not an instance of NavigationTableViewCell.")
        }
        
        let index = indexPath.row
        let navigationCellContent = navigationPageCellContent.nextAvailableCell(fromIndex: index)
        
        cell.setUp(content: navigationCellContent)
        cell.layoutMargins = UIEdgeInsets.zero
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case navigationPageCellContent.getCellId(page: .Home): return Page.Home.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .Profile): return Page.Profile.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .GeoHunt): return Page.GeoHunt.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .CSPLab): expandCollapseCell(page: .CSPLab)
        case navigationPageCellContent.getCellId(page: .Learn): return Page.Learn.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .Explore): return Page.Explore.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .Record): return Page.Record.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .Review): return Page.Review.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .Programs): expandCollapseCell(page: .Programs)
        case navigationPageCellContent.getCellId(page: .KeyChallenge): return Page.KeyChallenge.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .SeaLevelRise): return Page.SeaLevelRise.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .WaterWatch): return Page.WaterWatch.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .ReefRestoration): return Page.ReefRestoration.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .LectureSeries): return Page.LectureSeries.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .FieldActivities): return Page.FieldActivities.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .Events): return Page.Events.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .News): return Page.News.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .Resources): expandCollapseCell(page: .Resources)
        case navigationPageCellContent.getCellId(page: .AboutUs): return Page.AboutUs.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .OurBiomes): return Page.OurBiomes.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .NewsLetter): return Page.NewsLetter.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .OurPartners): return Page.OurPartners.goTo(from: self)
        case navigationPageCellContent.getCellId(page: .ContactUs): return Page.ContactUs.goTo(from: self)
        default: print("Cell \(indexPath.row) clicked!")
        }
        
    }
    
    private func expandCollapseCell(page: Page)
    {
        // Change page expandable property to its opposite
        //let pageIndex = navigationPageCellContent.getCellId(page: page)
        let pageIndex = NavigationPageContentManager.getPageId(page: page)
        let pageExpanded = !(navigationPageCellContent[pageIndex].expandableProperty?.isExpanded)!
        navigationPageCellContent[pageIndex].expandableProperty?.isExpanded = pageExpanded
        
        // Update Id of cell content. Hidden cells should not have a valid id
        if pageExpanded {
            NavigationPageContentManager.updateCellContentIds(cells: &navigationPageCellContent)
        }
        
        // If expanded, update all cells' id before getting the cell ids for page children
        // If not expanded, update all cells' id after getting cell ids for page children
        // Cells to be expanded/collapsed when page Cell is clicked
        var indexPaths = [IndexPath]()
        let childrenPages = NavigationPageContentManager.getPageChildren(page: page) // dynamically get the page's children
        for page in childrenPages {
            indexPaths.append(IndexPath(row: navigationPageCellContent.getCellId(page: page), section: 0))
        }
        
        // Update Id of cell content. Hidden cells should not have a valid id
        if !pageExpanded {
            NavigationPageContentManager.updateCellContentIds(cells: &navigationPageCellContent)
        }
        
        tableView.performBatchUpdates({
            if pageExpanded {
                tableView.insertRows(at: indexPaths, with: .automatic)
                
                // Updates the arrow image to 'up' when page children are 'expanded'
                navigationPageCellContent[pageIndex].arrowImageName = NavigationPageContentManager.UP_ARROW_IMAGE_NAME
                
            }else{
                tableView.deleteRows(at: indexPaths, with: .automatic)
                
                // Updates the arrow image to 'down' when page children are 'hidden'
                navigationPageCellContent[pageIndex].arrowImageName = NavigationPageContentManager.DOWN_ARROW_IMAGE_NAME
                
            }
            
            // This forces the page cell to load before other cells. Arrow change animation speed is significantly increased
            let pageIndexPath = IndexPath(row: navigationPageCellContent.getCellId(page: page), section: 0)
            self.tableView.reloadRows(at: [pageIndexPath], with: .automatic)
            
        }, completion: { (true) in
            self.tableView.reloadRows(at: self.tableView.indexPathsForVisibleRows!, with: .automatic)
        })
    }
    
    
    
}

