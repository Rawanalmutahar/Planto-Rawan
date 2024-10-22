import SwiftUI

struct SwiftUIView_2_planto: View {
    @State private var name: String = ""
    @State private var selectedRoom1: Int = 1
    @State private var selectedRoom2: Int = 1

    var body: some View {
        ZStack {
            Color(red: 28/255, green: 28/255, blue: 30/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 44/255, green: 44/255, blue: 46/255))
                        .frame(width: 388, height: 59)
                    
                    HStack {
                        Text("Plant Name")
                            .foregroundColor(.white)
                            .padding(.leading)
                        
                        TextField("Phothos", text: $name)
                            .foregroundColor(Color(red: 102/255, green: 102/255, blue: 102/255))
                            .padding(.trailing)
                    }
                }
                
                List {
                    Section(header: Text("Select Room 1").foregroundColor(.gray)) {
                        HStack {
                            Label("Room", systemImage: "location")
                                .foregroundColor(.gray)
                            Spacer()
                            Picker("Room", selection: $selectedRoom1) {
                                Text("Bedroom").tag(1)
                                Text("Living Room").tag(2)
                                Text("Kitchen").tag(3)
                                Text("Balcony").tag(4)
                                Text("Bathroom").tag(5)
                            }
                            .pickerStyle(MenuPickerStyle())
                            .accentColor(.gray)
                        }
                        .padding() // Add padding to the HStack
                        .background(Color(red: 44/255, green: 44/255, blue: 46/255)) // Background color for the row
                        .cornerRadius(10)
                    }
                    
                    Section(header: Text("Select Room 2").foregroundColor(.gray)) {
                        HStack {
                            Label("Room", systemImage: "location")
                                .foregroundColor(.gray)
                            Spacer()
                            Picker("Room", selection: $selectedRoom2) {
                                Text("Bedroom").tag(1)
                                Text("Living Room").tag(2)
                                Text("Kitchen").tag(3)
                                Text("Balcony").tag(4)
                                Text("Bathroom").tag(5)
                            }
                            .pickerStyle(MenuPickerStyle())
                            .accentColor(.gray)
                        }
                        .padding() // Add padding to the HStack
                        .background(Color(red: 44/255, green: 44/255, blue: 46/255)) // Background color for the row
                        .cornerRadius(10)
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color(red: 44/255, green: 44/255, blue: 46/255)) // Set the background color of the list
                .cornerRadius(10)
                .padding(.top, 10)
            }
            .padding(.bottom, 350)
        }
    }
}

#Preview {
    SwiftUIView_2_planto()
}
