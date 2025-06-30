//
//  DeviceInfo.swift
//  DeviceInfoKit
//
//  Created by Jones, Jason (Developer) on 14/09/2019.
//  Copyright © 2019 Jones, Jason (Developer). All rights reserved.
//

import Foundation

public struct DeviceInfo {
    
    public static var iOSVersion: String {
        ProcessInfo().operatingSystemVersionString
    }
    
    public static var deviceModel: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        return deviceModel(for: identifier)
    }
    
    public static var proxyStatus: String {
        guard let unmanagedProxySettings: Unmanaged<CFDictionary> = CFNetworkCopySystemProxySettings() else {
            return ProxyStatus.unknown.rawValue
        }
        
        let proxySettings = unmanagedProxySettings.takeRetainedValue()
        
        guard let proxySettingsAsDictionary: [String : Any] = proxySettings as? [String : Any] else {
            return ProxyStatus.unknown.rawValue
        }
        
        return proxySettingsAsDictionary["HTTPProxy"] != nil ? ProxyStatus.enabled.rawValue : ProxyStatus.disabled.rawValue
    }
    
    private static func deviceModel(for identifier: String) -> String {
        if let deviceInfoFilePath = Bundle(identifier: "jmj.DeviceInfoKit")?.url(forResource: "deviceInfo", withExtension: "json"),
           let jsonData = try? Data(contentsOf: deviceInfoFilePath),
           let deviceInfoModel: [String: String] = try? JSONDecoder().decode([String: String].self, from: jsonData),
           let description = deviceInfoModel[identifier] {
            return description
        }
        
        switch identifier {
            case "i386", "x86_64", "arm64": return "\(deviceModel(for: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
            default:                        return identifier
        }
    }
    
    enum ProxyStatus: String {
        case enabled, disabled, unknown
    }
}
