//
//  ReceipesView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 29/06/24.
//

import SwiftUI

struct ReceipesView: View {
    @State private var search =  ""
    let receipes: [Receipe] = [
        Receipe(name: "Pancakes", calorie: "300", time: "60"),
        Receipe(name: "Sushi", calorie: "244", time: "60"),
        Receipe(name: "Omlette", calorie: "200", time: "15"),
        Receipe(name: "Pasta", calorie: "500", time: "30"),
        Receipe(name: "Sanwich", calorie: "250", time: "30"),
    ]
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .center){
                    HStack(spacing: 15){
                        Image("demo")
                        Text("Bob")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color("OnBackground"))
                        Spacer()
                    }.padding(.leading,30)
                    
                    HStack(spacing: 20){
                        ZStack{
                            Rectangle()
                                .cornerRadius(12)
                                .foregroundColor(Color("SurfacePrimary"))
                                
                            HStack{
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color("OnBackgroundVariant"))
                                   TextField("Search for receipes", text: $search)
                            }
                            .padding()
                            
                        }
                        ZStack{
                            Circle()
                            .foregroundColor(Color("SurfacePrimary"))
                            Image("settings")
                        }
                    }.frame(width: 360,height: 50)
                    LazyVStack{
                        ForEach(receipes,id: \.self){receipe in
                            NavigationLink{
                                ReceipeDetailView(name: receipe.name, calorie: receipe.calorie, time: receipe.time)
                            } label:{
                                ReceipeCard(name: receipe.name, calorie: receipe.calorie, time: receipe.time)
                            }
                           
                        }
                    }
                   
                }
            }
        }
    }
}

#Preview {
    ReceipesView()
}

struct ReceipeCard: View {
    let name:String
    let calorie:String
    let time:String
    
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                Image("pancake")
                ZStack{
                    Rectangle()
                        .foregroundColor(Color("SurfacePrimary"))
                        .frame(height: 80)
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
                    }.padding()
                }
            }
            
        }
        .frame(width: 360)
        .cornerRadius(12)
        .padding(.top)
    }
}
