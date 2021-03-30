//
//  CheckOutView.swift
//  StartProject
//
//  Created by 박광규 on 2021/03/22.
//

import SwiftUI
import AdBrixRM

struct CheckOutView: View {
    // Create AdBrixRM Instance
    
    @EnvironmentObject var order: Order
    // paymennt types
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    
    
    let tipAmounts = [10, 15, 20, 25, 0]
    
    var totalPrice: String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay?", selection: $paymentType){
                    ForEach(paymentTypes, id: \.self){
                        Text($0)
                    }
                }
                Toggle("Add iDine loyalty card", isOn:$addLoyaltyDetails.animation())
                if addLoyaltyDetails{
                    TextField("Enter your iDine ID", text:$loyaltyNumber)
                }
                
            }
            Section(header: Text("Add a tip?")){
                Picker("Percentage:", selection: $tipAmount){
                    ForEach(tipAmounts, id:\.self){
                        Text("\($0)")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("TOTAL: \(totalPrice)")
                        .font(.largeTitle)
            ){
                Button("Confirm Order"){
                    // place the order
                    showingPaymentAlert.toggle()
                    print("Confirm Order is clicked!!!!")
                    
                    
                    // Create AdBrixRM Instance
                      let adBrix = AdBrixRM.getInstance
                      
                      // Event AttrModel
                      let attrModel = AdBrixRmAttrModel()
                          attrModel.setAttrDataString("nickname", "jake")
                          attrModel.setAttrDataString("payment_type", paymentType)
                          attrModel.setAttrDataString("total_price", totalPrice)
                          attrModel.setAttrDataBool("married", false)
                       
                      // Payment API
                      adBrix.commercePaymentInfoAddedWithAttr(paymentInfoAttr: attrModel)
                }
                
            }
            
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
            // more to come
            Alert(title: Text("Order Confirmed"), message: Text("Your total was\(totalPrice)"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView()
            .environmentObject(Order())
    }
}
