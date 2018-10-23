//
//  Utils.swift
//  test
//
//  Created by Deepakraj Murugesan on 23/10/18.
//  Copyright © 2018 Noticeboard. All rights reserved.
//

import Foundation
import MBProgressHUD

class Utils{
    // Usage: NBUtils.showToast(message:"test")
    class func showToast(message:String, isShort: Bool){
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let label = UILabel(frame: CGRect(x: 15, y: 5, width: 300, height: 45))
        label.textAlignment = NSTextAlignment.center
        label.text = message
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textColor = UIColor.white
        
        label.numberOfLines = 0
        
        // Label size calculation
        let maximumLabelSize = CGSize(width: 50, height: 50)
        let expectedLabelSize: CGSize = message.boundingRect(with: maximumLabelSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: label.font], context: nil).size
        
        var newFrame = label.frame
        newFrame.size.height = expectedLabelSize.height
        label.frame = newFrame
        label.sizeToFit()
        
        //Background View
        let widthToastView = label.frame.size.width + 30
        let heightToastView =  label.frame.size.height + 10
        
        let toastView = UIView()
        toastView.frame = CGRect(x: (appDelegate.window?.center.x)! - widthToastView/2, y: appDelegate.window!.frame.size.height - 100, width: widthToastView, height: heightToastView)
        toastView.alpha = 1
        toastView.backgroundColor = UIColor.darkGray
        toastView.layer.cornerRadius = toastView.frame.size.height / 2
        toastView.layer.masksToBounds = true
        
        //Add label to Toastview
        //Add toast view to mainView
        toastView.addSubview(label)
        appDelegate.window!.addSubview(toastView)
        
        
        let duration = isShort ? 1500 : 2500
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(duration)) {
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseOut, animations: {
                    toastView.alpha = 0
                }, completion: {(isCompleted) in
                    toastView.removeFromSuperview()
                })
            }
        }
    }
    
    
    class func addHudToCustomView(View: UIView){
        let hud = MBProgressHUD.showAdded(to: View, animated: true)
        hud.bezelView.color = UIColor.clear
        hud.bezelView.backgroundColor = UIColor.clear
        hud.bezelView.style = .solidColor
    }
    
    class func hideHudToCustomView(View: UIView?){
        if let view = View{
            MBProgressHUD.hide(for: view, animated: true)
        }
    }
}
