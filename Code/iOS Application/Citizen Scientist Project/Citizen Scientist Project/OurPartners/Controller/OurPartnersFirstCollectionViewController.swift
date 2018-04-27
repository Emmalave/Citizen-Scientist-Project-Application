//
//  OurPartnersFirstCollectionViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/24/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

private let reuseIdentifier = "OurPartnersGroupCell"

class OurPartnersFirstCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let NUMBER_OF_CELLS_PER_ROW: CGFloat = 2
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionViewHeight: CGFloat {
        collectionView.layoutIfNeeded()
        return collectionView.contentSize.height
    }
    
    static weak var heightDelegate: OurPartnersContainerViewDelegate?
    
    private let firstPartnersContent = OurPartnersContentManager.fetchFirstPartners()

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
        return firstPartnersContent.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! OurPartnersCollectionViewCell
    
        cell.setUp(cell: firstPartnersContent[indexPath.row])
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ExternalAppManager.openPage(page: firstPartnersContent[indexPath.row].partner.link.url)
    }
    
    // Signal the OurPartnerViewController container's height constraint to update its size to wrap collectionView
    override func viewDidLayoutSubviews() {
        OurPartnersFirstCollectionViewController.heightDelegate?.setContainerHeight(height: collectionViewHeight, partner: .First)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        OurPartnersFirstCollectionViewController.heightDelegate?.setContainerHeight(height: collectionViewHeight, partner: .First)
        flowLayout.invalidateLayout()
        
    }

}


