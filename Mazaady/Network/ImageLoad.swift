//
//  ImageLoad.swift
//  Mazaady
//
//  Created by Aya Baghdadi on 4/12/25.
//

import UIKit

extension UIImageView {
    func loadImage(from url: URL, loader: UIActivityIndicatorView? = nil) {
        // Start animating if loader is provided
        DispatchQueue.main.async {
            loader?.startAnimating()
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    loader?.stopAnimating()
                }
                return
            }

            DispatchQueue.main.async {
                self.image = UIImage(data: data)
                loader?.stopAnimating()
            }
        }.resume()
    }
}

