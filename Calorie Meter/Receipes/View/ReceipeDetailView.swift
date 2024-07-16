//
//  ReceipeDetailView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 01/07/24.
//

import SwiftUI

struct ReceipeDetailView: View {
    let name:String
    let calorie:String
    let time:String
    let imageURL:String
    let ingredients:[String]
    let protein:String
    let fat:String
    let carbs:String
    
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(
                    url: URL(string: imageURL),
                    transaction: Transaction(animation: .default),
                    content: { phase in
                        if let image = phase.image { image
                            .resizable()
                            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .frame(width: .infinity,height: 260)
                        }
                        else { ProgressView() }
                    }
                )
                   
                HStack{
                    VStack(alignment: .leading){
                        Text("\(name)")
                            .font(.title2)
                            .foregroundColor(Color("OnBackground"))
                            .bold()
                        Text("\(calorie) Cal")
                            .font(.subheadline)
                            .foregroundColor(Color("OnBackgroundVariant"))
                    }
                    Spacer()
                    HStack{
                        Image(systemName: "clock")
                            Text("\(time) min")
                            .font(.subheadline)
                    }
                    .foregroundColor(Color("OnBackgroundVariant"))
                }
                .padding(.horizontal)
                .padding(.top)
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 30){
                        VStack{
                            Text("\(calorie)")
                            Text("Calories")
                        } .foregroundColor(Color("OnBackground"))
                        
                        VStack{
                            Text("\(protein)g")
                            Text("Proteins")
                        } .foregroundColor(Color("OnBackground"))
                        
                        VStack{
                            Text("\(fat)g")
                            Text("Fats")
                        } .foregroundColor(Color("OnBackground"))
                        
                        VStack{
                            Text("\(carbs)g")
                            Text("Carbs")
                        } .foregroundColor(Color("OnBackground"))
                    }
                    .font(.title3)
                    .padding(.top)
                    .padding(.horizontal)
                }
                
                Rectangle()
                    .frame(width: .infinity,height: 1)
                    .foregroundColor(Color("OnBackgroundVariant"))
                VStack(alignment: .leading){
                    HStack{
                        Text("Ingredients")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color("OnBackground"))
                        Spacer()
                    }
                    .padding(.top)
                        ForEach(ingredients,id: \.self){ ingredient in
                            HStack(spacing: 10){
                                Text("•")
                                Text("\(ingredient)")
                                    .font(.subheadline)
                                    .foregroundColor(Color("OnBackground"))
                                
                            }
                            .padding(.horizontal)
                            .padding(.top,2)
                        }
                    
                  
                }
                .padding(.horizontal)
                
                VStack{
                    HStack{
                        Text("Receipe")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color("OnBackground"))
                        Spacer()
                    }
                }
                .padding(.top)
                .padding(.horizontal)
                Text("Lorem ipsum dolor sit amet consectetur. Fringilla mauris est lorem et amet. Vestibulum tristique volutpat massa aliquet ultrices eu pretium. Ultrices risus blandit at id nibh euismod. In sit commodo ornare felis tincidunt faucibus nunc a. Nisl sagittis leo velit pharetra dolor nibh fermentum adipiscing adipiscing.")
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundColor(Color("OnBackground"))
                Spacer()
            }
        }
    }
}

#Preview {
    ReceipeDetailView(name: "Pancakes", calorie: "300", time: "60",imageURL: "",ingredients: ["goods"],protein: "10.22",fat: "11.34",carbs: "34.11")
}
