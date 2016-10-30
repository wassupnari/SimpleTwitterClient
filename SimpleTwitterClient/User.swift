//
//  User.swift
//  SimpleTwitterClient
//
//  Created by Nari Shin on 10/29/16.
//  Copyright © 2016 Nari Shin. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var name: String?
    var screenname: String?
    var profileUrl: URL?
    var tagline: String?

    init(dictionary: NSDictionary) {
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        let profileUrlString = dictionary["profile_image_url_https"] as? String
        // Execute this line if the profileUrlString is not nil
        if let profileUrlString = profileUrlString {
            profileUrl = URL(string: profileUrlString)
        }
        tagline = dictionary["description"] as? String
    }
}
