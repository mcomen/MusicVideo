//
//  ViewController.swift
//  MusicVideo
//
//  Created by MCOMEN on 3/12/16.
//  Copyright © 2016 MCOMEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)
    }
    
    func didLoadData(result: String) {
        
        // Setting Up AlertView
        let alert = UIAlertController(title: (result), message: nil, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "Okay", style: .Default) { action -> Void in
            // Do something if you want
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            // Do something if you want
        }
        
        alert.addAction(okAction)
        alert.addAction(cancel)
        self.presentViewController(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

