//
//  SampleView.swift
//  LittleLemonRestaurant
//
//  Created by Tosin Akinbobuyi on 10/4/23.
//

import SwiftUI

struct SampleView: View {
    var body: some View {
        TabView {
                   Rectangle()
                       .tabItem {
                           Image(systemName: "1.circle")
                           Text("First")
                       }
                   Text("Second View")
                       .tabItem {
                           Image(systemName: "2.circle")
                           Text("Second")
                       }
               }
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
    }
}
