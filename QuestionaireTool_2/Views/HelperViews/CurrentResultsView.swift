//
//  CurrentResults.swift
//  Questionaire-tool
//
//  Created by Celina on 20.08.19.
//  Copyright © 2019 CelinaLandgraf. All rights reserved.
//

import SwiftUI

struct CurrentResultsView: View {
    @ObservedObject var model: Model
    @State var susResult = "0"
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(model.name)")
            HStack {
                Text("Knowledge: ")
                Text("\(model.knowledge)")
            }
            
            HStack {
                VStack {
                    Text("SUSResults: ")
                    Text(susResult)
                }
                
                Group {
                    VStack {
                        ForEach(self.model.susResults_1, id: \.self) { result in
                            Text("\(result) ")
                        }

                        ForEach(self.model.susResults_2, id: \.self) { result in
                            Text("\(result) ")
                        }

                        ForEach(self.model.susResults_3, id: \.self) { result in
                            Text("\(result) ")
                        }
                    }
                }
            }
            
            HStack {
                Text("USEResults:")
                Group {
                    VStack {
                        ForEach(self.model.useResults_1, id: \.self) { result in
                            Text("\(result) ")
                        }
                   
                        ForEach(self.model.useResults_2, id: \.self) { result in
                            Text("\(result) ")
                        }
                    
                        ForEach(self.model.useResults_3, id: \.self) { result in
                            Text("\(result) ")
                        }
                    }
                }
            }
        }
    }
}

#if DEBUG
struct CurrentResultsView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentResultsView(model: Model())
    }
}
#endif
