//
//  Header.swift
//  LittleLemonRestaurant
//
//  Created by Tosin Akinbobuyi on 10/4/23.
//

import SwiftUI

struct Header: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject private var model: Model
    
    var body: some View {
        HStack(alignment:.center){
            Button(action: {
                model.showBackButton.toggle()
                self.presentation.wrappedValue.dismiss()
            })   {
                ZStack{
                    Circle()
                        .fill(Color("CustomGreen"))
                        .frame(width: 35, height: 35)
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
            
            Image("littleLemon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 45)
            
            Spacer()
            
            Image("profile-placeholder-image")
                .resizable()
                .frame(width: 40, height: 40)
        }
        //.background(.gray)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
