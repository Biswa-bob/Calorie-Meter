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
    
    var body: some View {
        VStack{
            Image("pancake")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(width: .infinity,height: 260)

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
            
            HStack(spacing: 50){
                VStack{
                    Text("300")
                    Text("Calories")
                } .foregroundColor(Color("OnBackground"))
                
                VStack{
                    Text("20g")
                    Text("Proteins")
                } .foregroundColor(Color("OnBackground"))
                
                VStack{
                    Text("15g")
                    Text("Fats")
                } .foregroundColor(Color("OnBackground"))
                
                VStack{
                    Text("15g")
                    Text("Carbs")
                } .foregroundColor(Color("OnBackground"))
            }
            .font(.title3)
            .padding(.top)
            
            Rectangle()
                .frame(width: .infinity,height: 1)
                .foregroundColor(Color("OnBackgroundVariant"))
            Text("Lorem ipsum dolor sit amet consectetur. Fringilla mauris est lorem et amet. Vestibulum tristique volutpat massa aliquet ultrices eu pretium. Ultrices risus blandit at id nibh euismod. In sit commodo ornare felis tincidunt faucibus nunc a. Nisl sagittis leo velit pharetra dolor nibh fermentum adipiscing adipiscing.")
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(Color("OnBackground"))
            Spacer()
        }
    }
}

#Preview {
    ReceipeDetailView(name: "Pancakes", calorie: "300", time: "60")
}
