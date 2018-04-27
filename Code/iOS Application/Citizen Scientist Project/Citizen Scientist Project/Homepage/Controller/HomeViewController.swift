//
//  ViewController.swift
//  My First Project
//
//  Created by David Gonzalez on 1/29/18.
//  Copyright © 2018 David Gonzalez. All rights reserved.
//

import UIKit

let RGB: CGFloat = 255.0
let fullOpacity: CGFloat = 1.0


class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cellContent: [HomepageCell] = HomeContentManager.fetchCellContent()
    //var sectionFooter: [Icon] = SectionFooter.fetchIcons()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update Id of cell content. Hidden cells should not have a valid id
        HomeContentManager.updateCellContentIds(cells: &cellContent)

        collectionView.dataSource = self
        collectionView.delegate = self
        
        ReusableHeader.setUpNavBar(navigationController: self.navigationController, navigationItem: self.navigationItem)
        
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Storyboard.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  cellContent.numberOfExpandedCells() // Returns the number of visible cells
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let index = indexPath.item
        let cellCont = cellContent[index]
        let screenWidth = self.collectionView.frame.size.width
        
        if cellCont.cellType == HomepageCell.CellType.Super {
            return CGSize(width: screenWidth, height: screenWidth/2) // full width
        }
        return CGSize(width: (screenWidth/2), height: screenWidth/2);
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.cellContentView, for: indexPath) as!  HomeCollectionViewCell
        
        let screenWidth = self.collectionView.frame.size.width
        
        let index = indexPath.row
        let cellCont = cellContent.nextAvailableCell(fromIndex: index)
        
        cell.setUp(content: cellCont, screenWidth: screenWidth)
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = Storyboard.cellBorderWidth
        
        return cell
    }
    
    
    // MARK: - Click Listener Event for a specific cell in the UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
            case cellContent.getCellId(page: .Home): Page.AboutUs.goTo(from: self)
            case cellContent.getCellId(page: .News): Page.News.goTo(from: self)
            case cellContent.getCellId(page: .Events): Page.Events.goTo(from: self)
            case cellContent.getCellId(page: .KeyChallenge): Page.KeyChallenge.goTo(from: self)
            case cellContent.getCellId(page: .ReefRestoration): Page.ReefRestoration.goTo(from: self)
            case cellContent.getCellId(page: .CSPLab): expandCollapseCSPLab()
            case cellContent.getCellId(page: .Learn): Page.Learn.goTo(from: self)
            case cellContent.getCellId(page: .Explore): Page.Explore.goTo(from: self)
            case cellContent.getCellId(page: .Record): Page.Record.goTo(from: self)
            case cellContent.getCellId(page: .Review): Page.Review.goTo(from: self)
            case cellContent.getCellId(page: .WaterWatch): Page.WaterWatch.goTo(from: self)
            case cellContent.getCellId(page: .SeaLevelRise): Page.SeaLevelRise.goTo(from: self)
            case cellContent.getCellId(page: .LectureSeries): Page.LectureSeries.goTo(from: self)
            case cellContent.getCellId(page: .FieldActivities): Page.FieldActivities.goTo(from: self)
            case cellContent.getCellId(page: .OurPartners): Page.OurPartners.goTo(from: self)
            case cellContent.getCellId(page: .ContactUs): Page.ContactUs.goTo(from: self)
            default: print("Cell \(indexPath.row) clicked!")
        }
        
    }
    
    private func expandCollapseCSPLab()
    {
        // Change CSP Lab expandable property to its opposite
        
        let cspLabIndex = HomeContentManager.getPageId(page: .CSPLab)
        let cspLabExpanded = !(cellContent[cspLabIndex].expandableProperty?.isExpanded)!
        
        // Updates CSP Lab expandable property
        cellContent[cspLabIndex].expandableProperty?.isExpanded = cspLabExpanded
        
        // Update Id of cell content. Hidden cells should not have a valid id
        if cspLabExpanded {
            HomeContentManager.updateCellContentIds(cells: &cellContent)
        }
        
        // If expanded, update all cells' id before getting the cell ids for CSP Lab children
        // If not expanded, update all cells' id after getting cell ids for CSP Lab children
        // Cells to be expanded/collapsed when CSPLab Cell is clicked
        var indexPaths = [IndexPath]()
        let cspLabChildren = HomeContentManager.getPageChildren(page: .CSPLab) // dynamically get the CSPLab children
        for page in cspLabChildren {
            indexPaths.append(IndexPath(row: cellContent.getCellId(page: page), section: 0))
        }
        
        // Update Id of cell content. Hidden cells should not have a valid id
        if !cspLabExpanded {
            HomeContentManager.updateCellContentIds(cells: &cellContent)
        }
        
        collectionView.performBatchUpdates({
            if cspLabExpanded {
                collectionView.insertItems(at: indexPaths)
                
                // Updates the arrow image to 'up' when CSP Lab children are 'expanded'
                cellContent[cspLabIndex].arrowImageName = HomeContentManager.UP_ARROW_IMAGE_NAME
                
            }else{
                collectionView.deleteItems(at: indexPaths)
                
                // Updates the arrow image to 'down' when CSP Lab children are 'hidden'
                cellContent[cspLabIndex].arrowImageName = HomeContentManager.DOWN_ARROW_IMAGE_NAME
                
            }
            
            // This forces the CSP Lab cell to load before other cells. Arrow change animation speed is significantly increased
            let cspLabIndexPath = IndexPath(row: cellContent.getCellId(page: .CSPLab), section: 0)
            self.collectionView.reloadItems(at: [cspLabIndexPath])
            
            
        }, completion: { (true) in
            self.collectionView.reloadItems(at: self.collectionView.indexPathsForVisibleItems)
        })
    }
    
    
    // MARK: - Section Footer View
    
    
    @IBAction func openFacebook(_ sender: UIButton) {
        SocialNetwork.Facebook.openPage()
    }

    @IBAction func openTwitter(_ sender: UIButton) {
        SocialNetwork.Twitter.openPage()
    }

    @IBAction func openGooglePlus(_ sender: UIButton) {
        SocialNetwork.GooglePlus.openPage()
    }

    @IBAction func openYoutube(_ sender: UIButton) {
        SocialNetwork.YouTube.openPage()
    }

    @IBAction func openInstagram(_ sender: UIButton) {
        SocialNetwork.Instagram.openPage()
    }
    
    
    // This is necessary for resizing the cell using the screen width
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        flowLayout.invalidateLayout()
    }
    
    
    // Setup footer icon images
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    {
        let sectionFooterView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Storyboard.sectionFooterView, for: indexPath) as! SectionFooterView
        
        return sectionFooterView
    }
    
}


