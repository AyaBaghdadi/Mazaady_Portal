//
//  ChangeLanguageVC.swift
//  Mazaady
//
//  Created by Aya Baghdadi on 4/13/25.
//

import UIKit

class ChangeLanguageVC: UIViewController {

    @IBOutlet weak var arabicBtn: UIButton!
    @IBOutlet weak var englishBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func closeTapped(_ sender: Any) {
        
        UIView.transition(with: self.view, duration: 0.30, options: [.transitionCrossDissolve], animations: {
            self.removeFromParent()
            self.view.removeFromSuperview()
        }, completion: nil)
        
    }
    
    @IBAction func arabicTapped(_ sender: Any) {
    }
    @IBAction func englishTapped(_ sender: Any) {
    }
}
