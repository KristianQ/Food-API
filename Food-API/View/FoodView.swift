//
//  FoodView.swift
//  Food-API
//
//  Created by Emiliano Qaqi on 10/27/20.
//

import SwiftUI

struct FoodView: View {
    
    @State var foodData = [Food]()
    let foodModelView = FoodViewModel()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(foodData, id: \.self) { item in
                    VStack {
                        FoodRemoteImageView(url: item.url!)
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300)
                            .clipped()
                        Text(item.title!)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.body)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 35)
                    }
                }
                .background(SwiftUI.Color.white)
            }
            .padding(10)
            .background(SwiftUI.Color.gray)
        }.onAppear {
            self.foodModelView.getFoodData { (response) in
                foodData = response
            }
        }
        
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView()
    }
}
