//
//  LikertScale.swift
//  Questionaire-tool
//
//  Created by Celina on 05.08.19.
//  Copyright © 2019 CelinaLandgraf. All rights reserved.
//

import SwiftUI

struct LikertScale: View {
    @State var test = 0
    @ObservedObject var model: Model
    let id: Int
    let typeId: String
    
    var body: some View {
        VStack(alignment: .leading) {
            if typeId == "SUS_1" {
                Text(self.model.susStatements[id])
                
                Picker(selection: $model.susResults_1[id], label: Text("")) {
                    Text("Stimme nicht zu").tag(0)
                    Text("Stimme eher nicht zu").tag(1)
                    Text("Weder noch").tag(2)
                    Text("Stimme eher zu").tag(3)
                    Text("Stimme zu").tag(4)
                }
                .pickerStyle(RadioGroupPickerStyle())
                .horizontalRadioGroupLayout()
                
                Spacer().padding(.top)
                
            } else if typeId == "SUS_2" {
                Text(self.model.susStatements[id])
                
                Picker(selection: $model.susResults_2[id], label: Text("")) {
                    Text("Stimme nicht zu").tag(0)
                    Text("Stimme eher nicht zu").tag(1)
                    Text("Weder noch").tag(2)
                    Text("Stimme eher zu").tag(3)
                    Text("Stimme zu").tag(4)
                }
                .pickerStyle(RadioGroupPickerStyle())
                .horizontalRadioGroupLayout()
                
                Spacer().padding(.top)
                
            } else if typeId == "SUS_3" {
                Text(self.model.susStatements[id])
                
                Picker(selection: $model.susResults_3[id], label: Text("")) {
                    Text("Stimme nicht zu").tag(0)
                    Text("Stimme eher nicht zu").tag(1)
                    Text("Weder noch").tag(2)
                    Text("Stimme eher zu").tag(3)
                    Text("Stimme zu").tag(4)
                }
                .pickerStyle(RadioGroupPickerStyle())
                .horizontalRadioGroupLayout()
                
                Spacer().padding(.top)
                
            } else if typeId == "USE_1" {
                Text(self.model.useStatements[id])
                
                Picker(selection: $model.useResults_1[id], label: Text("")) {
                    Text("Stimme nicht zu").tag(0)
                    Text("Stimme eher nicht zu").tag(1)
                    Text("Weder noch").tag(2)
                    Text("Stimme eher zu").tag(3)
                    Text("Stimme zu").tag(4)
                }
                .pickerStyle(RadioGroupPickerStyle())
                .horizontalRadioGroupLayout()
                
                Spacer().padding(.top)
            } else if typeId == "USE_2" {
                Text(self.model.useStatements[id])
                
                Picker(selection: $model.useResults_2[id], label: Text("")) {
                    Text("Stimme nicht zu").tag(0)
                    Text("Stimme eher nicht zu").tag(1)
                    Text("Weder noch").tag(2)
                    Text("Stimme eher zu").tag(3)
                    Text("Stimme zu").tag(4)
                }
                .pickerStyle(RadioGroupPickerStyle())
                .horizontalRadioGroupLayout()
                
                Spacer().padding(.top)
            } else if typeId == "USE_3" {
                Text(self.model.useStatements[id])
                
                Picker(selection: $model.useResults_3[id], label: Text("")) {
                    Text("Stimme nicht zu").tag(0)
                    Text("Stimme eher nicht zu").tag(1)
                    Text("Weder noch").tag(2)
                    Text("Stimme eher zu").tag(3)
                    Text("Stimme zu").tag(4)
                }
                .pickerStyle(RadioGroupPickerStyle())
                .horizontalRadioGroupLayout()
                
                Spacer().padding(.top)
            }
        }
    }
}

#if DEBUG
struct LikertScale_Previews: PreviewProvider {
    static var previews: some View {
        LikertScale(model: Model(), id: 0, typeId: "SUS")
    }
}
#endif
