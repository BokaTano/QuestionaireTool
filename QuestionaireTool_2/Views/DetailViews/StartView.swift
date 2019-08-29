//
//  StartView.swift
//  Questionaire-tool
//
//  Created by Celina on 14.08.19.
//  Copyright © 2019 CelinaLandgraf. All rights reserved.
//

import SwiftUI

struct StartView: View {
    @ObservedObject var model: Model
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Vorname Name")
                .font(.subheadline)
            
            TextField("Name", text: $model.name)
            
            Text("Szenarien Auswahl:")
            HStack {
                Picker(selection: $model.scenario[0], label: Text("")) {
                    Text("0").tag(0)
                    Text("1").tag(1)
                    Text("2").tag(2)
                }.pickerStyle(PopUpButtonPickerStyle())
                Picker(selection: $model.scenario[1], label: Text("")) {
                    Text("0").tag(0)
                    Text("1").tag(1)
                    Text("2").tag(2)
                }.pickerStyle(PopUpButtonPickerStyle())
                Picker(selection: $model.scenario[2], label: Text("")) {
                    Text("0").tag(0)
                    Text("1").tag(1)
                    Text("2").tag(2)
                }.pickerStyle(PopUpButtonPickerStyle())
            }
            
        }
    }
}

#if DEBUG
struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(model: Model())
    }
}
#endif
