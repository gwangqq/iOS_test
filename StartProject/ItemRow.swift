//
//  ItemRow.swift
//  StartProject
//
//  Created by 박광규 on 2021/03/17.
//

import SwiftUI
import AdBrixRM
struct ItemRow: View {
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    let item: MenuItem
    var body: some View {
        HStack{
            // image
            Image(item.thumbnailImage)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            
            // name and price
            VStack(alignment: .leading){
                Text(item.name)
                Text("$\(item.price)")
            }
            
            Spacer()
            ForEach(item.restrictions, id:\.self){
                restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
