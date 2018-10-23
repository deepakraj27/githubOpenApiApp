//
//  OpenIssuesView.swift
//  test
//
//  Created by Deepakraj Murugesan on 24/10/18.
//  Copyright © 2018 Noticeboard. All rights reserved.
//

import UIKit
import SDWebImage

class OpenIssuesView: UITableViewCell {

    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var authorAssociation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func settingDataToCell(openIssue: WelcomeElement){
        userName.text = ""
        userAvatar.image = nil
        number.text = ""
        titleLabel.text = ""
        bodyLabel.text = ""
        authorAssociation.text = ""
        userAvatar.layer.cornerRadius = userAvatar.frame.size.width / 2
        userAvatar.layer.masksToBounds = true

        
        if let user = openIssue.user{
            if let name = user.login{
                userName.text = name
            }
            
            if let url = user.avatarURL{
                //display image from cloud and once it is downloaded load form cache
                userAvatar.sd_setShowActivityIndicatorView(true)
                userAvatar.sd_setImage(with: URL(string: url), placeholderImage: #imageLiteral(resourceName: "placeholder"), options: [SDWebImageOptions.continueInBackground, SDWebImageOptions.lowPriority, SDWebImageOptions.refreshCached, SDWebImageOptions.handleCookies, SDWebImageOptions.retryFailed]) { (image, error, cacheType, url) in
                   
                    self.userAvatar.sd_setShowActivityIndicatorView(false)
                    if error != nil {
                        print("image setting from url is Failed: \(String(describing: error))")
                    }
                }
            }
        }
        
        if let numberVar = openIssue.number{
            self.number.text = String(describing:numberVar)
        }
        
        if let titleText = openIssue.title{
            self.titleLabel.text = titleText.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        
        if let body = openIssue.body{
            self.bodyLabel.text = body.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        
        if let authorType = openIssue.authorAssociation{
            self.authorAssociation.text = authorType.uppercased()
        }
    }

}
