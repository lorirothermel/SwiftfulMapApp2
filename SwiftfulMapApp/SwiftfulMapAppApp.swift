//
//  SwiftfulMapAppApp.swift
//  SwiftfulMapApp
//
//  Created by Lori Rothermel on 5/12/23.
//

import SwiftUI

@main
struct SwiftfulMapAppApp: App {
    @StateObject private var vm = LocationViewModel()

    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
            
        }  // WindowGroup
    }  // some Scene
}  // SwiftfulMapAppApp
