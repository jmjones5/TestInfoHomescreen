//
//  TodayViewController.swift
//  Widget
//
//  Created by Jones, Jason (Developer) on 14/09/2019.
//  Copyright © 2019 Jones, Jason (Developer). All rights reserved.
//

import UIKit
import DeviceInfoKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var iOSVersion: UILabel!
    @IBOutlet weak var deviceModel: UILabel!
    @IBOutlet weak var isProxied: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        update()
        completionHandler(NCUpdateResult.newData)
    }
    
    func update() {
        iOSVersion.text  = "iOS Version: \(DeviceInfo.iOSVersion)"
        deviceModel.text = "Device Model: \(DeviceInfo.deviceModel)"
        isProxied.text   = "Proxy Status: \(DeviceInfo.proxyStatus)"
    }
    
}
