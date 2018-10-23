//
//  NetworkManager.swift
//  test
//
//  Created by Deepakraj Murugesan on 23/10/18.
//  Copyright © 2018 Noticeboard. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper


class NetworkManager: SessionManager {
    // MARK: - sharedInstance
    static let sharedInstance: NetworkManager = NetworkManager()
    static let manager: NetworkManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpMaximumConnectionsPerHost = 20
        let manager = NetworkManager(configuration: configuration)
        return manager
    }()

    // MARK: - requestUrl
    func requestUrlJSON(url: URLRequestConvertible, withSuccess success:@escaping (_ response: String) -> (), withFailure failure:@escaping (_ error: Error) -> ()) {
        print("url in network manager:", url.urlRequest?.url?.absoluteString ?? "no url string")
        
        NetworkManager.manager.request(url).validate().responseString(encoding: String.Encoding.utf8) { response in
            guard response.result.isSuccess else{
                failure(response.error!)
                return
            }
            
            guard let json = response.result.value as? String else {
                print("Malformed data received")
                failure(response.error!)
                return
            }
            
            success(json)
        }
    }
    
}
