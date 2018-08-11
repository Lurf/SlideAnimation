//
//  ViewController.swift
//  SlideAnimation
//
//  Created by Lurf on 2018/08/11.
//  Copyright © 2018 Lurf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func go(_ sender: Any) {
        let vc = ResultViewController.instantiate()
        present(vc, animated: true, completion: nil)
    }
    
}

