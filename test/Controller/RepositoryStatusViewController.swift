//
//  ViewController.swift
//  test
//
//  Created by Deepakraj Murugesan on 23/10/18.
//  Copyright © 2018 Noticeboard. All rights reserved.
//

import UIKit

class RepositoryStatusViewController: UIViewController {
    @IBOutlet weak var openStatusView: UIView!
    @IBOutlet weak var closeStatusView: UIView!
    
    @IBOutlet weak var logoutButtonOutlet: UIButton!
    @IBOutlet weak var segmentedTabs: UISegmentedControl!
    var orgName: String?
    var repoName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginData : [String: String] = UserDefaults.standard.value(forKey: "loginData") as! [String : String]
        orgName = loginData["orgName"]
        repoName = loginData["repoName"]
        
        self.segmentedTabs.isHidden = true
        self.logoutButtonOutlet.isHidden = true
        self.openStatusView.isHidden = true
        self.closeStatusView.isHidden = true
        
        //initially open status is fetched
        self.getOpenRepoStats()
    }
    
    
    func getOpenRepoStats(){
        Utils.addHudToCustomView(View: self.view)
        let repoStatusInit = RepoStatusInit(state: "open")
        Handler.getTasksList(orgName: orgName ?? "", repoName: repoName ?? "", queryParams: repoStatusInit, withSuccess: { (response: [WelcomeElement]) in
            Utils.hideHudToCustomView(View: self.view)
            self.segmentedTabs.isHidden = false
            self.openStatusView.isHidden = false
            self.logoutButtonOutlet.isHidden = false
            self.closeStatusView.isHidden = true
            
            let openVc = self.children[0] as! OpenIssuesVC
            openVc.pageData(response)
        }, withFailure: {(err: Error) in
            Utils.hideHudToCustomView(View: self.view)
            self.segmentedTabs.isHidden = false
            self.openStatusView.isHidden = false
            self.logoutButtonOutlet.isHidden = false
            self.closeStatusView.isHidden = true
            // In failure case please pass empty response to render a empty page
            let openVc = self.children[0] as! OpenIssuesVC
            openVc.pageData([WelcomeElement]())
            print("Failure in fetching details for status")
        })
    }
    
    
    @IBAction func logoutAction(_ sender: Any) {
        //wipe the data and sync... if not, the data will not be wiped
        UserDefaults.standard.removeObject(forKey: "loginData")
        UserDefaults.standard.synchronize()
        
        let authScreen = MyStoryboard.Main.instance.instantiateViewController(withIdentifier: AuthViewController.storyboardID) as! AuthViewController
        
        let navigationController = UINavigationController(rootViewController: authScreen)
        navigationController.navigationBar.isHidden = true
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let mainWindow = appDelegate.window{
            mainWindow.rootViewController = navigationController
            mainWindow.makeKeyAndVisible()
        }
    }
    
    func getCloseRepoStats(){
        Utils.addHudToCustomView(View: self.view)
        let repoStatusInit = RepoStatusInit(state: "closed")
        Handler.getTasksList(orgName: orgName ?? "", repoName: repoName ?? "", queryParams: repoStatusInit, withSuccess: { (response: [WelcomeElement]) in
            Utils.hideHudToCustomView(View: self.view)
            self.segmentedTabs.isHidden = false
            self.openStatusView.isHidden = true
            self.closeStatusView.isHidden = false
            self.logoutButtonOutlet.isHidden = false
            
            let closeVc = self.children[1] as! ClosedIssueVC
            closeVc.pageData(response)
        }, withFailure: {(err: Error) in
            Utils.hideHudToCustomView(View: self.view)
            self.segmentedTabs.isHidden = false
            self.openStatusView.isHidden = true
            self.closeStatusView.isHidden = false
            self.logoutButtonOutlet.isHidden = false
            // In failure case please pass empty response to render a empty page
            let closeVc = self.children[1] as! ClosedIssueVC
            closeVc.pageData([WelcomeElement]())
            print("Failure in fetching details for status")
        })
    }
    
    
    @IBAction func pageChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            self.openStatusView.isHidden = false
            self.closeStatusView.isHidden = true
            self.getOpenRepoStats()
        }else{
            self.openStatusView.isHidden = true
            self.closeStatusView.isHidden = false
            self.getCloseRepoStats()
        }
    }
}

