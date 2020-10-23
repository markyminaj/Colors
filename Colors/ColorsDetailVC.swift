//
//  ColorsDetailVC.swift
//  Colors
//
//  Created by Mark Martin on 8/25/20.
//  Copyright © 2020 Mark Martin. All rights reserved.
//

import UIKit

class ColorsDetailVC: UIViewController {

    var color: UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? .blue
    }
}
