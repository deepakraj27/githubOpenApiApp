//
//  OpenIssuesVC.swift
//  test
//
//  Created by Deepakraj Murugesan on 24/10/18.
//  Copyright © 2018 Noticeboard. All rights reserved.
//

import UIKit

class OpenIssuesVC: UIViewController {
    @IBOutlet weak var noDataView: UILabel!
    @IBOutlet weak var openIssueslist: UITableView!
    var welcomeElementList = [WelcomeElement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func pageData(_ welcomeElements: [WelcomeElement]){
        welcomeElementList = welcomeElements
        if welcomeElementList.count > 0{
            self.noDataView.isHidden = true
            self.openIssueslist.isHidden = false
            self.openIssueslist.delegate = self
            self.openIssueslist.dataSource = self
            self.openIssueslist.estimatedRowHeight = 50
            self.openIssueslist.rowHeight = UITableView.automaticDimension
            self.openIssueslist.reloadData()
        }else{
            self.openIssueslist.isHidden = true
            self.noDataView.isHidden = false
            //show no issues text and remove the tableview
        }
    }
}

extension OpenIssuesVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return welcomeElementList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ViewNames.openIssuesView ,for: indexPath) as? OpenIssuesView {
            let eachIssue = welcomeElementList[indexPath.row]
            cell.settingDataToCell(openIssue: eachIssue)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}
