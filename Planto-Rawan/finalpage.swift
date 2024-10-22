//  ContentView.swift
//  Planto-Rawan
//
//  Created by Rawan on 17/04/1446 AH.
//

import SwiftUI

struct CFinalPage: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all) // Set the background to black
            
            // Background image (transparent) positioned at (x: 180, y: 240)
            Image("trnsparent")
                .resizable()
                .scaledToFit()
                .frame(width: 219, height: 227)
                .position(x: 180, y: 240)
                .padding() // Optional padding
            
            VStack {
                Spacer() // Push content down

                // Title text
                VStack {
                    Text("My Plants 🌱")
                        .foregroundColor(.white)
                        .font(.system(size: 36, weight: .bold))
                        .padding(.trailing, 140.0)

                
                }

                Spacer()

                // Top image (plants picture)
                Image("Group 4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 219, height: 227)
                    .position(x: 180, y: 140)
                    .padding()

                // Text below the plants picture
                VStack {
                    Text("All Done! 🎉")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .position(x: 190, y: 120)
                }

                // New text with line break
                VStack {
                    Text("All Reminders Completed")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                        .multilineTextAlignment(.center)
                        .position(x: 190, y: -55)
                }

                HStack {
                    Spacer()
                    Button(action: {
                        // Action for new reminder
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("New Reminder")
                        }
                        .foregroundColor(Color(red: 41/255, green: 223/255, blue: 168/255)) // Color #29DFA8
                        .padding(.trailing,200)
                    }
                    Spacer()
                }
                    
                
                // Removed button section

                Spacer() // Push content up
            }
            .padding(.top, 20) // Add some top padding to the VStack
        }
    }
}

#Preview {
    CFinalPage()
}
