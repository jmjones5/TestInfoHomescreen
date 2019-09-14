//
//  ViewController.swift
//  TestInfoHomescreen
//
//  Created by Jones, Jason (Developer) on 09/09/2019.
//  Copyright © 2019 Jones, Jason (Developer). All rights reserved.
//

import UIKit
import DeviceInfoKit

class ViewController: UIViewController {
    @IBOutlet weak var iOSVersion: UILabel!
    @IBOutlet weak var deviceModel: UILabel!
    @IBOutlet weak var isProxied: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        update()
    }
    
    func update() {
        iOSVersion.text  = "iOS Version: \(DeviceInfo.iOSVersion)"
        deviceModel.text = "Device Model: \(DeviceInfo.deviceModel)"
        isProxied.text   = "Proxy Status: \(DeviceInfo.proxyStatus)"
    }
}

