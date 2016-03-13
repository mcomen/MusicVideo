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
        
        let task = session.dataTaskWithURL(url){
            (data, response, error) -> Void in
            
            if error != nil {
                dispatch_async(dispatch_get_main_queue()) {
                    completion(result: (error!.localizedDescription))
                }
            } else {
                // Added for JSONSerialization
                print(data)
                
                do {
                    // AllowFragments - top levelobject is not Array or Dictionary.
                    // Any type of Value
                    // NSJSONSerialization requires the Do / Try / Catch
                    // Converts NSData into JSON object and cast it into a dictionary
                    
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? JSONDictionary {
                        
                        // Print
                        print(json)
                        
                        let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                        dispatch_async(dispatch_get_global_queue(priority, 0)) {
                            dispatch_async(dispatch_get_main_queue()) {
                                completion(result: "Successful JSONSerialization")
                            }
                        }
                        // End of Serialization
                    }
                } catch {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(result: "Error in JSONSerialization")
                    }
                  }
                
                }
            }
        task.resume() 
        }
    
}
