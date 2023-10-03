import UIKit
import  Foundation

let address = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/littleLemonSimpleMenu.json"
let address2 = "https://cmdcad.github.io/menus.json"
let json = """
[{
      "id": 0,
      "title": "Beer",
      "price": "7"
    },
    {
      "id": 1,
      "title": "Iced Tea",
      "price": "3"
    }
  ]
"""

let decoder = JSONDecoder()
let string = json.utf8
let data = Data(string)

struct Item: Decodable {
    let id:Int
    let title:String
    let price:String
}

let menuItems = try? decoder.decode([Item].self, from: data)

menuItems?.forEach {print($0.title)}



 let url = URL(string: address2)
/*
 guard let url = url else{
    throw NSError()
 }
 */

let request = URLRequest(url: url!)
var urldata:Data!

let  dataTask = URLSession.shared.dataTask(with: request){
    data, response, error in
    if let data = data, let string = String(data: data, encoding: .utf8)
    {
        print(string)
        urldata = data
    }
}
dataTask.resume()


/*let menuItems2 = try? decoder.decode(Array<String>.self, from: urldata)
menuItems?.forEach {print($0)}*/

let jsonString = """
{
 "name" : "John"
}
"""

struct User: Codable {
    let name: String
}

let jsonData = Data(jsonString.utf8)

let decoder2 = JSONDecoder()

let user = try! decoder2.decode(User.self, from: jsonData)

print(user.name)

