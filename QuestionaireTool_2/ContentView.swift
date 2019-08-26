//
//  ContentView.swift
//  Questionaire-tool
//
//  Created by Celina on 05.08.19.
//  Copyright © 2019 CelinaLandgraf. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = Model()
    @State var selection: String? = nil
    
    var body: some View {
        NavigationView {
            MasterView(selection: $selection, model: model)
            DetailView(selection: DetailViewType(rawValue: selection ?? "Bekanntheitsgrad") ?? .bekanntheitsgrad, model: model)
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
//        .frame(width: 900, height: 500)
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
