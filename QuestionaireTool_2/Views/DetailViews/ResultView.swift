//
//  ResultView.swift
//  Questionaire-tool
//
//  Created by Celina on 12.08.19.
//  Copyright © 2019 CelinaLandgraf. All rights reserved.
//

import SwiftUI
import Foundation

struct ResultView: View {
    @ObservedObject var model: Model
    @State var susResult = "0"
    @State var selectedResults = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Results:").font(.headline)
            Picker(selection: $selectedResults, label: Text("")) {
                Text("Vorkenntnisse").tag(0)
                Text("SUS Ergebnisse").tag(1)
                Text("USE Ergebnisse").tag(2)
                Text("Allgemeine Meinung").tag(3)
                Text("Zusammenfassung").tag(4)
            }.pickerStyle(SegmentedPickerStyle())
            
            ScrollView {
                if selectedResults == 0 {
                    HStack(alignment: .top) {
                        ForEach(self.model.data, id: \.self) { row in
                            VStack {
                                Text("\(row["name"] ?? "shit")")
                                Text("\(row[self.model.columnTitles[0]] ?? "shit") ")
                            }
                        }
                    }
                } else if selectedResults == 1 {
                    HStack(alignment: .top) {
                        ForEach(self.model.data, id: \.self) { row in
                            VStack {
                                Text("\(row["name"] ?? "shit")")
                                ForEach(1...30, id: \.self) { index in
                                    Text("\(row[self.model.columnTitles[index]] ?? "shit") ")
                                }
                            }
                        }
                    }
                } else if selectedResults == 2 {
                    HStack(alignment: .top) {
                        ForEach(self.model.data, id: \.self) { row in
                            VStack {
                                Text("\(row["name"] ?? "shit")")
                                ForEach(31...60, id: \.self) { index in
                                    Text("\(row[self.model.columnTitles[index]] ?? "shit") ")
                                }
                            }
                        }
                    }
                } else if selectedResults == 3 {
                    HStack(alignment: .top) {
                        ForEach(self.model.data, id: \.self) { row in
                            VStack {
                                Text("\(row["name"] ?? "shit")")
                                ForEach(61...63, id: \.self) { index in
                                    Text("\(row[self.model.columnTitles[index]] ?? "shit") ")
                                }
                            }
                        }
                    }
                }
                
                
            }.padding(.top)
            Spacer()
            
            Button(action: {
                self.convertCSVintoData(file: self.readDataFromFile(file: "data"))
                self.pushDataToLocalResults()
            }) {
                VStack {
                    Text("Import")
                }
            }
            Button(action: {
                let _ = self.writeDataToFile(file: "data")
            }) {
                VStack {
                    Text("Save")
                }
            }
            .padding(.bottom)
        }
    }
}

#if DEBUG
struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(model: Model())
    }
}
#endif

//MARK: Save Data
extension ResultView {
    func pushLocalResultsToData() { //Push resultObjects into model.data
        var results: [String: String] = [:]
        
        
        if self.model.data.isEmpty {
            let dummy: [String: String] = [:]
            self.model.data.append(dummy)
            for (_, title) in self.model.columnTitles.enumerated() {
                self.model.data[0][title] = title
            }
        }
        
        results[self.model.columnTitles[0]] = String(model.knowledge) //knowledge
        
        for (index, result) in self.model.susResults_1.enumerated() { //sus
            results[model.columnTitles[index+1]] = String(result)
        }
        for (index, result) in self.model.susResults_2.enumerated() { //sus
            results[model.columnTitles[index+11]] = String(result)
        }
        for (index, result) in self.model.susResults_3.enumerated() { //sus
            results[model.columnTitles[index+21]] = String(result)
        }
        
        for (index, result) in self.model.useResults_1.enumerated() { //use
            results[model.columnTitles[index+31]] = String(result)
        }
        for (index, result) in self.model.useResults_2.enumerated() { //use
            results[model.columnTitles[index+41]] = String(result)
        }
        for (index, result) in self.model.useResults_3.enumerated() { //use
            results[model.columnTitles[index+51]] = String(result)
        }
        
        for (index, result) in self.model.judging.enumerated() { //judging
            results[model.columnTitles[index+61]] = String(result)
        }
        
        results[self.model.columnTitles[64]] = model.name //name
        
        for (index, result) in self.model.scenario.enumerated() { //scenarios
            results[self.model.columnTitles[index+65]] = String(result)
        }
        
        self.model.data.append(results)
    }
    
