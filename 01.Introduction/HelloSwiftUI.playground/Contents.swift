import UIKit
import PlaygroundSupport
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello SwiftUI")
            .font(.title)
            .foregroundColor(.red)
    }
}

let contentView = ContentView()

PlaygroundPage.current.liveView = UIHostingController(rootView: contentView)
