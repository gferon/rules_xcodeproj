import Lib
import SwiftUI

public struct ContentView: View {
    public init() {}

    public var body: some View {
        VStack {
            Image("Logo", bundle: .libResources)
            Text(greeting)
            Text(libResourcesString)
            Text(Bundle.main.bundlePath.split(separator: "/").last ?? "")
        }
            .padding(64)
            .multilineTextAlignment(.center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
