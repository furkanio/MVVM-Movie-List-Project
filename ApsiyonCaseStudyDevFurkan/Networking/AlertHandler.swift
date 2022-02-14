//
//  AlertHandler.swift
//  ApsiyonCaseStudyDevFurkan
//
//  Created by Furkan Yıldız on 19.12.2021.
//

import UIKit
class AlertHandler{
    class func showAlert(vc: UIViewController, title: String?, message: String){
        let alertController = UIAlertController(title: title ?? "", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Strings.shared.okay, style: .cancel, handler: nil))
        vc.present(alertController, animated: true, completion: nil)
    }
}
