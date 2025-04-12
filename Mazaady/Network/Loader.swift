//
//  Loader.swift
//  Mazaady
//
//  Created by Aya Baghdadi on 4/12/25.
//

import UIKit

// A class to handle the loading view
class Loader {
    
    static func showLoader(in view: UIView) -> UIView {
        // Create a full-screen white background loader
        let loaderView = UIView(frame: view.frame)
        loaderView.backgroundColor = .white
        loaderView.tag = 1000 // Set a tag for easy removal later
        view.addSubview(loaderView)  // Add loader to the view
        
        // Create the logo image view
        let logoImageView = UIImageView(image: UIImage(named: "logo"))
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        loaderView.addSubview(logoImageView)
        
        // Center the logo image
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: loaderView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: loaderView.centerYAnchor, constant: -40),
            logoImageView.widthAnchor.constraint(equalToConstant: 250), // Increased size
            logoImageView.heightAnchor.constraint(equalToConstant: 150) // Increased size
        ])
        
        // Create the "Loading..." label
        let loadingLabel = UILabel()
        loadingLabel.text = "Loading..."
        loadingLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        loadingLabel.textColor = .gray
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        loaderView.addSubview(loadingLabel)
        
        // Center the label below the logo
        NSLayoutConstraint.activate([
            loadingLabel.centerXAnchor.constraint(equalTo: loaderView.centerXAnchor),
            loadingLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20)
        ])
        
        return loaderView
    }
    
    static func removeLoader(from view: UIView) {
        // Remove loader from the view using the tag
        if let loaderView = view.viewWithTag(1000) {
            loaderView.removeFromSuperview()
        }
    }
}
