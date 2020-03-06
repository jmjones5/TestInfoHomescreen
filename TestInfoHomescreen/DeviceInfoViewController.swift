//
//  DeviceInfoViewController.swift
//  TestInfoHomescreen
//
//  Created by Jones, Jason (Developer) on 09/09/2019.
//  Copyright © 2019 Jones, Jason (Developer). All rights reserved.
//

import UIKit
import DeviceInfoKit

class DeviceInfoViewController: UIViewController {
    @IBOutlet weak var iOSVersion: UILabel!
    @IBOutlet weak var deviceModel: UILabel!
    @IBOutlet weak var isProxied: UILabel!
    @IBOutlet weak var privacyPolicyButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        update()
    }   
    
    func update() {
        iOSVersion.text  = "OS: \(DeviceInfo.iOSVersion)"
        deviceModel.text = "Device: \(DeviceInfo.deviceModel)"
        isProxied.text   = "Proxy Status: \(DeviceInfo.proxyStatus)"
    }
    
    @IBAction func privacyPolicyPressed(_ sender: Any) {
        if let privacyPolicyURL = URL(string: "https://jasonable.com/iosdeviceinfo/privacypolicy"),
            UIApplication.shared.canOpenURL(privacyPolicyURL) {
            UIApplication.shared.openURL(privacyPolicyURL)
        }
    }
}

