//
//  Label.swift
//  test
//
//  Created by Deepakraj Murugesan on 23/10/18.
//  Copyright © 2018 Noticeboard. All rights reserved.
//

import Foundation
import ObjectMapper

class Label: Mappable{
    var id: Int?
    var nodeID: String?
    var url: String?
    var name: String?
    var color: String?
    var labelDefault: Bool?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        nodeID <- map["node_id"]
        url <- map["url"]
        name <- map["name"]
        color <- map["color"]
        labelDefault <- map["default"]
    }
}
