//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by MCOMEN on 3/12/16.
//  Copyright © 2016 MCOMEN. All rights reserved.
//

import Foundation

class Videos {
    
    // Data Encapsulation
    private var _vName: String
    private var _vImageUrl: String
    private var _vVideoUrl: String
    
    // This variable gets created from the UI
    var vImageData: NSData?
    
    // My Initializer
    private var artistsNames: String
    
    // Make a getter
    var vName: String {
        return _vName
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
    }
    
    var artist: String {
        return artistsNames
    }
    
    init(data: JSONDictionary) {
        
        // If we do not initialize all properties we will get error message
        // Return from initializer without initializing all stored properties
        
        
        // Artist Names
        if let nameOfArtist = data["im:artist"] as? JSONDictionary,
            artist = nameOfArtist["label"] as? String {
            self.artistsNames = artist
        } else {
            artistsNames = ""
        }
        
        
        // Video Name 
        if let name = data["im:name"] as? JSONDictionary,
            vName = name["label"] as? String {
                self._vName = vName
        } else {
            // You may not always get data back from the JSON - you may want to show error message
            // element in the JSON is unexpected
            _vName = ""
        }
        
        // The Video Image
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDictionary,
            inmage = image["label"] as? String {
                _vImageUrl = inmage.stringByReplacingOccurrencesOfString("100X100", withString: "600X600")
        } else {
            _vImageUrl = ""
        }
        
        // Video URL}
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDictionary,
            vHref = vUrl["attributes"] as? JSONDictionary,
            vVideoUrl = vHref["href"] as? String {
                self._vVideoUrl = vVideoUrl
        } else {
            _vVideoUrl = ""
        }
    }

}