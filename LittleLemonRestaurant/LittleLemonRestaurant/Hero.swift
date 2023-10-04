//
//  Hero.swift
//  LittleLemonRestaurant
//
//  Created by Tosin Akinbobuyi on 10/4/23.
//

import SwiftUI

struct Hero: View {
    @EnvironmentObject var model:Model
    
    var body: some View {
        if model.showHero {
            VStack{
                Group{
                    HStack{
                        Text("Little Lemon")
                            .font(.title)
                            .foregroundColor(Color("CustomYellow"))
                            .bold()
                            Spacer()
                    }
                    .padding(.bottom, 5)
                                      
                    HStack{
                    Text("Chicago")
                        .font(.title2)
                        .foregroundColor(.white)
                        .bold()
                        Spacer()
                    }
                                     
                    HStack{
                        Text("We are famaily owned Mediteranean restaurant, focused on traditional recipes served with a modern twist")
                            .foregroundColor(.white)
                        Image("logo-waiter")
                            .frame(width: 100, height: 100)
                            .padding()
                    }

                }
                .padding(.horizontal)
            }
        }
    }
}

struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero()
        .environmentObject(Model())
    }
}
