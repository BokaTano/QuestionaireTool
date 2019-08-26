//
//  USEView.swift
//  Questionaire-tool
//
//  Created by Celina on 06.08.19.
//  Copyright © 2019 CelinaLandgraf. All rights reserved.
//

import SwiftUI

struct USEView: View {
    @ObservedObject var model: Model
    let questionIndex: Int
    let useIndex: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(model.useQuestions[questionIndex])
                .font(.headline)
                
                Spacer()
                
                Text(model.techniques[useIndex-1][questionIndex])
            }
            
            Group{
                if questionIndex == 0 {
                    ForEach(0...2, id: \.self) { index in
                        Group {
                            LikertScale(model: self.model,
                                        id: index,
                                        typeId: "USE_\(self.useIndex)")
                        }
                    }
                } else if questionIndex == 1 {
                    ForEach(3...5, id: \.self) { index in
                        Group {
                            LikertScale(model: self.model,
                                        id: index,
                                        typeId: "USE_\(self.useIndex)")
                        }
                    }
                } else if questionIndex == 2 {
                    ForEach(6...9, id: \.self) { index in
                        Group {
                            LikertScale(model: self.model,
                                        id: index,
                                        typeId: "USE_\(self.useIndex)")
                        }
                    }
                }
            }
            .padding(.top, 25)
            
            
            
            
            //            if questionIndex < 2 {
            //                NavigationLink(destination: (PartUSEView(model: model, questionIndex: questionIndex + 1))) {
            //                    Text("weiter")
            //                }
            //            } else {
            //                NavigationLink(destination: JudgingView(model: model)) {
            //                    Text("weiter")
            //                }
            //            }
            
        }
    }
}

#if DEBUG
struct PartUSEView_Previews: PreviewProvider {
    static var previews: some View {
        USEView(model: Model(), questionIndex: 1, useIndex: 1)
    }
}
#endif
