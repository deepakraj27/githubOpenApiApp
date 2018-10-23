//
//  ClosedIssueVC.swift
//  test
//
//  Created by Deepakraj Murugesan on 24/10/18.
//  Copyright © 2018 Noticeboard. All rights reserved.
//

import UIKit

class ClosedIssueVC: UIViewController {
    var welcomeElementList = [WelcomeElement]()
    @IBOutlet weak var closeIssueslist: UITableView!
    @IBOutlet weak var noDataView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func pageData(_ welcomeElements: [WelcomeElement]){
        welcomeElementList = welcomeElements
        if welcomeElementList.count > 0{
            self.noDataView.isHidden = true
            self.closeIssueslist.isHidden = false
            self.closeIssueslist.delegate = self
            self.closeIssueslist.dataSource = self
            self.closeIssueslist.estimatedRowHeight = 50
            self.closeIssueslist.rowHeight = UITableView.automaticDimension
            self.closeIssueslist.reloadData()
        }else{
            self.closeIssueslist.isHidden = true
            self.noDataView.isHidden = false
            //show no issues text and remove the tableview
        }
    }
}

extension ClosedIssueVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return welcomeElementList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ViewNames.closedIssuesView ,for: indexPath) as? ClosedIssuesView {
            let eachIssue = welcomeElementList[indexPath.row]
            cell.settingDataToCell(closedIssue: eachIssue)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}
