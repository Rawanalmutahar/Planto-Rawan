import Foundation

class PlantViewModel: ObservableObject {
    @Published var plantName: String = ""
    
    @Published var room: String = "Bedroom"
    let rooms = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]
    
    @Published var light: String = "Full Sun"
    let lights = ["Full Sun", "Partial Sun", "Low Light"]
    
    @Published var wateringFrequency: String = "Every day"
    let wateringFrequencies = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    
    @Published var waterAmount: String = "20-50 ml"
    let waterAmounts = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    
    @Published var plants: [Plants] = [] // Use Plants for the array of plant instances

    // When the view model is initialized, load the saved plants
    init() {
        loadPlants()
    }

    // Save plant info when the user adds a new plant
    func savePlant() {
        let newPlant = Plants(name: plantName, room: room, light: light, wateringFrequency: wateringFrequency, waterAmount: waterAmount) // Use Plants instead of Plant
        plants.append(newPlant) // Append to the plants array
        savePlants()  // Persist plants to UserDefaults
        print("Plant saved: \(newPlant)")
    }

    // Toggle the check status of a plant
    func toggleCheck(for plant: Plants) {
        if let index = plants.firstIndex(where: { $0.id == plant.id }) { // Check against the correct plant
            plants[index].isChecked.toggle()
            objectWillChange.send()  // Notify view to update after the state change
            savePlants()  // Save updated plants to UserDefaults
        }
    }

    // MARK: - Persistence Methods

    // Save plants to UserDefaults
    private func savePlants() {
        let encoder = JSONEncoder()
        if let encodedPlants = try? encoder.encode(plants) {
            UserDefaults.standard.set(encodedPlants, forKey: "savedPlants")
        }
    }

    // Load plants from UserDefaults
    private func loadPlants() {
        if let savedPlants = UserDefaults.standard.data(forKey: "savedPlants") {
            let decoder = JSONDecoder()
            if let decodedPlants = try? decoder.decode([Plants].self, from: savedPlants) { // Decode into [Plants]
                self.plants = decodedPlants
            }
        }
    }

    func removeFromTodayReminders(plant: Plants) {
        if let index = plants.firstIndex(where: { $0.id == plant.id }) { // Check against the correct plant
            plants[index].isChecked = true  // Mark it as completed (optional, depends on your logic)
            objectWillChange.send()  // Notify the view to update
        }
    }
}
