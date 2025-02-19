//
//  SettingsView.swift
//  XOXO-TicTacToe
//
//  Created by Sabbir Nasir on 5/2/25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    // URLs for different links (tap them at your own risk 😆)
    let defaultURL = URL(string: "https://google.com/")!
    let githubURL = URL(string: "https://youtube.com/")!
    let linkedinURL = URL(string: "https://www.linkedin.com/in/sabbirn26/")!
    let personalURL = URL(string: "https://github.com/sabbirn26")!
    
    var body: some View {
        NavigationView {
            ZStack {
                // Cool gradient background 🌈
                LinearGradient(
                    gradient: Gradient(colors: [.blue.opacity(0.6), .purple.opacity(0.6)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                List {
                    applicationInfoSection
                        .listRowBackground(Color.gray.opacity(0.2))
                    devSection
                        .listRowBackground(Color.gray.opacity(0.2))
                    applicationSection
                        .listRowBackground(Color.gray.opacity(0.2))
                }
                .scrollContentBackground(.hidden)
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings ⚙️")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XmarkButton(dismiss: xButtonAction)
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}

extension SettingsView {
    //MARK: - VIEW SECTIONS
    
    /// Application information section 📱
    private var applicationInfoSection: some View {
        Section(header: Text("XOXO-Game")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This is a TicTacToe app. It uses MVVM Architecture!\n\nPlay against a friend. The game keeps track of wins and allows you to restart anytime. Built with SwiftUI for a smooth and interactive experience! 🎮")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.black)
            }
            .padding(.vertical)
        }
    }
    
    /// Developer info section 👨‍💻
    private var devSection: some View {
        Section(header: Text("Developer")) {
            VStack(alignment: .leading) {
                Image("devPhoto")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                
                Text("I'm Sabbir, a software engineer and content creator, constantly exploring new technologies. This project is a part of my learning journey, built entirely with Swift and SwiftUI. 🚀")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.black)
            }
            .padding(.vertical)
            
            Link("GitHub Profile 🧑🏽‍💻", destination: personalURL)
            Link("LinkedIn Profile 🧑🏽‍💻", destination: linkedinURL)
        }
    }
    
    /// Application-related links 🔗
    private var applicationSection: some View {
        Section(header: Text("Application")) {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)
        }
    }
    
    //MARK: - METHODS
    
    /// Dismisses the settings view when the X button is tapped ❌
    private func xButtonAction() {
        print("👋 Closing SettingsView!")
        presentationMode.wrappedValue.dismiss()
    }
}
