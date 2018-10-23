//
//  Constants.swift
//  test
//
//  Created by Deepakraj Murugesan on 23/10/18.
//  Copyright © 2018 Noticeboard. All rights reserved.
//

import Foundation

struct Constants {
    struct URLS{
        static let base = "https://api.github.com/"
        static let repo = "repos/{ORG_NAME}/{REPO_NAME}/issues"
    }
    
    struct ViewNames{
        static let openIssuesView = "OpenIssuesView"
        static let closedIssuesView = "ClosedIssuesView"
    }
}

