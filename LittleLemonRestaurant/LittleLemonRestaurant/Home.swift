//
//  Home.swift
//  LittleLemonRestaurant
//
//  Created by Tosin Akinbobuyi on 10/2/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView{
            Menu()
                .tag(0)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
