//
//  Router.swift
//  test
//
//  Created by Deepakraj Murugesan on 23/10/18.
//  Copyright © 2018 Noticeboard. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

enum Router: URLRequestConvertible {
    case getRepoDetails(orgName: String, repoName: String, queryParams: Parameters)
    
    var method: HTTPMethod{
        switch self {
        case .getRepoDetails:
            return .get
        }
    }
    
    var path: String{
        switch self {
        case .getRepoDetails(let orgName, let repoName, _):
            var getRepoDetailsURL = Constants.URLS.repo.replacingOccurrences(of: "{ORG_NAME}", with: orgName, options: .literal, range: nil)
            getRepoDetailsURL = getRepoDetailsURL.replacingOccurrences(of: "{REPO_NAME}", with: repoName, options: .literal, range: nil)
            print("get repo details: ", getRepoDetailsURL)
            return getRepoDetailsURL
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.URLS.base.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = 60
        
        switch self {
        case .getRepoDetails(_ , _ , let queryParams):
            urlRequest = try URLEncoding.queryString.encode(urlRequest, with: queryParams)
        }
        return urlRequest
    }
}
