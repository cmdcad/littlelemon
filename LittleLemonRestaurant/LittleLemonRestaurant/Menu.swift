//
//  Menu.swift
//  LittleLemonRestaurant
//
//  Created by Tosin Akinbobuyi on 10/2/23.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack{
            Text("Little Lemon")
                .font(.title)
                .padding()
            Text("Chicago")
                .font(.headline)
            Text("Welcome to Little Lemon")
                .font(.body)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
