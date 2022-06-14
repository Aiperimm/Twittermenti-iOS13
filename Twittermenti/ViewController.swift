//
//  ViewController.swift
//  Twittermenti
//
//  Created by Angela Yu on 17/07/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import SwifteriOS
import CoreML

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!
    
    let sentimentClassifier = TweetSentimentClassifier()

  let swifter = Swifter(consumerKey: "9F4Rnej4pW39Dj1FvnFSsneQW", consumerSecret: "tInTcFmb1AXiLEZyyxjpRfvnzbVqqFNwB1Zu4YFFJJ6hZGf6Qb")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let prediction = try! sentimentClassifier.prediction(text:"@Apple is the best company!")
        
        print(prediction.label)
        
        swifter.searchTweet(using: "@Apple", lang: "en", count: 100, tweetMode: .extended, success: { results, searchMetadata in
            //print(results)
            
        }) { error in
            print("There was an error with the Twitter API Request, \(error)")
        }
        
        

        
    }

    @IBAction func predictPressed(_ sender: Any) {
    
    
    }
    
}

