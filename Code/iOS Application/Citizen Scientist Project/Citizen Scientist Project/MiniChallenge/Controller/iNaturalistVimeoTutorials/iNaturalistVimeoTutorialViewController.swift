//
//  iNaturalistVimeoTutorialViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/30/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class iNaturalistVimeoTutorialViewController: UIViewController {

    @IBOutlet weak var vimeoTutorialButton: UIButton!
    @IBOutlet weak var vimeoTutorialTextView: UITextView!
    private var vimeoLink: URL?
    
    var image: String? {
        didSet {
            guard let img = image else { return }
            self.vimeoTutorialButton?.setImage(UIImage(named: img), for: .normal)
        }
    }
    
    var text: String? {
        didSet {
            guard let txt = text else { return }
            self.vimeoTutorialTextView?.text = txt
        }
    }
    
    var link: URL? {
        didSet {
            guard let url = link else { return }
            self.vimeoLink = url
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vimeoTutorialButton.addTarget(self, action: #selector(handleOnVimeoClick), for: .touchUpInside)
        
        guard let img = image else { return }
        guard let txt = text else { return }

        self.vimeoTutorialButton?.setImage(UIImage(named: img), for: .normal)
        self.vimeoTutorialTextView?.text = txt
        
    }
    
    @objc private func handleOnVimeoClick(){
        //guard let link = vimeoLink else { return }
        UIApplication.shared.open(vimeoLink!, options: [:], completionHandler: nil)
    }

}
