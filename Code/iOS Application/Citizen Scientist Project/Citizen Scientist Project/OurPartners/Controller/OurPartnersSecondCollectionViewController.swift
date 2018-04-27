//
//  OurPartnersSecondCollectionViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/24/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

private let reuseIdentifier = "OurPartnersGroupCell"

class OurPartnersSecondCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let NUMBER_OF_CELLS_PER_ROW: CGFloat = 3
    
    var collectionViewHeight: CGFloat {
        collectionView.layoutIfNeeded()
        return collectionView.contentSize.height
    }
    
    static weak var heightDelegate: OurPartnersContainerViewDelegate?
    
    private let secondPartnersContent = OurPartnersContentManager.fetchSecondPartners()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = view.frame.width
        return CGSize(width: screenWidth/NUMBER_OF_CELLS_PER_ROW, height: screenWidth/NUMBER_OF_CELLS_PER_ROW);
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return secondPartnersContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! OurPartnersCollectionViewCell
        
        cell.setUp(cell: secondPartnersContent[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ExternalAppManager.openPage(page: secondPartnersContent[indexPath.row].partner.link.url)
    }
    
    // Signal the OurPartnerViewController container's height constraint to update its size to wrap collectionView
    override func viewDidLayoutSubviews() {
        OurPartnersSecondCollectionViewController.heightDelegate?.setContainerHeight(height: collectionViewHeight, partner: .Second)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        OurPartnersSecondCollectionViewController.heightDelegate?.setContainerHeight(height: collectionViewHeight, partner: .Second)
        flowLayout.invalidateLayout()
        
    }
    
}



