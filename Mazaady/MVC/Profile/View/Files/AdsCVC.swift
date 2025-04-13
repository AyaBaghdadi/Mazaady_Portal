//
//  AdsCVC.swift
//  Mazaady
//
//  Created by Aya Baghdadi on 4/12/25.
//

import UIKit

class AdsCVC: UICollectionViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var loader: UIActivityIndicatorView!  // Add a loader (activity indicator)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loader.hidesWhenStopped = true  // Hide the loader when it's not animating
    }
}
