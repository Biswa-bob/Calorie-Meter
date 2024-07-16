//
//  ReceipesView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 29/06/24.
//

import SwiftUI

struct ReceipesView: View {
    @StateObject private var receipe = ReceipeViewModel()
    @State private var recipes:ReceipeModel?
    @State private var search =  ""
    @State private var showingSheet = false
    
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
                                    .onSubmit {
//                                        print("search: \(search)")
                                        Task.init{
                                            let result = await receipe.fetchReceipe(for: search)
                                            recipes = result
                                        }
                                    }
                            }
                            .padding()
                            
                        }
                        ZStack{
                            Circle()
                                .foregroundColor(Color("SurfacePrimary"))
                            Image("settings")
                        }
                        .onTapGesture {
                            showingSheet.toggle()
                        }
                        .sheet(isPresented: $showingSheet) {
                                 SettingsView()
                              }
                    }.frame(width: 360,height: 50)
                    LazyVStack{
                        if let data = recipes{
                            ForEach(data.hits ,id: \.self){eachData in
                                NavigationLink{
                                    ReceipeDetailView(
                                        name: eachData.recipe.label,
                                        calorie: String(format: "%.2f", eachData.recipe.totalNutrients.ENERC_KCAL.quantity),
                                        time: "\(eachData.recipe.totalTime)",
                                        imageURL: eachData.recipe.images.SMALL.url,
                                        ingredients: eachData.recipe.ingredientLines,
                                        protein: String(format: "%.2f", eachData.recipe.totalNutrients.PROCNT.quantity),
                                        fat: String(format: "%.2f", eachData.recipe.totalNutrients.FAT.quantity),
                                        carbs: String(format: "%.2f", eachData.recipe.totalNutrients.CHOCDF.quantity)
                                                      
                                    )
                                } label:{
                                    ReceipeCard(name: eachData.recipe.label, calorie: String(format: "%.2f", eachData.recipe.totalNutrients.ENERC_KCAL.quantity), time: "\(eachData.recipe.totalTime)",imageURL: eachData.recipe.images.SMALL.url)
                                }
                                
                            }
                        }
                    }
                    
                }
                .onAppear(
                    perform: {
                        Task.init{
                            let result = await receipe.fetchReceipe(for: "chicken")
                            recipes = result
                        }
                    }
                )
                
            }
            
        }
    }
}

#Preview {
    ReceipesView()
}

extension Binding where Value == String {
    func max(_ limit: Int) -> Binding<String> {
        if self.wrappedValue.count > limit {
            self.wrappedValue = String(self.wrappedValue.prefix(limit))
        }
        return self
    }
}

struct ReceipeCard: View {
    let name:String
    let calorie:String
    let time:String
    let imageURL:String
    
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                AsyncImage(
                    url: URL(string: imageURL),
                    transaction: Transaction(animation: .default),
                    content: { phase in
                        if let image = phase.image { image
                            .resizable()
                            .frame(height: 200)
                        }
                        else { ProgressView() }
                    }
                )
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
                                .lineLimit(1)
                            Text("\(calorie) KCal")
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

