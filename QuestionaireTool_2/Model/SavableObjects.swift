//
//  SavableObjects.swift
//  QuestionaireTool_2
//
//  Created by Celina on 26.08.19.
//  Copyright © 2019 CelinaLandgraf. All rights reserved.
//

import Foundation

struct Answers: Codable {
    var knowledge = 0
    var susResults_1 = [2,2,2,2,2,2,2,2,2,2]
    var susResults_2 = [2,2,2,2,2,2,2,2,2,2]
    var susResults_3 = [2,2,2,2,2,2,2,2,2,2]
    var useResults_1 = [2,2,2,2,2,2,2,2,2,2]
    var useResults_2 = [2,2,2,2,2,2,2,2,2,2]
    var useResults_3 = [2,2,2,2,2,2,2,2,2,2]
    var judging = [0,0,0]
}

struct User: Codable {
    var name = "unkown"
    var scenario = [0,1,2]
}

