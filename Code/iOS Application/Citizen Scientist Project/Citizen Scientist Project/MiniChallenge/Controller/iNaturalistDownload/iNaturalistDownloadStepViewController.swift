//
//  DownloadiNaturalistViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/30/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class iNaturalistDownloadStepViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stepsTextView: UITextView!
    
    var image: String? {
        didSet {
            guard let img = image else { return }
            self.imageView?.image = UIImage(named: img)
        }
    }
    
    var text: String? {
        didSet {
            guard let txt = text else { return }
            self.stepsTextView?.text = txt
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let img = self.image else{ return }
        guard let txt = text else { return }

        self.imageView?.image = UIImage(named: img)
        self.stepsTextView?.text = txt
    }

}
