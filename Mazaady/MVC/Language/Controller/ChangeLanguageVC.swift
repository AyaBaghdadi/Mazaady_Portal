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

        let currentLanguage = UserDefaults.standard.stringArray(forKey: "AppleLanguages")?.first ?? "en"
        if currentLanguage == "ar" {
            
            arabicBtn.setBackgroundImage(UIImage(named: "radio_check"), for: .normal)
            englishBtn.setBackgroundImage(UIImage(named: "radio_un_check"), for: .normal)

        } else {
            
            arabicBtn.setBackgroundImage(UIImage(named: "radio_un_check"), for: .normal)
            englishBtn.setBackgroundImage(UIImage(named: "radio_check"), for: .normal)
            
        }
        
    }

    @IBAction func closeTapped(_ sender: Any) {
        
        UIView.transition(with: self.view, duration: 0.30, options: [.transitionCrossDissolve], animations: {
            self.removeFromParent()
            self.view.removeFromSuperview()
        }, completion: nil)
        
    }
    
    @IBAction func arabicTapped(_ sender: Any) {
        updateLanguage(to: .arabic)
    }

    @IBAction func englishTapped(_ sender: Any) {
        updateLanguage(to: .english)
    }
    
    func updateLanguage(to language: AppLanguage) {
        // Remove language view
        UIView.transition(with: self.view, duration: 0.30, options: [.transitionCrossDissolve], animations: {
            self.removeFromParent()
            self.view.removeFromSuperview()
        }, completion: nil)

        // Save new language
        UserDefaults.standard.set([language.rawValue], forKey: "AppleLanguages")
        UserDefaults.standard.set(language.rawValue, forKey: "selectedLanguage")
        UserDefaults.standard.synchronize()

        // Set direction
        if language == .arabic {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }

        // Set custom bundle language
        Bundle.setLanguage(language.rawValue)

        // Reload root view controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabbarVC")
        
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = vc
            UIView.transition(with: window, duration: 0.5, options: [.transitionCrossDissolve], animations: {}, completion: nil)
        }
    }




}

enum AppLanguage: String {
    case english = "en"
    case arabic = "ar"
}

extension Bundle {
    private static var bundleKey: UInt8 = 0

    static func setLanguage(_ language: String) {
        defer {
            object_setClass(Bundle.main, PrivateBundle.self)
        }
        objc_setAssociatedObject(Bundle.main, &bundleKey, Bundle(path: Bundle.main.path(forResource: language, ofType: "lproj")!), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    private class PrivateBundle: Bundle {
        override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
            guard let bundle = objc_getAssociatedObject(self, &Bundle.PrivateBundle.bundleKey) as? Bundle else {
                return super.localizedString(forKey: key, value: value, table: tableName)
            }
            return bundle.localizedString(forKey: key, value: value, table: tableName)
        }
    }
}

