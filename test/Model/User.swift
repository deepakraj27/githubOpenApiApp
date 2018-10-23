//
//  User.swift
//  test
//
//  Created by Deepakraj Murugesan on 23/10/18.
//  Copyright © 2018 Noticeboard. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable{
    var login: String?
    var id: Int?
    var nodeID: String?
    var avatarURL: String?
    var gravatarID: String?
    var url, htmlURL, followersURL: String?
    var followingURL, gistsURL, starredURL: String?
    var subscriptionsURL, organizationsURL, reposURL: String?
    var eventsURL: String?
    var receivedEventsURL: String?
    var type: String?
    var siteAdmin: Bool?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        login <- map["login"]
        id <- map["id"]
        nodeID <- map["node_id"]
        avatarURL <- map["avatar_url"]
        gravatarID <- map["gravatar_id"]
        url <- map["url"]
        htmlURL <- map["html_url"]
        followersURL <- map["followers_url"]
        followingURL <- map["following_url"]
        gistsURL <- map["gists_url"]
        starredURL <- map["starred_url"]
        subscriptionsURL <- map["subscriptions_url"]
        organizationsURL <- map["organizations_url"]
        reposURL <- map["repos_url"]
        eventsURL <- map["events_url"]
        receivedEventsURL <- map["received_events_url"]
        type <- map["type"]
        siteAdmin <- map["site_admin"]
    }
}
