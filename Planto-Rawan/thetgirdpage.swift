import SwiftUI

struct MyPlantsView: View {
    @State private var plants: [Plant] = [
        Plant(name: "Pothos", room: "Bedroom", sunlight: "Full sun", waterAmount: "20-50 ml"),
        Plant(name: "Monstera", room: "Kitchen", sunlight: "Full sun", waterAmount: "20-50 ml")
    ]
    
    @State private var checkedStates: [Bool] = [] // For the checkboxes
    @State private var navigateToFinalPage = false // State for navigation

    init() {
        // Initialize the checked states based on the number of plants
        _checkedStates = State(initialValue: Array(repeating: false, count: plants.count))
    }

    var body: some View {
        NavigationView {
            VStack {
                // Separate stack for the "Today" text
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 0.2)
                    .padding(.leading, 18.0)
                
                VStack {
                    Text("Today") // Header text
                        .padding(.leading, -180)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .padding(.bottom, -30)
                
                    List {
                        Section {
                            ForEach(plants.indices, id: \.self) { index in
                                PlantRow(plant: plants[index], isChecked: $checkedStates[index]) {
                                    checkAllTasks() // Check if all tasks are checked
                                }
                                .swipeActions {
                                    Button(role: .destructive) {
                                        // Action to delete the plant
                                        plants.remove(at: index)
                                        checkedStates.remove(at: index) // Remove the checked state as well
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                            }
                        }.frame(height: 97)
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
                        .padding(.trailing, 200)
                    }
                    Spacer()
                }
            }
            .navigationTitle("My Plants 🌱")
            .background(
                NavigationLink(destination: CFinalPage(), isActive: $navigateToFinalPage) {
                    EmptyView() // Invisible link for navigation
                }
            )
        }
    }

    // Function to check if all tasks are checked
    private func checkAllTasks() {
        if checkedStates.allSatisfy({ $0 }) { // Check if all are true
            navigateToFinalPage = true // Navigate to CFinalPage
        }
    }
}

struct PlantRow: View {
    var plant: Plant
    @Binding var isChecked: Bool
    var onChecked: () -> Void // Closure to handle checking

    var body: some View {
        VStack(alignment: .leading) {
            // Row for room name with location icon
            HStack {
                Image(systemName: "location") // Location icon
                    .foregroundColor(.gray)
                
                Text("in \(plant.room)")
                    .font(.subheadline)
                    .foregroundColor(Color.gray) // Gray text for the room name
            }
            
            HStack {
                // Checkmark circle that toggles when clicked
                Button(action: {
                    isChecked.toggle()
                    onChecked() // Call the closure to check for all tasks
                }) {
                    Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(isChecked ? Color(red: 41/255, green: 223/255, blue: 168/255) : .gray)
                        .padding(.trailing, 46.0)
                        .frame(width: 30, height: 30)
                }
                
                Text(plant.name)
                    .font(.title3)
                    .foregroundColor(.white) // White text for plant name
                    .padding(.leading, -28)
            }
            
            HStack {
                // Sunlight details
                HStack {
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(Color(red: 204/255, green: 199/255, blue: 133/255)) // Icon color matches original background of sunlight
                    Text(plant.sunlight)
                        .foregroundColor(Color(red: 204/255, green: 199/255, blue: 133/255)) // Original sunlight background color as text color
                }
                .padding(4)
                .background(Color.gray.opacity(0.2)) // Set background to gray
                .cornerRadius(6)
                
                // Water details
                HStack {
                    Image(systemName: "drop")
                        .foregroundColor(Color(red: 202/255, green: 243/255, blue: 251/255)) // Icon color matches original background of water
                    Text(plant.waterAmount)
                        .foregroundColor(Color(red: 202/255, green: 243/255, blue: 251/255)) // Original water background color as text color
                }
                .padding(4)
                .background(Color.gray.opacity(0.2)) // Set background to gray
                .cornerRadius(6)
            }
            
            Divider() // Full-width divider
                .background(Color.gray) // Set the color of the divider
                .frame(height: 1) // Set the height of the divider
                .padding(.horizontal, -20) // Adjust padding to make it extend fully
        }
        
        .listRowBackground(Color.black) // Ensure row background is black
    }
}

// Model for Plant
struct Plant {
    var name: String
    var room: String
    var sunlight: String
    var waterAmount: String
}

struct MyPlantsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPlantsView()
    }
}
