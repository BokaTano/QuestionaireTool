//
//  SUSView.swift
//  Questionaire-tool
//
//  Created by Celina on 05.08.19.
//  Copyright © 2019 CelinaLandgraf. All rights reserved.
//

import SwiftUI

struct SUSView: View {
    @ObservedObject var model: Model
    let susIndex: Int
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Wie sehr treffen folgende Aussagen bezüglich der gerade genutzten App zu? ")
                    .font(.headline)
                Spacer().padding(.top)
                
                ForEach(0...9, id: \.self) { index in
                    Group {
                        LikertScale(model: self.model, id: index, typeId: "SUS_\(self.susIndex)")
                        Spacer().padding(.top)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct SUSView_Previews: PreviewProvider {
    static var previews: some View {
        SUSView(model: Model(), susIndex: 1)
    }
}
#endif
