import SwiftUI

struct CFinalPage: View {
    @State private var showingSetReminderView = false // State variable to control the sheet presentation
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all) // Set the background to black
            
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
                    .position(x: 168, y: 140)
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
                        showingSetReminderView = true // Show the SetReminderView when the button is tapped
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("New Reminder")
                        }
                        .foregroundColor(Color(red: 41/255, green: 223/255, blue: 168/255)) // Color #29DFA8
                        .padding(.trailing, 200)
                    }
                    Spacer()
                }

                Spacer() // Push content up
            }
            .padding(.top, 20) // Add some top padding to the VStack
        }
        .navigationBarBackButtonHidden(true) // Hide the back button
        .navigationTitle("") // Optionally set title to empty
        .sheet(isPresented: $showingSetReminderView) {
            SetReminderView() // Present the SetReminderView as a sheet
        }
    }
}

#Preview {
    CFinalPage()
}
