//
//  MainNavigationController.swift
//  ApsiyonCaseStudyDevFurkan
//
//  Created by Furkan Yıldız on 19.12.2021.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setViewControllers([ListViewController()], animated: false)

    }
    


}
