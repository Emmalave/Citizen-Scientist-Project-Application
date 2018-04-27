//
//  CollectionViewCell.swift
//  Citizen Scientist Project
//
//  Created by David Gonzalez on 2/8/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var arrowImageView: UIImageView!
    @IBOutlet private weak var shadowImageView: UIImageView!
    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var subHeaderLabel: UILabel!
    
    @IBOutlet private weak var labelsStackContainer: UIStackView!
    
    @IBOutlet private weak var leftMarginLabelsConstraint: NSLayoutConstraint!
    @IBOutlet private weak var rightMarginLabelsConstraint: NSLayoutConstraint!
    @IBOutlet private weak var bottomMarginLabelsConstraint: NSLayoutConstraint!
    @IBOutlet private weak var headerLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var subHeaderLabelHeightConstraint: NSLayoutConstraint!
    
    static let leftMarginPercentage:  CGFloat = 5.0
    static let bottomMarginPercentage: CGFloat = leftMarginPercentage * 2
    static let inBetweenLabelSpacing: CGFloat = 5.0
    static let noInBetweenLabelSpacing: CGFloat = 0.0
    
    //shadowImageView constraints set in StoryBoard. Height set to 40% of width
    func setUp(content: HomepageCell, screenWidth: CGFloat)
    {
        
        // Populate cell with content
        populateCellContent(content: content)
        
        // Setup some default properties to image view
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        
        // Setup label properties
        let properties = HomeContentManager.getCellLabelsProperties(cell: content)
        setUpLabelProperties(properties: properties)
        
        // Setup cell image dimensions
        setUpImageViewFrame(cell: content, screenWidth: screenWidth)
        
        // Setup cell labels position and constraints
        setUpLabelsConstrainsts(cellType: content.cellType, screenWidth: screenWidth)
        
        // Arrow position and constraints were set using the Storyboard
        
    }
    
    private func populateCellContent(content: HomepageCell)
    {
        imageView.image = UIImage(named: content.imageName)
        shadowImageView.image = UIImage(named: HomeContentManager.SHADOW_IMAGE_NAME)
        arrowImageView.image = UIImage(named: content.arrowImageName!)
        headerLabel.text = content.labelHeader
        subHeaderLabel.text = content.labelSubHeader
    }
    
    
    private func setUpLabelProperties(properties: CellLabelsProperties)
    {
        // Header Label
        headerLabel.font = properties.labelHeaderProperty?.font
        headerLabel.textColor = properties.labelHeaderProperty?.color
        headerLabel.textAlignment = (properties.labelHeaderProperty?.alignment)!
        
        
        // Subheader Label
        subHeaderLabel.font = properties.labelSubHeaderProperty?.font
        subHeaderLabel.textColor = properties.labelSubHeaderProperty?.color
        subHeaderLabel.textAlignment = (properties.labelSubHeaderProperty?.alignment)!
    }
    
    private func setUpImageViewFrame(cell: HomepageCell, screenWidth: CGFloat)
    {
        let cellHeight = screenWidth / 2.0
        let regularCellWidth = cellHeight
        
        
        switch cell.cellType{
            
        case .Super:
            imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: screenWidth, height: cellHeight))
            
            // hide shadowing
            shadowImageView.isHidden = true
            
            // only show arrow for CSP Lab cell
            if cell.page == .CSPLab {
                arrowImageView.isHidden = false
            }
            else {
                arrowImageView.isHidden = true
            }
            
        case .Regular:
            imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: regularCellWidth, height: cellHeight))
            
            // show shadowing
            shadowImageView.isHidden = false
            
            // hide arrow
            arrowImageView.isHidden = true
        }
        
    }
    
    private func setUpLabelsConstrainsts(cellType: HomepageCell.CellType, screenWidth: CGFloat)
    {
        let regularCellWidth = screenWidth / 2
        let cellHeight = regularCellWidth
        
        let leftMargin = regularCellWidth * HomeCollectionViewCell.leftMarginPercentage / 100.0
        let bottomMagin = cellHeight * HomeCollectionViewCell.bottomMarginPercentage / 100.0
        
        
        if cellType == HomepageCell.CellType.Super
        {
            // Here the height of the stacks is equal to the sum of the height of both labels and the spacing between the labels
            let stackHeight = HomeCollectionViewCell.inBetweenLabelSpacing + HomeContentManager.headerLabelFontSizeSuperCell + HomeContentManager.subHeaderLabelFontSizeSuperCell
            
            // Stack constraints
            leftMarginLabelsConstraint.constant = HomeContentManager.labelLeftRightPadding
            rightMarginLabelsConstraint.constant = HomeContentManager.labelLeftRightPadding
            bottomMarginLabelsConstraint.constant = -(cellHeight - stackHeight)/2
            
            // Setup height of labels using a constraints
            headerLabelHeightConstraint.constant = HomeContentManager.headerLabelFontSizeSuperCell
            subHeaderLabelHeightConstraint.constant = HomeContentManager.subHeaderLabelFontSizeSuperCell
            
            // Space between labels of super cell
            labelsStackContainer.spacing = HomeCollectionViewCell.inBetweenLabelSpacing
            
        }
        else if cellType == HomepageCell.CellType.Regular
        {
            // Stack constraints
            leftMarginLabelsConstraint.constant = leftMargin
            rightMarginLabelsConstraint.constant = 0
            bottomMarginLabelsConstraint.constant = -bottomMagin
            
            // Setup height of labels using a constraints
            headerLabelHeightConstraint.constant = HomeContentManager.headerLabelFontSizeRegularCell
            subHeaderLabelHeightConstraint.constant = HomeContentManager.subHeaderLabelFontSizeRegularCell
            
            // Space between labels of regular cell
            labelsStackContainer.spacing = HomeCollectionViewCell.noInBetweenLabelSpacing
            
        }
        else
        {
            // opps... internal error occurred!
        }
    }
    
}
