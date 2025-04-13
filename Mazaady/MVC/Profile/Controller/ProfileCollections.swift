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
        }else if collectionView == collectionViewTopTags {
            return tagsArray.count
        }else{
            let additionalHeight = (filteredProductsArray.count % 3 != 0) ? product_height + 8 : 0
            self.productsHeight.constant = CGFloat((Double((filteredProductsArray.count / 3)) * product_height  + 8) + additionalHeight)
            return filteredProductsArray.count
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
            
        }else if collectionView == collectionViewTopTags {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TagCVC
            
            let tag = tagsArray[indexPath.row]
            cell.titleCell.text = tag.name
            
            return cell
            
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductsCVC
            
            let product = filteredProductsArray[indexPath.row]
            
            if let imageUrl = URL(string: product.image) {
                cell.imageCell.loadImage(from: imageUrl)
            }
            cell.titleCell.text = product.name
            cell.priceCell.text = "\(product.price) \(product.currency)"
            cell.currenPriceCell.text = "\(product.offer ?? 0) \(product.currency)"
            cell.offerPriceCell.text = "\(product.price)"
            if product.offer == nil {
                cell.offerViewCell.isHidden = true
            }else{
                cell.offerViewCell.isHidden = false
            }

            if let remainingSeconds = product.endDate {
                let timeInterval = TimeInterval(remainingSeconds)
                if timeInterval > 0 {
                    cell.counterViewCell.isHidden = false

                    let days = Int(timeInterval) / 86400
                    let hours = (Int(timeInterval) % 86400) / 3600
                    let minutes = (Int(timeInterval) % 3600) / 60

                    cell.Dcell.text = "\(days)"
                    cell.Hcell.text = "\(hours)"
                    cell.MCell.text = "\(minutes)"
                } else {
                    // Already ended
                    cell.counterViewCell.isHidden = true
                }
            } else {
                // No end date
                cell.counterViewCell.isHidden = true
            }


            return cell
            
        }
    }

    
    func AssignXIB() {
                        
        collectionViewAds.register(UINib(nibName: "Ads", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionViewTopTags.register(UINib(nibName: "Tags", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionViewProducts.register(UINib(nibName: "Products", bundle: nil), forCellWithReuseIdentifier: "cell")

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
            
        } else if collectionView == collectionViewProducts {
            
            let itemWidth = collectionView.bounds.width / 3 - 8
            return CGSize(width: itemWidth, height: product_height)
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
