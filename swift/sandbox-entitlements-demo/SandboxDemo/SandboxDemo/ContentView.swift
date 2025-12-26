import SwiftUI

struct ContentView: View {
    @State private var fileURL: URL?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Sandbox Demo App")
                .font(.title)
            
            Button("Select a File") {
                let panel = NSOpenPanel()
                panel.canChooseFiles = true
                panel.canChooseDirectories = false
                panel.allowsMultipleSelection = false
                
                if panel.runModal() == .OK {
                    self.fileURL = panel.url
                }
            }
            
            if let url = fileURL {
                Text("Selected File: \(url.lastPathComponent)")
                    .foregroundColor(.blue)
            } else {
                Text("No file selected")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(width: 400, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
