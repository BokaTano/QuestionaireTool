//
//  Model.swift
//  Questionaire-tool
//
//  Created by Celina on 05.08.19.
//  Copyright © 2019 CelinaLandgraf. All rights reserved.
//

import Foundation

final class Model: ObservableObject {
    @Published var data:[[String:String]] = []
    
    @Published var name = "Lich"
    @Published var scenario_one = [0,1,2]
    
    //results
    @Published var knowledge = 2
    @Published var susResults_1 = [2,2,2,2,2,2,2,2,2,2]
    @Published var susResults_2 = [2,2,2,2,2,2,2,2,2,2]
    @Published var susResults_3 = [2,2,2,2,2,2,2,2,2,2]
    @Published var useResults_1 = [2,2,2,2,2,2,2,2,2,2]
    @Published var useResults_2 = [2,2,2,2,2,2,2,2,2,2]
    @Published var useResults_3 = [2,2,2,2,2,2,2,2,2,2]
    @Published var judging = [2,2,2]
    
    @Published var selection = "Start"
    
    var techniques = [["Buttons", "Picker", "Force Touch"],
                    ["Picker", "Stepper", "Button"],
                    ["Swipe", "Manuelle Eingabe", "Swipe"]]
    
    var columnTitles = ["knowledge",
                        "sus1.0", "sus1.1", "sus1.2", "sus1.3", "sus1.4", "sus1.5", "sus1.6", "sus1.7", "sus1.8", "sus1.9",
                        "sus2.0", "sus2.1", "sus2.2", "sus2.3", "sus2.4", "sus2.5", "sus2.6", "sus2.7", "sus2.8", "sus2.9",
                        "sus3.0", "sus3.1", "sus3.2", "sus3.3", "sus3.4", "sus3.5", "sus3.6", "sus3.7", "sus3.8", "sus3.9",
                        "use1.0", "use1.1", "use1.2", "use1.3", "use1.4", "use1.5", "use1.6", "use1.7", "use1.8","use1.9",
                        "use2.0", "use2.1", "use2.2", "use2.3", "use2.4", "use2.5", "use2.6", "use2.7", "use2.8","use2.9",
                        "use3.0", "use1.1", "use3.2", "use3.3", "use3.4", "use3.5", "use3.6", "use3.7", "use3.8","use3.9",
                        "judging0", "judging1", "judging2", "name"]
    
    let susStatements = ["Ich denke, dass ich diese App gerne regelmäßig nutze.",
                         "Ich fand die App unnötig komplex.",
                         "Ich denke, die App war leicht zu benutzen.",
                         "Ich denke, ich würde die  Unterstützung einer fachkundigen Person benötigen, um die App benutzen zu können.",
                         "Ich fand, die verschiedenen Funktionen der App waren gut integriert.",
                         "Ich halte die App für zu inkonsistent.",
                         "Ich glaube, dass die meisten Menschen sehr schnell lernen würden, mit der App umzugehen.",
                         "Ich fand die App sehr umständlich zu benutzen.",
                         "Ich fühlte mich bei der Nutzung der App sehr sicher.",
                         "Ich musste viele Dinge lernen, bevor ich  mit der App arbeiten konnte."]
    
    let useStatements = ["Es ist einfach zu benutzen.",
                         "Es ist nutzerfreundlich.",
                         "Es braucht die wenigsten Schritte um das zu erreichen, was ich ich erreichen möchte.",
                         
                         "Ich lernte schnell es zu benutzen.",
                         "Ich erinnere mich einfach daran, wie es zu benutzen ist.",
                         "Ich wurde schnell geschickt damit.",
                         
                         "Ich bin zufrieden damit.",
                         "Es macht Spaß es zu benutzen.",
                         "Es funktioniert, so wie ich es möchte.",
                         "Es ist wunderbar."]
    
    let useQuestions = ["Was halten Sie von der Oberfläche mit der Sie die Handstandübung ausgewählt haben?",
                        "Was halten Sie von der Oberfläche mit der Sie die Übungsdauer ausgewählt haben?",
                        "Was halten Sie von der Oberfläche mit der die Übung gestartet hast?"]
    
}

struct Results: Codable {
    var knowledge = 0
    var susResults = [2,2,2,2,2,2,2,2,2,2]
    var useResults_1 = [2,2,2,2,2,2,2,2,2,2]
    var useResults_2 = [2,2,2,2,2,2,2,2,2,2]
    var useResults_3 = [2,2,2,2,2,2,2,2,2,2]
    var judging = [0,0,0]
}


enum DetailViewType: String, Equatable {
//    "USE-Skala 1.1", "USE-Skala 1.2", "USE-Skala 1.3", "USE-Skala 2.1", "USE-Skala 2.3", "USE-Skala 3.1", "USE-Skala 3.2", "USE-Skala 3.3",
    case start = "Start"
    case bekanntheitsgrad = "Bekanntheitsgrad"
    case sus_scale_1 = "SUS-Skala 1"
    case sus_scale_2 = "SUS-Skala 2"
    case sus_scale_3 = "SUS-Skala 3"
    case use_scale_first_1 = "USE-Skala 1.1"
    case use_scale_first_2 = "USE-Skala 1.2"
    case use_scale_first_3 = "USE-Skala 1.3"
    case use_scale_second_1 = "USE-Skala 2.1"
    case use_scale_second_2 = "USE-Skala 2.2"
    case use_scale_second_3 = "USE-Skala 2.3"
    case use_scale_third_1 = "USE-Skala 3.1"
    case use_scale_third_2 = "USE-Skala 3.2"
    case use_scale_third_3 = "USE-Skala 3.3"
    case finale_opinion = "Finale Meinung"
    case results = "Ergebnisse"
}

class User: ObservableObject {
    
}
