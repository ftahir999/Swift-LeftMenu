//
//  ViewController.swift
//  Left Menu
//
//  Created by Farhan Tahir on 5/27/16.
//  Copyright © 2016 ft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dataManager:LeftMenuManager = LeftMenuManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showLeftMenu(sender: AnyObject)
    {
        let controller:LeftMenuViewController = LeftMenuViewController(nibName: "LeftMenuViewController", bundle: nil)
        controller.dataSource = dataManager
        controller.delegate = dataManager
        self.navigationController?.pushViewController(controller, animated: true)        
    }


}

