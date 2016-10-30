//
//  TwitterClient.swift
//  SimpleTwitterClient
//
//  Created by Nari Shin on 10/29/16.
//  Copyright © 2016 Nari Shin. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterClient: BDBOAuth1SessionManager {

    static let sharedInstance = TwitterClient(baseURL: URL(string: "https://api.twitter.com")!, consumerKey: "ai5aEFQiMw61P02dayIRRKD46", consumerSecret: "UkVWo97ThxNd0ABAEiYZKEeE3UnJoOPcUxuWAH0k08s2TgFr2O")
    
    func currentAccount() {
        get("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: { (task: URLSessionDataTask, response: Any?) in
            let userDictionary = response as! NSDictionary
            
            let user = User(dictionary: userDictionary)
            }, failure: { (task: URLSessionDataTask?, error: Error) in
                
        })
    }
    
    func homeTimeline(success: ([Tweet]) -> (), failure: (Error) -> ()) {
        get("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: { (task: URLSessionDataTask, response: Any?) in
            let dictionaries = response as! [NSDictionary]
            
            let tweets = Tweet.TweetsWithArray(dictionaries: dictionaries)
            
            
            }, failure: { (task: URLSessionDataTask?, error: Error) in
                print("Error: \(error.localizedDescription)")
        })
    }
}
