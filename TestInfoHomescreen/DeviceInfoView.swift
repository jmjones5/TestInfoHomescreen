//
//  DeviceInfoView.swift
//  TestInfoHomescreen
//
//  Created by Jason Jones on 19/06/2025.
//  Copyright © 2025 Jones, Jason (Developer). All rights reserved.
//

import SwiftUI
import DeviceInfoKit

struct DeviceInfoView: View {
    var body: some View {
        VStack {
            Image("Logo")
            
            Text("OS: \(DeviceInfo.iOSVersion)")
                .foregroundColor(.white).font(Font.custom("DIN Alternate Bold", size: 25))
            Text("Device: \(DeviceInfo.deviceModel)")
                .foregroundColor(.white).font(Font.custom("DIN Alternate Bold", size: 25))
            Text("Proxy Status: \(DeviceInfo.proxyStatus)")
                .foregroundColor(.white).font(Font.custom("DIN Alternate Bold", size: 25))
            Button("Privacy Policy") {
                if let privacyPolicyURL = URL(string: "https://jasonable.com/iosdeviceinfo/privacypolicy"),
                    UIApplication.shared.canOpenURL(privacyPolicyURL) {
                    UIApplication.shared.open(privacyPolicyURL)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

#Preview {
    DeviceInfoView()
}
