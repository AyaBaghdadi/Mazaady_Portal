//
//  ProfileVC.swift
//  Mazaady
//
//  Created by Aya Baghdadi on 4/12/25.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var languageLbl: UILabel!
    
    @IBOutlet weak var followingLbl: UILabel!
    @IBOutlet weak var followersLbl: UILabel!
    
    @IBOutlet weak var customerImg: UIImageView!
    @IBOutlet weak var customerNmeLbl: UILabel!
    @IBOutlet weak var customerMailLbl: UILabel!
    @IBOutlet weak var customerAddressLbl: UILabel!
    
    @IBOutlet weak var productsHeight: NSLayoutConstraint!
    @IBOutlet weak var adsHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionViewProducts: UICollectionView!
    @IBOutlet weak var collectionViewTopTags: UICollectionView!
    @IBOutlet weak var collectionViewAds: UICollectionView!

    @IBOutlet weak var searchTxt: UITextField!

    var advertisementsArray: [Advertisement] = []
    var ad_height = 190.0
    var product_height = 280.0
    var tagsArray: [Tag] = []
    var productsArray: [Product] = []
    var filteredProductsArray: [Product] = []
    
    let currentLanguage = UserDefaults.standard.stringArray(forKey: "AppleLanguages")?.first ?? "en"

    override func viewDidLoad() {
        super.viewDidLoad()

        if currentLanguage == "ar" {
            
            languageLbl.text = "العربية"

        } else {
            
            languageLbl.text = "English"

        }
        
        self.AssignXIB()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        fetchAllData()
    }
    
    func fetchAllData() {
        // Create a DispatchGroup to handle multiple asynchronous network requests.
        let dispatchGroup = DispatchGroup()
        
        // Define variables to store the responses
        var tags: [Tag]?
        var products: [Product]?
        var advertisements: [Advertisement]?
        var user: User?
        
        // Show the loader
        _ = Loader.showLoader(in: self.view)
        
        // Fetch Tags
        dispatchGroup.enter()  // Enter the group before starting the network request.
        NetworkManager.shared.fetch(from: .tags) { (response: ResponseModel?, error) in
            if let error = error {
                print("Error fetching tags: \(error.localizedDescription)")
            } else {
                tags = response?.tags
            }
            dispatchGroup.leave()  // Leave the group after the request is complete.
        }
        
        // Fetch Products
        dispatchGroup.enter()  // Enter the group before starting the network request.
        NetworkManager.shared.fetchArray(from: .products) { (response: [Product]?, error) in
            if let error = error {
                print("Error fetching products: \(error.localizedDescription)")
            } else {
                products = response
            }
            dispatchGroup.leave()  // Leave the group after the request is complete.
        }
        
        // Fetch Advertisements
        dispatchGroup.enter()  // Enter the group before starting the network request.
        NetworkManager.shared.fetch(from: .advertisements) { (response: AdvertisementsResponse?, error) in
            if let error = error {
                print("Error fetching advertisements: \(error.localizedDescription)")
            } else {
                advertisements = response?.advertisements
            }
            dispatchGroup.leave()  // Leave the group after the request is complete.
        }
        
        // Fetch User
        dispatchGroup.enter()  // Enter the group before starting the network request.
        NetworkManager.shared.fetch(from: .user) { (userResponse: User?, error) in
            if let error = error {
                print("Error fetching user: \(error.localizedDescription)")
            } else {
                user = userResponse
            }
            dispatchGroup.leave()  // Leave the group after the request is complete.
        }
        
        // Once all network requests are completed, this will be called.
        dispatchGroup.notify(queue: .main) {
            // All requests are finished, handle the data here.
            if let tags = tags {
                print("Tags: \(tags)")  // Use the fetched tags data here.
                
                self.tagsArray = tags
                
                self.collectionViewTopTags.reloadData()
                
            }
            if let products = products {
                print("Products: \(products)")  // Use the fetched products data here.
                
                self.productsArray = products
                self.filteredProductsArray = products

                self.collectionViewProducts.reloadData()
                
            }
            if let advertisements = advertisements {
                print("Advertisements: \(advertisements)")  // Use the fetched advertisements data here.
                
                // Store the advertisements in the array
                self.advertisementsArray = advertisements
                
                // Reload the collection view to display advertisements
                self.collectionViewAds.reloadData()
                
            }
            if let user = user {
                print("User: \(user)")  // Use the fetched user data here.
                
                // Assign fetched data to UI components
                if let imageUrl = URL(string: user.image) {
                    // Load the image from the URL into the UIImageView (you can use libraries like SDWebImage or Kingfisher for image caching)
                    self.customerImg.loadImage(from: imageUrl) // Custom extension for image loading
                }
                
                self.customerNmeLbl.text = user.name
                self.customerMailLbl.text = "@\(user.userName)" // Or use user.email if available
                self.customerAddressLbl.text = "\(user.cityName), \(user.countryName)"
                self.followingLbl.text = "\(user.followingCount)"
                self.followersLbl.text = "\(user.followersCount)"
                
            }
            
            // Stop and remove the loader once all requests are complete
            Loader.removeLoader(from: self.view)
            
            // Proceed with UI updates or any other logic.
        }
    }


    @IBAction func ChangeLanguageTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "ChangeLanguageVC") as? ChangeLanguageVC,
              let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }

        vc.view.frame = window.bounds
        vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)

        UIView.transition(with: window, duration: 0.5, options: [.transitionCrossDissolve], animations: {
            window.rootViewController?.addChild(vc)
            window.addSubview(vc.view)
        }, completion: { _ in
            vc.didMove(toParent: window.rootViewController)
        })
    }

    
    @IBAction func SearchTapped(_ sender: Any) {
        let searchText = searchTxt.text ?? ""
        filterProducts(by: searchText)
    }

    
    func filterProducts(by searchText: String) {
        if searchText.isEmpty {
            filteredProductsArray = productsArray
        } else {
            filteredProductsArray = productsArray.filter { product in
                return product.name.lowercased().contains(searchText.lowercased())
            }
        }
        collectionViewProducts.reloadData()
    }

}
