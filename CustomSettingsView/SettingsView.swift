//
//  SettingsView.swift
//  CustomSettingsView
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI

enum FrequencyNotification: String, CaseIterable {
    case always = "Always"
    case onlyWhenUnlocked = "When Unlocked"
    case never = "Never"
}

struct SettingsView: View {
    // MARK: - Properties
    
    @State private var notificationEnabled = true
        @State private var frequency = FrequencyNotification.always
        @State private var description = ""
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            Form {
                //MARK: - Profile
                Section(header: Text("profile")) {
                    HStack {
                        Image("superMario")
                            .resizable()
                            .frame(width: 100, height: 100)
                        VStack(alignment: .leading) {
                            Text("Mario")
                                .font(.largeTitle.bold())
                            Text("plumber from time to time")
                                .font(.footnote)
                        }
                    }
                }

                //MARK: - Description
                Section(header: Text("Description")) {
                    TextField(
                        "Enter your description here",
                        text: $description
                    )
                }
                
                //MARK: - Notifications
                Section(header: Text("Notifications")) {
                    Toggle(isOn: $notificationEnabled) {
                        Text("Enable Notifications")
                    }
                    
                    Picker(
                        selection: $frequency,
                        label: Text("Frequency")
                    ) {
                        ForEach(FrequencyNotification.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .disabled(notificationEnabled == false)
                    
                }
                
                //MARK: - About
                Section(header: Text("About")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.4")
                    }
                }
            } // Form
            .navigationTitle("Settings")
        } // NavigationView
    }
}

// MARK: - Preview

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
