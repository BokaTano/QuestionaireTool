//
//  MasterView.swift
//  Questionaire-tool
//
//  Created by Celina on 07.08.19.
//  Copyright © 2019 CelinaLandgraf. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    @Binding var selection: String?
    @ObservedObject var model: Model
    
    private let names = ["Start",
                         "Bekanntheitsgrad",
                         "SUS-Skala 1",
                         "SUS-Skala 2",
                         "SUS-Skala 3",
                         "USE-Skala 1.1",
                         "USE-Skala 1.2",
                         "USE-Skala 1.3",
                         "USE-Skala 2.1",
                         "USE-Skala 2.2",
                         "USE-Skala 2.3",
                         "USE-Skala 3.1",
                         "USE-Skala 3.2",
                         "USE-Skala 3.3",
                         "Finale Meinung",
                         "Ergebnisse"
    ]
    
    var body: some View {
        VStack(alignment: .leading){
            StartView(model: model)
                .padding()
            
            List(selection: $selection) {
//                Section(header: Text("Erster Schritt")) {
//                    Text(names[0]).tag(names[0])                //Start
//                }
                Section(header: Text("Zweiter Schritt")) {
                    Text(names[1]).tag(names[1])                //Bekanntheitsgrad
                }
                Section(header: Text("Erster Durchlauf")) {
                    Text(names[2]).tag(names[2])
                    
                    Text(names[5]).tag(names[5])                //USE1
                    Text(names[6]).tag(names[6])
                    Text(names[7]).tag(names[7])
                }
                Section(header: Text("Zweiter Durchlauf")) {
                    Text(names[3]).tag(names[3])
                    
                    Text(names[8]).tag(names[8])                //USE2
                    Text(names[9]).tag(names[9])
                    Text(names[10]).tag(names[10])
                }
                Section(header: Text("Dritter Durchlauf")) {
                    Text(names[4]).tag(names[4])
                    
                    Text(names[11]).tag(names[11])                //USE3
                    Text(names[12]).tag(names[12])
                    Text(names[13]).tag(names[13])
                }
                Section(header: Text("Allgemeine Favorisierung")) {
                    Text(names[14]).tag(names[14])                //Finale
                }
                Section(header: Text("Ergebnisse")) {
                    Text(names[15]).tag(names[15])                //Result&Save
                }
            }.listStyle(SidebarListStyle())

            Button(action: {
                self.resetResults()
            }) {
                VStack {
                    Text("Reset")
                }
            }
        .padding()
        }
        .frame(width: 250)
    }
    
    func resetResults() {
        self.model.name = ""
        self.model.knowledge = 2
        self.model.scenario_one = [0,1,2]
        
        for index in 0...9 {
            self.model.susResults_1[index] = 2
            self.model.susResults_2[index] = 2
            self.model.susResults_3[index] = 2
            self.model.useResults_1[index] = 2
            self.model.useResults_2[index] = 2
            self.model.useResults_3[index] = 2
        }
        
        for index in 0...2 {
            self.model.judging[index] = 2
        }
    }
}

#if DEBUG
struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(selection: .constant("0"), model: Model())
    }
}
#endif
