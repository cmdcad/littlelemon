//
//  CheckBox.swift
//  LittleLemonRestaurant
//
//  Created by Tosin Akinbobuyi on 10/4/23.
//

import SwiftUI

struct CheckBox: View {
    @State var isChecked:Bool
    @State var text:String
    
    var body: some View {
        Button(action: {isChecked.toggle()}){
            HStack{
                ZStack{
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color("CustomGreen"))
                    .frame(width:22, height: 22)
                    if isChecked {
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                    }
                }
                Text(text)
                Spacer()
            }
        }
        .foregroundColor(.black)
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox(isChecked: false, text: "some text")
    }
}
