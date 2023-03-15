//
//  SwiftUIMapApp.swift
//  SwiftUIMap
//
//  Created by 강준영 on 2023/03/16.
//

import SwiftUI

@main
struct SwiftUIMapApp: App {
    @StateObject private var viewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(viewModel)
        }
    }
}
