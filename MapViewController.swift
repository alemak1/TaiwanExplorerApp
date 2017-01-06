//
//  MapViewController.swift
//  CurrencyConverter
//
//  Created by Aleksander Makedonski on 1/6/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import UIKit

class MapViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded the MapView")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("About to load the MapView...")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}
