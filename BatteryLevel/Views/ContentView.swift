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
    
    // Will be populated with the current device orientation
    @State private var orientation = UIDeviceOrientation.unknown
    
    var body: some View {
        VStack {
            Text("Current battery level is: \(currentBatteryLevel)")
            
            Group {
                if orientation.isPortrait {
                    Text("Portrait")
                } else if orientation.isLandscape {
                    Text("Landscape")
                } else if orientation.isFlat {
                    Text("Flat")
                } else {
                    Text("Unknown")
                }
            }
            // Uses the custom view modifier to receive the notifications for when the device orientation has changed
            .onRotate { newOrientation in
                orientation = newOrientation
            }
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
