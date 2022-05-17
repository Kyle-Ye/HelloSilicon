//
//  ContentView.swift
//  Shared
//
//  Created by Kyle on 2022/5/18.
//

import SwiftUI
import CHelper

struct ContentView: View {
    
    @State var text: String = ""
    
    func toUpper(_ input: String) -> String {
        var output  = [CChar](repeating: 0, count: 255)
        mytoupper(input, &output)
        guard let outputString = String(validatingUTF8: output) else {
            return "Unable to convert \(input)"
        }
        return outputString
    }
    
    func toLower(_ input: String) -> String {
        var output  = [CChar](repeating: 0, count: 255)
        mytolower(input, &output)
        guard let outputString = String(validatingUTF8: output) else {
            return "Unable to convert \(input)"
        }
        return outputString
    }
    
    var body: some View {

        Form {
            Section {
                TextField("Enter some text here", text: $text)
            } header: {
                Text("Enter some text here")
            }
            Section {
                Text(toUpper(text))
            } header: {
                Text("Upper Text")
            }
            Section {
                Text(toLower(text))
            } header: {
                Text("Lower Text")
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
