//
//  SpyNavigationController.swift
//  PhotoAppTests
//
//  Created by Moe Steinmueller on 13.07.22.
//

import UIKit

class SpyNavigationController: UINavigationController {
    
    var pushedViewController: UIViewController!
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        
        pushedViewController = viewController
    }
}
