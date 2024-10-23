//  ContentView.swift
//  Planto-Rawan
//
//  Created by Rawan on 17/04/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var modalIsPresented = false
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

                    // Horizontal line under the title
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 0.3)
                        .padding([.leading, .bottom], 18.0)
                        .frame(maxWidth: .infinity)
                }

                Spacer()

                // Top image (plants picture)
                Image("planto")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 164, height: 200)
                    .position(x: 180, y: 104)
                    .padding()

                // Text below the plants picture
                VStack {
                    Text("Start your plant journey!")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .position(x: 190, y: 120)
                }

                // New text with line break
                VStack {
                    Text("Now all your plants will be in one place and\n we will help you take care of them :)🪴")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                        .multilineTextAlignment(.center)
                        .position(x: 190, y: 10)
                }

                Spacer()
                    .frame(height: 20)
                
                // Button to set plant reminder
                VStack {
                    Button(action: {
                        modalIsPresented=true
                        // Action for button tap
                    }) {
                        Text("Set Plant Reminder")
                            .foregroundStyle(.black)
                            .font(.system(size: 14, weight: .bold))
                            .frame(width: 280, height: 40)
                            .background(Color(red:0.16,green:0.88,blue:0.66))
                            .cornerRadius(10) // Set corner radius to 10
                    }.sheet(isPresented: $modalIsPresented, content: {
                        SetReminderView()
                    })
                    .position(x: 190, y: -95) // Position the button
                }

                Spacer() // Push content up
            }
            .padding(.top, 20) // Add some top padding to the VStack
        }
    }
}

#Preview {
    ContentView()
}
