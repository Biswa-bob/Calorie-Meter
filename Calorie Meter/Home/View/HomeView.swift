//
//  HomeView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 29/06/24.
//

import SwiftUI

struct HomeView: View {
    @State private var activeTab:Tab = .diary
    @Namespace private var animation
    @State private var tabShapePosition: CGPoint = .zero
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection: $activeTab){
            ReceipesView()
                .tag(Tab.receipes)
//                .toolbar(.hidden,for: .tabBar)
            DiaryView()
                .tag(Tab.diary)
//                .toolbar(.hidden,for: .tabBar)
            ReportsView()
                .tag(Tab.reports)
              
        }
        CustomTabBar()
        //        TabView{
        //           ReceipesView()
        //                .tabItem {
        //                    VStack{
        //                        Image(systemName: "book")
        //                        Text("Receipes")
        //                    }
        //                }
        //            DiaryView()
        //                .tabItem {
        //                    VStack{
        //                        Image(systemName: "clock")
        //                        Text("Diary")
        //                    }
        //                }
        //            ReportsView()
        //                .tabItem {
        //                    VStack{
        //                        Image(systemName: "chart.line.uptrend.xyaxis")
        //                        Text("Reports")
        //                    }
        //                    .foregroundColor(.red)
        //                }
        //        }
        
        
    }
    @ViewBuilder
    func CustomTabBar(_ tint:Color = Color("Primary"),_ inactiveTint: Color = Color("Primary"))-> some View{
        HStack(alignment: .bottom,spacing: 0){
            ForEach(Tab.allCases,id: \.rawValue){
                TabItem(tint: tint,
                        inactiveTint: inactiveTint,
                        tab: $0,
                        animation: animation,
                        activeTab: $activeTab,
                        position: $tabShapePosition
                )
            }
        }
        .padding(.horizontal,15)
        .padding(.vertical,10)
        .background(content: {
            TabShape(midpoint: tabShapePosition.x )
                .ignoresSafeArea()
                .padding(.top,20)
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .foregroundColor(Color("BottomBar"))
        })
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7),value: activeTab)
    }
}

struct TabItem: View{
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    var animation:Namespace.ID
    @Binding var activeTab: Tab
    @Binding var position:CGPoint
    @State private var tabPosition: CGPoint = .zero
    var body: some View{
        VStack(spacing: 0){
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .black: inactiveTint)
                
              
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? .black : tint)
        }
        .frame(width: activeTab == tab ? 88 : 75,height: activeTab == tab ? 88 : 75)
        .background{
            if activeTab == tab{
                Circle()
                    .fill(tint)
                    .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .contentShape(Rectangle())
        .viewPosition(completion: { rect in
            tabPosition.x = rect.minX
            
            if activeTab == tab{
                position.x = rect.midX
            }
        })
        .onTapGesture {
            
            activeTab = tab
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.9, blendDuration: 0.7)){
                position.x = tabPosition.x
            }
        }
    }
}

#Preview {
    HomeView()
}
