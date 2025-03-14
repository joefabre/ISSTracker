import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("selectedVoice") private var selectedVoice = "Default"
    @Environment(\.presentationMode) var presentationMode

    let voices = ["Default", "Voice 1", "Voice 2"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Appearance")) {
                    Toggle(isOn: $isDarkMode) {
                        Text("Dark Mode")
                    }
                }

                Section(header: Text("Speech")) {
                    Picker("Voice", selection: $selectedVoice) {
                        ForEach(voices, id: \.self) { voice in
                            Text(voice)
                        }
                    }
                }

                Button("OK") {
                    presentationMode.wrappedValue.dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .navigationTitle("Settings")
        }
    }
}
