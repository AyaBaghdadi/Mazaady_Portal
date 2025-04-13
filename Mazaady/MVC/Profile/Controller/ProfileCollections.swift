//
//  ProfileCollections.swift
//  Mazaady
//
//  Created by Aya Baghdadi on 4/12/25.
//

import UIKit

extension ProfileVC : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        if collectionView == collectionViewAds {
            adsHeight.constant = (Double(( advertisementsArray.count )) * ad_height)
            return advertisementsArray.count
        }else{
            return tagsArray.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewAds {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AdsCVC
            
            // Get the advertisement for the current index path
            let advertisement = advertisementsArray[indexPath.row]
            
            // Load the image using the loadImage(from:) method from UIImageView extension
            if let imageUrl = URL(string: advertisement.image) {
                cell.imageCell.loadImage(from: imageUrl, loader: cell.loader)
            }
            
            return cell
            
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TagCVC
            
            // Get the advertisement for the current index path
            let tag = tagsArray[indexPath.row]
            cell.titleCell.text = tag.name
            
            return cell
            
        }
    }

    
    func AssignXIB() {
                        
        collectionViewAds.register(UINib(nibName: "Ads", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionViewTopTags.register(UINib(nibName: "Tags", bundle: nil), forCellWithReuseIdentifier: "cell")

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == collectionViewAds {
            let itemWidth = collectionView.bounds.width
            return CGSize(width: itemWidth, height: ad_height)

        } else if collectionView == collectionViewTopTags {
            let tag = tagsArray[indexPath.item]  // your Tag object
            let tagText = tag.name as NSString   // convert to NSString for size calculation

            let font = UIFont.systemFont(ofSize: 14, weight: .medium)
            let size = tagText.size(withAttributes: [.font: font])

            let padding: CGFloat = 32
            let height: CGFloat = 32

            return CGSize(width: size.width + padding, height: height)
        }

        return CGSize(width: 50, height: 50)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
     
        if collectionView == collectionViewAds {
            
            return 0
            
        }else{
            
            return 4
            
        }
        
    }
    
}