    func getSavableString() -> String { //Make model.data into printable String or String to save
        pushLocalResultsToData()
        
        var tableString = ""
        var rowString = ""
        
        for row in self.model.data {
            rowString = ""
            for fieldName in self.model.columnTitles{
                guard let field = row[fieldName] else {
                    print("field not found: \(fieldName)")
                    continue
                }
                rowString += field + ","
            }
            rowString.removeLast()
            tableString += rowString + "\n"
        }
        return tableString
    }
    
    func writeDataToFile(file:String) -> Bool{
        // check our data exists
        let data = getSavableString()
        //get the file path for the file in the bundle
        // if it doesn't exist, make it in the bundle
        var fileName = file + ".txt"
        if let filePath = Bundle.main.path(forResource: file, ofType: "txt") {
            fileName = filePath
        } else {
            //            fileName = "\(Bundle.main.resource)\(fileName)"
        }
        //write the file, return true if it works, false otherwise.
        do{
            try data.write(toFile: fileName, atomically: true, encoding: String.Encoding.utf8 )
            return true
        } catch{
            return false
        }
    }
}

//MARK: Import Data
extension ResultView {
    func readDataFromFile(file:String) -> String!{
        guard let filepath =  Bundle.main.path(forResource: file, ofType: "txt" )
            else {
                return nil
        }
        do {
            let contents = try String(contentsOfFile: filepath)
            return contents
        } catch {
            print("File Read Error for file")
            return nil
        }
    }
    
    func convertCSVintoData(file: String) { //Import CSV into model.data
        let rows = cleanRows(file: file).components(separatedBy: "\n")
        if rows.count > 0 {
            self.model.data = []
            self.model.columnTitles = getStringFieldsForRow(row: rows.first!, delimiter:",")
            
            for row in rows {
                let fields = getStringFieldsForRow(row: row, delimiter: ",")
                if fields.count != self.model.columnTitles.count { continue }
                var dataRow = [String:String]()
                for (index, field) in fields.enumerated() {
                    let fieldName = self.model.columnTitles[index]
                    dataRow[fieldName] = field
                }
                self.model.data += [dataRow]
            }
        } else {
            print("No data in file")
        }
    }
    
    func pushDataToLocalResults() { // Push Data into the ResultObjects
        let results = self.model.data.removeLast() //TODO: Hier wird das letzte gelöscht!
        self.model.data.append(results)
        
        //        knowledge
        model.knowledge = Int(results[self.model.columnTitles[0]] ?? "0") ?? 0  //knowledge
        
        //        susResults
        for index in 0...9 {
            self.model.susResults_1[index] = Int(results[self.model.columnTitles[index + 1]] ?? "0") ?? 1
            self.model.susResults_2[index] = Int(results[self.model.columnTitles[index + 11]] ?? "0") ?? 0
            self.model.susResults_3[index] = Int(results[self.model.columnTitles[index + 21]] ?? "0") ?? 0
            
        }
        
        //        UseReults
        for index in 0...9 {
            self.model.useResults_1[index] = Int(results[self.model.columnTitles[index + 31]] ?? "0") ?? 0
            self.model.useResults_2[index] = Int(results[self.model.columnTitles[index + 41]] ?? "0") ?? 0
            self.model.useResults_3[index] = Int(results[self.model.columnTitles[index + 51]] ?? "0") ?? 0
            
        }
        
        //        Judging
        for index in 0...2 {
            self.model.judging[index] = Int(results[self.model.columnTitles[index + 61]] ?? "0") ?? 0
        }
        
        //        name
        self.model.name = results[self.model.columnTitles[64]] ?? "unknown"
        
        //        scenario
        for index in 0...2 {
            self.model.scenario[index] = Int(results[self.model.columnTitles[index+65]] ?? "0") ?? 0
        }
    }
    
    
}

extension ResultView {
    func getSUSResult() {
        var points = 0.0
        for (index, result) in model.susResults_1.enumerated() {
            if index % 2 != 0 {
                points += Double(result)
            } else {
                points += Double(-1 * (result - 4))
            }
        }
        points *= 2.5
        self.susResult = "\(Int(points)).\(Int(points * 10) % 10)"
    }
    
    func cleanRows(file:String)->String{
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        return cleanFile
    }
    
    func getStringFieldsForRow(row:String, delimiter:String) -> [String]{
        return row.components(separatedBy: delimiter)
    }
}
