//
//  ContentView.swift
//  Moonshot
//
//  Created by Jamila Ruzimetova on 3/11/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("showGridLayout") private var showGridLayout = true
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack {
            Group {
                if showGridLayout {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .toolbar {
                Button {
                    showGridLayout.toggle()
                }
                label: {
                    if showGridLayout {
                        Label("Show as a table", systemImage: "list.dash")
                    } else {
                        Label("Show as a grid", systemImage: "square.grid.2x2")
                    }
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}
    
    #Preview {
        ContentView()
    }
