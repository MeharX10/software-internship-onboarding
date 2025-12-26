import SwiftUI
import Algorithms // <-- our package

struct ContentView: View {
    var body: some View {
        // Example using Swift Algorithms package: running a combinations algorithm
        let numbers = [1, 2, 3, 4]
        let comb = numbers.combinations(ofCount: 2)
        
        VStack {
            Text("Combinations Demo")
                .font(.title)
                .padding()
            
            // Display each combination as a readable string
            ForEach(Array(comb), id: \.self) { pair in
                Text("[\(pair.map(String.init).joined(separator: ", "))]")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
