//
//  RepoStatusDone.swift
//  test
//
//  Created by Deepakraj Murugesan on 23/10/18.
//  Copyright © 2018 Noticeboard. All rights reserved.
//

import Foundation
import ObjectMapper

class RepoStatusDone: Mappable{
    var welcome : [WelcomeElement]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        welcome <- map["welcome"]
    }
}
