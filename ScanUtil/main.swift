//
//  main.swift
//  ScanUtil
//
//  Created by Михаил Фокин on 02.07.2021.
//

import Foundation

let arguments = CommandLine.arguments
if arguments.count != 2 {
    print("Invalid number of arguments.")
    print("./ScanUtil path_to_folder")
    exit(-1)
}
guard let argument = arguments.last else { exit(-1) }

let scanUtil = ScanUtil(path: argument)
