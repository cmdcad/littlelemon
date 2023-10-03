//
//  MenuItem.swift
//  LittleLemonRestaurant
//
//  Created by Tosin Akinbobuyi on 10/2/23.
//

import Foundation

struct JSONmenu:Decodable {
    let menu: [MenuItem]
}

struct MenuItem:Decodable{
    let title:String
    let image:String
    let price:String
}
