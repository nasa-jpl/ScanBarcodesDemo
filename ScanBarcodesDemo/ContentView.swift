//
//  ContentView.swift
//  ScanBarcodesDemo
//
//  Created by Mark Powell on 12/8/21.
//

import SwiftUI

struct ContentView: View {
    @State var flashlightOn = false
    @State var zoomLevel = 1

    var body: some View {
        NavigationView {
            NavigationLink(
                destination: ScanView(
                    flashlightOn: $flashlightOn,
                    zoomLevel: $zoomLevel
                )
            ) {
                Text("Begin Scanning")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
