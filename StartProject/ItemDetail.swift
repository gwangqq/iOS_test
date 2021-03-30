//
//  ItemDetail.swift
//  StartProject
//
//  Created by 박광규 on 2021/03/20.
//

import SwiftUI
import AdBrixRM

struct ItemDetail: View {
    // Create adbrix Instance
    let adBrix = AdBrixRM.getInstance
    
    // If you wnat to share something on your app, you have to use environmentObject
    @EnvironmentObject var order: Order
    let item: MenuItem
    
    var body: some View {
        
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
           
            Text(item.description)
                .padding()
            
            Button("Order This"){
                
                // when Order This Button is clicked
                print("custom event: click_order_this_button succeed!!!!!!!!")
              // Addtional event parameter
                let attrModel = AdBrixRmAttrModel()
                    attrModel.setAttrDataString("food_name", item.name)
                    attrModel.setAttrDataInt("food_price", item.price)
                adBrix.eventWithAttr(eventName: "click_order_this_button", value: attrModel)
                order.add(item: item)
            }
            .font(.headline)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
            }
        }
}
