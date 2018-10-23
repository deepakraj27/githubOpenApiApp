//
//  WelcomeElement.swift
//  test
//
//  Created by Deepakraj Murugesan on 23/10/18.
//  Copyright © 2018 Noticeboard. All rights reserved.
//

import Foundation
import ObjectMapper

class WelcomeElement: Mappable{
    var url, repositoryURL: String?
    var labelsURL: String?
    var commentsURL, eventsURL, htmlURL: String?
    var id: Int?
    var nodeID: String?
    var number: Int?
    var title: String?
    var user: User?
    var labels: [Label]?
    var state: String?
    var locked: Bool = false
    var assignee: User?
    var assignees: [User]?
    var comments: Int?
    var authorAssociation: String?
    var pullRequest: PullRequest?
    var body: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        repositoryURL <- map["repository_url"]
        labelsURL <- map["labels_url"]
        commentsURL <- map["comments_url"]
        eventsURL <- map["events_url"]
        htmlURL <- map["html_url"]
        id <- map["id"]
        nodeID <- map["node_id"]
        number <- map["number"]
        title <- map["title"]
        user <- map["user"]
        labels <- map["labels"]
        state <- map["state"]
        locked <- map["locked"]
        assignee <- map["assignee"]
        assignees <- map["assignees"]
        comments <- map["comments"]
        authorAssociation <- map["author_association"]
        pullRequest <- map["pull_request"]
        body <- map["body"]
    }
}
