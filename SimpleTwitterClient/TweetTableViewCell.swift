//
//  TweetTableViewCell.swift
//  SimpleTwitterClient
//
//  Created by Nari Shin on 10/30/16.
//  Copyright © 2016 Nari Shin. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userHandle: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var tweetBody: UILabel!
    
    var tweet: Tweet! {
        didSet {
            
            userName.text = tweet.user?.name
            if let handle = tweet.user?.screenname {
                userHandle.text = "@" + handle
            }
            //timeStamp.text = tweet.timestamp
            tweetBody.text = tweet.text

            if let imageUrl = tweet.user?.profileUrl {
                profileImage.setImageWith(imageUrl)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
