//
//  SettingsView.swift
//  DZ01-1
//
//  Created by Simo on 27.12.2021.
//

import SwiftUI

struct SettingsView: View {
    @State var showSheetView = false
    
    var body: some View {
        Button(action: {
            self.showSheetView.toggle()
        }) {
            Text("Show Modal View")
        }.sheet(isPresented: $showSheetView) {
            ModalView()
        }
    }
}

struct ModalView: View {
    
    @State var text = "Modal View\nWith UIKit Component"
    
    var body: some View {
        TextView(text: $text)
            .frame(width: 400, height: 100, alignment: .center)
        
    }
}

struct TextView: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        UITextView()
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.textAlignment = .center
        uiView.font = UIFont(name: "Helvetica", size: 24)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
