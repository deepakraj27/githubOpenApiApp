//
//  RepoStatusInit.swift
//  test
//
//  Created by Deepakraj Murugesan on 23/10/18.
//  Copyright © 2018 Noticeboard. All rights reserved.
//

import Foundation
import ObjectMapper

class RepoStatusInit: NSObject, Mappable{
    var state : String = "open"
    
    init(state: String) {
        self.state = state
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        state <- map["state"]
    }
    
}
