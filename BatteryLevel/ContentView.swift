//
//  ContentView.swift
//  BatteryLevel
//
//  Created by Russell Gordon on 2022-05-08.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    @State var currentBatteryLevel: Float = 0.0
    
    var body: some View {
        VStack {
            Text("Current battery level is: \(currentBatteryLevel)")
        }
        .task {
            
            // Adapted from:
            // https://www.hackingwithswift.com/example-code/uikit/how-to-read-the-battery-level-of-an-iphone-or-ipad
            
            UIDevice.current.isBatteryMonitoringEnabled = true
            currentBatteryLevel = UIDevice.current.batteryLevel
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
