//
//  PullRequest.swift
//  test
//
//  Created by Deepakraj Murugesan on 23/10/18.
//  Copyright © 2018 Noticeboard. All rights reserved.
//

import Foundation
import ObjectMapper


class PullRequest: Mappable{
    var url, htmlURL: String?
    var diffURL: String?
    var patchURL: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        htmlURL <- map["html_url"]
        diffURL <- map["diff_url"]
        patchURL <- map["patch_url"]
    }
}
