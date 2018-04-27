//
//  AboutUsExploreViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/24/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class AboutUsExploreViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var textView: UITextView!
    
    var image: String? {
        didSet {
            guard let image = image else { return }
            self.imageView?.image = UIImage(named: image)
        }
    }
    
    override var title: String? {
        didSet {
            guard let title = title else { return }
            self.headerLabel?.text = title
        }
    }
    
    var text: String? {
        didSet {
            guard let text = text else { return }
            self.textView?.text = text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.translatesAutoresizingMaskIntoConstraints = false
        
        print("\n\n##### Explore View Height: ", view.frame.height, " #####\n\n")
        
        guard let image = self.image else { return }
        guard let title = self.title else { return }
        guard let text = self.text else { return }
        
        self.imageView?.image = UIImage(named: image)
        self.headerLabel?.text = title
        self.textView?.text = text
    }

}
