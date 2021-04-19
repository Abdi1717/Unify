//
//  CustomTabBarController.swift
//  Unify
//
//  Created by Abdinajib Mohamed on 4/19/21.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController
{
    @IBInspectable var initialIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = initialIndex
    }
}
