//
//  APIManager.swift
//  MusicVideo
//
//  Created by MCOMEN on 3/12/16.
//  Copyright © 2016 MCOMEN. All rights reserved.
//

import Foundation

class APIManager {
   
    func loadData(urlString: String, completion: (result: String) -> Void) {
        
        // Offline Mode
        let configuration = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: configuration)
        
//        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url) {
            (data, response, error) -> Void in
            
            dispatch_async(dispatch_get_main_queue()) {
                if error != nil {
                    completion(result: (error!.localizedDescription))
                } else {
                    completion(result: "Successful NSURLSession")
                    print(data)
                }
            }
        }
        task.resume()
    }
}
