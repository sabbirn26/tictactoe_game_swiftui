//
//  SettingsView.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 5/2/25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    let defaultURL = URL(string: "https://google.com/")!
    let swiftfulYoutubeURL = URL(string: "https://www.youtube.com/@SwiftfulThinking")!
    let githubURL = URL(string: "https://youtube.com/")!
    let coingeckoURL = URL(string: "https://coingecko.com/")!
    let linkedinURL = URL(string: "https://www.linkedin.com/in/sabbirn26/")!
    let personalURL = URL(string: "https://github.com/sabbirn26")!
    var body: some View {
        NavigationView {
            ZStack {
//                Color.theme.bgColor
//                    .ignoresSafeArea()
                List{
                    personalInfoSection
//                        .listRowBackground(Color.theme.bgColor.opacity(0.5))
                    coingeckoSection
//                        .listRowBackground(Color.theme.bgColor.opacity(0.5))
                    devSection
//                        .listRowBackground(Color.theme.bgColor.opacity(0.5))
                    applicationSection
//                        .listRowBackground(Color.theme.bgColor.opacity(0.5))
                }
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
//                    XmarkButton(dismiss: xButtonAction)
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}

extension SettingsView {
    //MARK: VIEW PARTS
    private var personalInfoSection : some View {
        Section(header: Text("Swypto Tracker")) {
            VStack(alignment: .leading){
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This is a Crypto Tracker app. It uses MVVM Architecture, Combine and CoreData!")
                    .font(.callout)
                    .fontWeight(.medium)
//                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            HStack {
                Text("Huge shout-out to: ")
                    .font(.callout)
                    .fontWeight(.medium)
//                    .foregroundStyle(Color.theme.accent)
                
                Link("SwiftfulThinking", destination: swiftfulYoutubeURL)
                    .foregroundStyle(.blue)
            }
        }
    }
    
    private var coingeckoSection : some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading){
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                
                Text("The crypto currency data that is used in this app comes from a fee API from CoinGecko! Prices has a delay.")
                    .font(.callout)
                    .fontWeight(.medium)
//                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko", destination: coingeckoURL)
        }
    }
    
    private var devSection : some View {
        Section(header: Text("Developer")) {
            VStack(alignment: .leading){
                Image("devPhoto")
                    .resizable()
                    .frame(width : 100, height: 100)
                    .cornerRadius(10)
                
                Text("I'm Sabbir, a software engineer and content creator, constantly exploring new technologies. This project is a part of my learning journey, built entirely with Swift and SwiftUI.")
                    .font(.callout)
                    .fontWeight(.medium)
//                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("GitHub Profile 🧑🏽‍💻", destination: personalURL)
            Link("Linkedin Profile 🧑🏽‍💻", destination: linkedinURL)
        }
    }
    
    private var applicationSection : some View {
        Section(header: Text("Application")) {
            
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)
        }
    }
    
    //MARK: METHOD PART
    private func xButtonAction(){
        presentationMode.wrappedValue.dismiss()
    }
}
