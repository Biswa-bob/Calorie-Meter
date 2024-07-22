//
//  DiaryView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 29/06/24.
//

import SwiftUI

struct DiaryView: View {
    @State private var selectedDate = Date.now
    let meals = [
    Meals(name: "Breakfast", calorie: "531", time: "10:45 AM"),
    Meals(name: "Lunch", calorie: "1024", time: "03:45 PM"),
    Meals(name: "Dinner", calorie: "630", time: "10:30 PM"),
    Meals(name: "Snacks", calorie: "102", time: "06:45 AM")
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
           
                VStack{
                   HStack {
//                       NavigationLink{
//                           ProfileView()
//                       } label:{
//                            HStack(spacing: 15){
//                                Image("demo")
//                                Text("Bob")
//                            }
//                        }
                    Spacer()
                       HStack() { // Layer on top-left
                           Image(systemName: "calendar") // Calendar image
                             .foregroundColor(Color("Primary")) // Adjust color

                           DatePicker(selection: $selectedDate, displayedComponents: .date) {
                           }
                            .labelsHidden()
                          }
                    }
                   .padding()
                    VStack(alignment: .leading){
                        Text("Nutrients Indicator")
                            .font(.subheadline)
                            .foregroundColor(Color("OnBackground"))
                            .bold()
                        ZStack{
                            Rectangle()
                                .cornerRadius(10)
                                .frame(width: 360,height: 160)
                                .foregroundColor(Color("SurfacePrimary"))
                            VStack(spacing: 20){
                                HStack(spacing: 20){
                                    VStack{
                                        Text("150/225")
                                        ProgressView(value: 150,total: 225)
                                            .tint(Color("Proteins"))
                                        Text("Proteins")
                                    }
                                    VStack{
                                        Text("30/118")
                                        ProgressView(value: 30,total: 118)
                                            .tint(Color("Fats"))
                                        Text("Fats")
                                    }
                                    VStack{
                                        Text("319/340")
                                        ProgressView(value: 319,total: 340)
                                            .tint(Color("Carbs"))
                                        Text("Carbs")
                                    }
                                    
                                }
                                VStack{
                                    Text("2456/3400")
                                    ProgressView(value: 2456,total: 3400)
                                        .tint(Color("Calories"))
                                    Text("Calories")
                                }
                            }
                            .padding()
                            .frame(width: 360,height: 144)
                        }
                        .padding(.bottom,30)
                    }
                    VStack(alignment: .leading){
                        Text("Water Intake")
                            .font(.subheadline)
                            .foregroundColor(Color("OnBackground"))
                            .bold().padding(.bottom,10)
                        ZStack{
                            Rectangle()
                                .cornerRadius(10)
                                .frame(width: 360,height: 160)
                                .foregroundColor(Color("SurfacePrimary"))
                            HStack(){
                                VStack(alignment: .leading){
                                 Text("Water")
                                        .font(.subheadline)
                                    Text("1.9/2.5")
                                    Spacer()
                                    HStack{
                                        Image(systemName: "clock")
                                            .foregroundColor(Color("OnBackgroundVariant"))
                                        Text("Last time 10:45 AM")
                                            .font(.subheadline)
                                            .foregroundColor(Color("OnBackgroundVariant"))
                                    }
                                }
                                .padding()
                                Spacer()
                                let progress = 0.7
                                ZStack {
                                  Spacer() // Push content to bottom
                                    ZStack(alignment: .bottom) { // Remove spacing between rectangles
                                    Rectangle()
                                      .frame(width: 40, height: 150 * progress) // Adjust width and height
                                      .foregroundColor(Color.green) // Progress color
                                      .cornerRadius(30)
                                    RoundedRectangle(cornerRadius: 40)
                                      .frame(width: 40, height: 150 * (1 - progress)) // Adjust width and height
                                      .foregroundColor(Color.black) // Background color
                            
                                  }
                                }
                              
                            }.padding(.horizontal)
                        }
                     
                        .frame(width: 360,height: 144)
                    }
                    VStack{
                        HStack{
                            Text("Meals")
                                .font(.subheadline)
                                .foregroundColor(Color("OnBackground"))
                                .bold()
                                .padding(.bottom,10)
                            Spacer()
                            Button(action: {}, label: {
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 24,height: 24)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color("OnBackground"))
                            })
                            
                        }
                        .padding(.horizontal)
                        LazyVStack{
                            ForEach(meals,id: \.self){ meal in
                                MealCard(meal: meal.name, cal: meal.calorie, time: meal.time)
                            }
                        }
                        
                    }.padding(.top,30)
               
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    DiaryView()
}

struct MealCard: View {
    let meal:String
    let cal:String
    let time:String
    var body: some View {
        ZStack{
            Rectangle()
                .cornerRadius(10)
                .frame(width: 360,height: 100)
                .foregroundColor(Color("SurfacePrimary"))
            VStack(alignment: .leading,spacing: 20){
                HStack{
                    Text(meal)
                    Spacer()
                    Text("\(cal) Cal")
                }
                HStack{
                    Image(systemName: "clock")
                    Text(time)
                }
                .foregroundColor(Color("OnBackgroundVariant"))
            }
            .padding()
        }
        .frame(width: 360,height: 100)
    }
}
