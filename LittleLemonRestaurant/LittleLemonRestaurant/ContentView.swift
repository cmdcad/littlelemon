//
//  ContentView.swift
//  LittleLemonRestaurant
//
//  Created by Tosin Akinbobuyi on 10/2/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model = Model()
    
    var body: some View {
        VStack{
            Onboarding()
            Spacer()
        }
        .environmentObject(Model())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
