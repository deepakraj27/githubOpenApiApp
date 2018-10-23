//
//  AuthViewController.swift
//  test
//
//  Created by Deepakraj Murugesan on 23/10/18.
//  Copyright © 2018 Noticeboard. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var orgNametextField: UITextField!
    @IBOutlet weak var repositoryNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //testing data
//        orgNametextField.text = "prestodb"
//        repositoryNameTextField.text = "presto"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backgroundTap(_ sender: Any) {
        self.view.endEditing(true)
    }
    

    @IBAction func continueButtonAction(_ sender: Any) {
        self.view.endEditing(true)
        if let orgText = self.orgNametextField.text, let repoText = self.repositoryNameTextField.text{
            if !orgText.isEmpty && !repoText.isEmpty{
                //allow to go to next page and form the url
                let data: [String: String] = ["orgName": orgText.trimmingCharacters(in: .whitespacesAndNewlines), "repoName": repoText.trimmingCharacters(in: .whitespacesAndNewlines)]
                UserDefaults.standard.set(data, forKey: "loginData")
                
               let repoStatusVc = MyStoryboard.Main.instance.instantiateViewController(withIdentifier: RepositoryStatusViewController.storyboardID) as! RepositoryStatusViewController
                //remove white spaces if any
//                repoStatusVc.orgName = orgText.trimmingCharacters(in: .whitespacesAndNewlines)
//                repoStatusVc.repoName = repoText.trimmingCharacters(in: .whitespacesAndNewlines)
                self.navigationController?.pushViewController(repoStatusVc, animated: true)
            }else{
                //show toast message to user to make him/ her to enter all the fields
                Utils.showToast(message: "Enter both the values to proceed forward", isShort: true)
            }
        }
    }
}
