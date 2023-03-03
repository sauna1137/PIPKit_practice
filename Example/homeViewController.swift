//
//  homeViewController.swift
//  Example
//
//  Created by KS on 2023/03/02.
//

import UIKit
import PIPKit

class homeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tap3rd(_ sender: Any) {
        PIPKit.show(with: PIPXibTestViewController.viewController())
    }


}
