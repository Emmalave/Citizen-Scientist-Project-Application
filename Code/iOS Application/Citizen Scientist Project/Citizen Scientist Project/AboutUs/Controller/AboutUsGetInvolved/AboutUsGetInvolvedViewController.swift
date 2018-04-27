//
//  AboutUsGetInvolvedViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/24/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

class AboutUsGetInvolvedViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var learnMoreButton: UIButton!
    
    @IBOutlet weak var getInvolvedView: UIView!
    
    
    @IBAction func clickLearnMoreButton(_ sender: UIButton) {
        button?.page.goTo(from: self)
    }
    
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
    
    var button: SegueButton? {
        didSet {
            guard let button = button else { return }
            self.learnMoreButton?.setTitle(button.text, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.translatesAutoresizingMaskIntoConstraints = false
//
//        view.layoutIfNeeded()
//        getInvolvedView.layoutIfNeeded()
//
//        let height = imageView.frame.height + headerLabel.frame.height + textView.frame.height + learnMoreButton.frame.height
//
//        print("\n\n##### Get Involved View Height: ", height, " #####")
//        print("imageView height: ", imageView.frame.height)
//        print("header label height: ", headerLabel.frame.height)
//        print("text view height: ", textView.frame.height)
//        print("learn more button height: ", learnMoreButton.frame.height, "\n\n")
        
        guard let image = self.image else { return }
        guard let title = self.title else { return }
        guard let text = self.text else { return }
        guard let button = button else { return }
        
        self.imageView?.image = UIImage(named: image)
        self.headerLabel?.text = title
        self.textView?.text = text
        self.learnMoreButton?.setTitle(button.text, for: .normal)
        
    }
    
    
//    override func viewDidLayoutSubviews() {
//        view.layoutIfNeeded()
//        getInvolvedView.layoutIfNeeded()
//
//        let height = imageView.frame.height + headerLabel.frame.height + textView.frame.height + learnMoreButton.frame.height
//
//        print("\n\n##### View did layout subview. Get Involved View Height: ", height, " #####")
//        print("imageView height: ", imageView.frame.height)
//        print("header label height: ", headerLabel.frame.height)
//        print("text view height: ", textView.frame.height)
//        print("learn more button height: ", learnMoreButton.frame.height, "\n\n")    }

}
