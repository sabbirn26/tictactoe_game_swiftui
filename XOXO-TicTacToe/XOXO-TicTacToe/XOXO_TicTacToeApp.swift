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
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.black)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.black)]
        UITableView.appearance().backgroundColor = UIColor.clear
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
