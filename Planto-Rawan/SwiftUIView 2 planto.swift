import SwiftUI

struct SetReminderView: View {
    @State private var plantName: String = "Pothos"
    @State private var selectedRoom: String = "Bedroom"
    @State private var selectedLight: String = "Full sun"
    @State private var selectedWateringDays: String = "Every day"
    @State private var waterAmount: String = "20-50 ml"
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Text("Plant Name")
                            .foregroundColor(.white)
                        
                        // Editable TextField for plant name, same size as before
                        TextField("Pothos", text: $plantName)
                            .foregroundColor(Color(red: 102/255, green: 102/255, blue: 102/255)) // Set text color to #666666
//                            
                            .padding(.trailing)
                            .frame(height: 36) // Smaller height consistent with your original design
                    }
                    .padding(.vertical, 4) // Maintain the original vertical padding for the HStack
                }
                
                Section {
                    PickerRow(icon: "paperplane", title: "Room", selection: $selectedRoom, options: ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]).accentColor(.gray)
                    PickerRow(icon: "sun.max", title: "Light", selection: $selectedLight, options: ["Full sun", "Partial sun", "Low light"]).accentColor(.gray)
                    PickerRow(icon: "drop", title: "Watering Days", selection: $selectedWateringDays, options: ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]).accentColor(.gray)
                    PickerRow(icon: "drop", title: "Water", selection: $selectedWateringDays, options: ["20-50 ml", "50-100 ml", "100-200 ml", "200-300"]).accentColor(.gray)
                }
            }
            .navigationBarTitleDisplayMode(.inline) // Ensures the title is placed inline
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Set Reminder")
                        .font(.headline) // Adjust font if needed
                        .foregroundColor(.white) // Adjust color if needed
                }
            }
            .navigationBarItems(leading: Button("Cancel", action: {
                // Cancel action
            })
            .foregroundColor(Color(red: 41/255, green: 223/255, blue: 168/255)), // Set the color to #29DFA8
                                 
            trailing: Button("Save", action: {
                // Save action
            })
            .foregroundColor(Color(red: 41/255, green: 223/255, blue: 168/255))) // Set the color to #29DFA8
        }
    }
}

struct PickerRow: View {
    var icon: String
    var title: String
    @Binding var selection: String
    var options: [String]
    
    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(title)
            Spacer()
            Picker(selection: $selection, label: Text("")) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                        .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255)) // Set text color to #8E8E93
                        .tag(option)
                }
            }
            .pickerStyle(MenuPickerStyle())
        }
    }
}

struct SetReminderView_Previews: PreviewProvider {
    static var previews: some View {
        SetReminderView()
    }
}
