//
//  Handler.swift
//  test
//
//  Created by Deepakraj Murugesan on 23/10/18.
//  Copyright © 2018 Noticeboard. All rights reserved.
//

import Foundation
import ObjectMapper

class Handler{
    class func getTasksList(orgName: String, repoName: String , queryParams: RepoStatusInit ,withSuccess success: @escaping(_ res: [WelcomeElement]) -> (), withFailure failure:@escaping (_ err:Error) -> ()){
        //        NetworkManager.manager.requestUrl(url: Router.getRepoDetails(orgName: orgName, repoName: repoName, queryParams: queryParams.toJSON()), withSuccess:{(response: RepoStatusDone) in
        //            success(response)
        //        }, withFailure: {(err: Error) in
        //            print("Failure in fetching tasks", err.localizedDescription)
        //            failure(err)
        //        })
        NetworkManager.manager.requestUrlJSON(url: Router.getRepoDetails(orgName: orgName, repoName: repoName, queryParams: queryParams.toJSON()), withSuccess: { (response: String) in
            print("success: ", response)
            success(Mapper<WelcomeElement>().mapArray(JSONString: response)!)
            
        }, withFailure: {(err: Error) in
            print("Failure in fetching tasks", err.localizedDescription)
            failure(err)
        })
    }
}
