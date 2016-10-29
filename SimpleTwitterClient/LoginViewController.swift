//
//  LoginViewController.swift
//  SimpleTwitterClient
//
//  Created by Nari Shin on 10/27/16.
//  Copyright © 2016 Nari Shin. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginButtonClicked(_ sender: AnyObject) {
        let twitterClient = BDBOAuth1SessionManager(baseURL: URL(string: "https://api.twitter.com")!, consumerKey: "ai5aEFQiMw61P02dayIRRKD46", consumerSecret: "UkVWo97ThxNd0ABAEiYZKEeE3UnJoOPcUxuWAH0k08s2TgFr2O")
        
        twitterClient?.deauthorize()
        twitterClient?.fetchRequestToken(withPath: "/oauth/request_token", method: "GET", callbackURL: URL(string: "twitterdemo://oauth"), scope: nil, success: { (requestToken: BDBOAuth1Credential?) in
            // Setup the authorization url with requestToken
            let url = URL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\((requestToken?.token)!)")!
            // Open the url in mobile safari
            UIApplication.shared.openURL(url)
            
            }, failure: { (error: Error?) in
                print("Error: \(error?.localizedDescription)")
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}
