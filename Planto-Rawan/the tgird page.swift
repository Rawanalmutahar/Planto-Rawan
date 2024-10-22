import SwiftUI

struct MyPlantsView: View {
    @State private var isCheckedPothos = false
    @State private var isCheckedMonstera = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Today")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)) {
                        
                        // First plant row with a checkmark circle
                        PlantRow(plantName: "Pothos", room: "Bedroom", sunlight: "Full sun", waterAmount: "20-50 ml", isChecked: $isCheckedPothos)
                        
                        // Second plant row with a checkmark circle
                        PlantRow(plantName: "Monstera", room: "Kitchen", sunlight: "Full sun", waterAmount: "20-50 ml", isChecked: $isCheckedMonstera)
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .background(Color.black) // Ensure the list background is black
                .scrollContentBackground(.hidden) // Hides default list background
                
                // New Reminder Button at the bottom
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
                        .padding()
                    }
                    Spacer()
                }
            }
            .navigationTitle("My Plants 🌱")
            .foregroundColor(.white)
            .background(Color.black.edgesIgnoringSafeArea(.all)) // Black background for the whole page
        }
    }
}

struct PlantRow: View {
    var plantName: String
    var room: String
    var sunlight: String
    var waterAmount: String
    @Binding var isChecked: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            // Row for room name with location icon
            HStack {
                Image(systemName: "location") // Location icon
                    .foregroundColor(.gray)
                
                Text("in \(room)")
                    .font(.subheadline)
                    .foregroundColor(Color.gray) // Gray text for the room name
            }
            
            HStack {
                // Checkmark circle that toggles when clicked
                Button(action: {
                    isChecked.toggle()
                }) {
                    Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(isChecked ? Color(red: 41/255, green: 223/255, blue: 168/255) : .gray)
                        .frame(width: 24, height: 24)
                }
                
                Text(plantName)
                    .font(.title3)
                    .foregroundColor(.white) // White text for plant name
                
                Spacer()
            }
            
            HStack {
                // Sunlight details (icon and text share the same color)
                HStack {
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(Color(red: 204/255, green: 199/255, blue: 133/255)) // Icon color matches original background of sunlight
                    Text(sunlight)
                        .foregroundColor(Color(red: 204/255, green: 199/255, blue: 133/255)) // Original sunlight background color as text color
                }
                .padding(4)
                .background(Color.gray) // Set background to gray
                .cornerRadius(6)
                
                // Water details (icon and text share the same color)
                HStack {
                    Image(systemName: "drop")
                        .foregroundColor(Color(red: 202/255, green: 243/255, blue: 251/255)) // Icon color matches original background of water
                    Text(waterAmount)
                        .foregroundColor(Color(red: 202/255, green: 243/255, blue: 251/255)) // Original water background color as text color
                }
                .padding(4)
                .background(Color.gray) // Set background to gray
                .cornerRadius(6)
            }
        }
        .listRowBackground(Color.black) // Ensure row background is black
        .padding(.vertical, 8)
    }
}

struct MyPlantsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPlantsView()
    }
}
