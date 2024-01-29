//
//  DetailView.swift
//  NavigationSplitView3
//
//  Created by Klaus Matzka on 05.10.23.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject private var store: Store
    @ObservedObject var state = AppState.shared
    
    let housePartID: HousePart.ID?
    var housePartName: String {
        store.housePart(id: housePartID)?.name ?? " "
    }
    var housePartDocText: String {
        store.housePart(id: housePartID)?.docText.joined(separator: "\n") ?? ""
    }
    
    var body: some View {
        VStack {
            Text("The DetailView for **\(housePartName)**")
                .font(.title2)
            Text("\(housePartDocText)")
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(housePartName)
        
        .onAppear {
            print("*** onAppear - housePart: \(housePartName) | housePartID: \(String(describing: housePartID))")
        }
        .onDisappear {
            print("*** onDisapp - housePart: \(housePartName) | housePartID: \(String(describing: housePartID))")
        }
    }
}

#Preview {
    DetailView(housePartID: Store().houseParts.randomElement()?.id)
        .environmentObject(Store())
}
