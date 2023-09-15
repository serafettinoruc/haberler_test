//
//  ViewController.swift
//  HaberlerTest
//
//  Created by admin on 15.09.2023.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {
    
    private var interstitial: GAMInterstitialAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction
    func loadInterstitial(){
        let request = GAMRequest()
        request.customTargeting?["a3p"] = "Pangle"
        GAMInterstitialAd.load(withAdManagerAdUnitID: "/1007216/ca-mb-app-pub-8718605733307345-tag/Haberler_App_iOS_Interstitial_ALPHA",
                                             request: request,
                                   completionHandler: { [self] ad, error in
                            if let error = error {
                              print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                              return
                            }
                            interstitial = ad
                          }
        )

    }
    
    @IBAction
    func showInterstitial(){
        if interstitial != nil {
          interstitial!.present(fromRootViewController: self)
        } else {
          print("Ad wasn't ready")
        }

    }

}

