//
//  KnowledgeView.swift
//  Questionaire-tool
//
//  Created by Celina on 05.08.19.
//  Copyright © 2019 CelinaLandgraf. All rights reserved.
//

import SwiftUI

struct KnowledgeView: View {
    @ObservedObject var data = Model()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Definition SmartWatch: Eine SmartWatch ist ein uhrenähnliches Gerät, dessen Zifferblatt durch einen TouchScreen Bildschirm ersetzt wurde und erweiterte Funktionalität bietet, wie Schrittzähler und Benachrichtigungen von einem verbundenen Bluetoothgerät.")
                .font(.headline)
                .lineLimit(nil)
            
            Text("Wie oft hast du eine SmartWatch bereits genutzt oder nutzt du?")
                .padding(.top, 25)
            
            Picker(selection: $data.knowledge, label: Text("")) {
                Text("Ich habe noch nie eine SmartWatch genutzt").tag(0)
                Text("Ich habe eine SmartWatch schon mal ausprobiert").tag(1)
                Text("Ich habe eine SmartWatch schon öfters genutzt").tag(2)
                Text("Ich nutze Smartwatches regelmäßig").tag(3)
                Text("Ich nutze Smartwatches jeden Tag").tag(4)
            }
            .pickerStyle(RadioGroupPickerStyle())
            Spacer()
        }
    }
}

#if DEBUG
struct KnowledgeView_Previews: PreviewProvider {
    static var previews: some View {
        KnowledgeView()
    }
}
#endif
