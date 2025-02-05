//
//  XOXO_TicTacToeApp.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 27/10/24.
//

import SwiftUI

@main
struct XOXO_TicTacToeApp: App {
    @State private var showLaunchView: Bool = true
    init(){
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UITableView.appearance().backgroundColor = UIColor.clear
//        UINavigationBar.appearance().tintColor = UIColor(Color.theme.accent)
    }
    var body: some Scene {
        
        WindowGroup {
            ZStack {
                NavigationView{
                    HomeView()
                        .navigationBarHidden(true)
                }
                .navigationViewStyle(StackNavigationViewStyle())
                ZStack{
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}
