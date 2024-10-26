import SwiftUI

struct SetReminderView: View {
    @Environment(\.dismiss) var dismiss // Add this to dismiss the current view
    @StateObject private var viewModel = PlantViewModel()

    var body: some View {
        NavigationStack {
            List {
                // Section 1: Plant Name
                Section {
                    HStack {
                        Text("Plant Name")
                        TextField("Pothos", text: $viewModel.plantName)
                    }
                    .frame(height: 37)
                }
                
                // Section 2: Room and Light
                Section {
                    roomPicker()
                    lightPicker()
                }
                
                // Section 3: Watering Frequency and Water Amount
                Section {
                    wateringFrequencyPicker()
                    waterAmountPicker()
                }
            }
            .listSectionSpacing(20)
            .navigationTitle("Set Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    navigationButton("Cancel") { dismiss() }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    navigationButton("Save") {
                        viewModel.savePlant()
                        dismiss() // Dismiss the sheet view when saving
                    }
                }
            }
        }
    }
    
    // Helper function for the buttons
    private func navigationButton(_ title: String, action: @escaping () -> Void) -> some View {
        Button(title, action: action)
            .foregroundColor(Color(red: 41/255, green: 223/255, blue: 168/255))
            .font(title == "Save" ? .body.bold() : .body)
    }

    // Picker for Room
    private func roomPicker() -> some View {
        Picker(selection: $viewModel.room, label: HStack {
            Image(systemName: "location")
            Text("Room")
        }) {
            ForEach(viewModel.rooms, id: \.self) { room in
                Text(room)
                    .foregroundColor(room == viewModel.rooms.first ? .gray : .primary)
            }
        }
    }
    
    // Picker for Light
    private func lightPicker() -> some View {
        Picker(selection: $viewModel.light, label: HStack {
            Image(systemName: "sun.max")
            Text("Light")
        }) {
            ForEach(viewModel.lights, id: \.self) { light in
                Text(light)
                    .foregroundColor(light == viewModel.lights.first ? .gray : .primary)
            }
        }
    }

    // Picker for Watering Frequency
    private func wateringFrequencyPicker() -> some View {
        Picker(selection: $viewModel.wateringFrequency, label: HStack {
            Image(systemName: "drop")
            Text("Watering Days")
        }) {
            ForEach(viewModel.wateringFrequencies, id: \.self) { frequency in
                Text(frequency)
                    .foregroundColor(frequency == viewModel.wateringFrequencies.first ? .gray : .primary)
            }
        }
    }

    // Picker for Water Amount
    private func waterAmountPicker() -> some View {
        Picker(selection: $viewModel.waterAmount, label: HStack {
            Image(systemName: "drop")
            Text("Water Amount")
        }) {
            ForEach(viewModel.waterAmounts, id: \.self) { amount in
                Text(amount)
                    .foregroundColor(amount == viewModel.waterAmounts.first ? .gray : .primary)
            }
        }
    }
}

#Preview {
    SetReminderView()
}
