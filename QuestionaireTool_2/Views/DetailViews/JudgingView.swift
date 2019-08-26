//
//  JudgingView.swift
//  Questionaire-tool
//
//  Created by Celina on 06.08.19.
//  Copyright © 2019 CelinaLandgraf. All rights reserved.
//

import SwiftUI

struct JudgingView: View {
    @ObservedObject var model: Model
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Welche Techniken gefielen Ihnen am besten?")
                .font(.headline)
            
            VStack {
                HStack {
                    Text("Auswahl der Handstandübung")
                        .frame(width: 200, height: 40, alignment: .leading)
                    ForEach(0...2, id: \.self) { idx in
                        Button(action: {
                            self.model.judging[0] = idx
                        }) {
                            VStack {
                                Text("App \(idx + 1)")
                                //                            Image("watch_2")
                                //                                .resizable()
                                //                                .aspectRatio(contentMode: .fill)
                                //                                .frame(width: 20, height: 20, alignment: .leading)
                                
                            }
                        }
                        .frame(width: 50, height: 40, alignment: .leading)
                        .padding()
                    }
                }
                
                HStack {
                    Text("Auswahl der Übungsdauer")
                        .frame(width: 200, height: 40, alignment: .leading)
                    ForEach(0...2, id: \.self) { idx in
                        Button(action: {
                            self.model.judging[1] = idx
                        }) {
                            VStack {
                                Text("App \(idx + 1)")
                            }
                        }
                        .frame(width: 50, height: 40, alignment: .leading)
                    .padding()
                    }
                }
                HStack {
                    Text("Starten der Übung")
                        .frame(width: 200, height: 40, alignment: .leading)
                    ForEach(0...2, id: \.self) { idx in
                        Button(action: {
                            self.model.judging[1] = idx
                        }) {
                            VStack {
                                Text("App \(idx + 1)")
                            }
                        }
                        .frame(width: 50, height: 40, alignment: .leading)
                        .padding()
                    }
                }
                
                
            }
            
//            HStack {
//                Text("Auswahl der Übungsdauer")
//                    .frame(width: 200, height: 100, alignment: .leading)
//
//                Image("watch_2").resizable().aspectRatio(contentMode: .fit)
//                Image("watch_2").resizable().aspectRatio(contentMode: .fit)
//                Image("watch_2").resizable().aspectRatio(contentMode: .fit)
//            }
//
//            HStack {
//                Text("Starten der Übung")
//                    .frame(width: 200, height: 100, alignment: .leading)
//
//                Image("watch_2").resizable().aspectRatio(contentMode: .fit)
//                Image("watch_2").resizable().aspectRatio(contentMode: .fit)
//                Image("watch_2").resizable().aspectRatio(contentMode: .fit)
//            }
        }
    }
}

#if DEBUG
struct JudgingView_Previews: PreviewProvider {
    static var previews: some View {
        JudgingView(model: Model())
    }
}
#endif
