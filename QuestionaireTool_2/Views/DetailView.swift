//
//  DetailView.swift
//  Questionaire-tool
//
//  Created by Celina on 07.08.19.
//  Copyright © 2019 CelinaLandgraf. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var selection: DetailViewType
    @ObservedObject var model: Model
    
    //["Bekanntheitsgrad", "SUS-Skala", "USE-Skala 1", "USE-Skala 2", "USE-Skala 3", "Finale Meinung", "Ergebnisse"]
    var body: some View {
        VStack(alignment: .leading) {
            if selection == .start {
                VStack {
                    KnowledgeView(data: model)
                    StartView(model: model)
                }
            } else if selection == .bekanntheitsgrad {
                KnowledgeView(data: model)
            } else if selection == .sus_scale_1 {
                SUSView(model: model, susIndex: 1)
            } else if selection == .sus_scale_2 {
                SUSView(model: model, susIndex: 2)
            } else if selection == .sus_scale_3 {
                SUSView(model: model, susIndex:3)
            } else if selection == .use_scale_first_1 {
                USEView(model: self.model, questionIndex: 0, useIndex: 1)
            } else if selection == .use_scale_first_2 {
                USEView(model: self.model, questionIndex: 1, useIndex: 1)
            } else if selection == .use_scale_first_3 {
                USEView(model: self.model, questionIndex: 2, useIndex: 1)
            } else if selection == .use_scale_second_1 {
                USEView(model: self.model, questionIndex: 0, useIndex: 2)
            } else if selection == .use_scale_second_2 {
                USEView(model: self.model, questionIndex: 1, useIndex: 2)
            } else if selection == .use_scale_second_3 {
                USEView(model: self.model, questionIndex: 2, useIndex: 2)
            } else if selection == .use_scale_third_1 {
                USEView(model: self.model, questionIndex: 0, useIndex: 3)
            } else if selection == .use_scale_third_2 {
                USEView(model: self.model, questionIndex: 1, useIndex: 3)
            } else if selection == .use_scale_third_3 {
                USEView(model: self.model, questionIndex: 2, useIndex: 3)
            } else if selection == .finale_opinion {
                JudgingView(model: model)
            } else if selection == .results {
                ResultView(model: model)
            }
        }
        .padding(.top, 25)
        .padding(.horizontal, 25)
        //        .frame(width: 450, height: 450)
    }
}

#if DEBUG
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(selection: DetailViewType(rawValue: "Bekanntheitsgrad")!, model: Model())
    }
}
#endif
