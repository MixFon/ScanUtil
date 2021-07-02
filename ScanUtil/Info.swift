//
//  Info.swift
//  ScanUtil
//
//  Created by Михаил Фокин on 02.07.2021.
//

import Foundation

struct Info {
    private var js: [URL]
    private var unix: [URL]
    private var macOS: [URL]
    private var error: [URL]
    private var allFiles: Int
    private var start: DispatchTime
    private var end: DispatchTime
    
    init() {
        self.js = [URL]()
        self.unix = [URL]()
        self.macOS = [URL]()
        self.error = [URL]()
        self.allFiles = 0
        self.start = DispatchTime(uptimeNanoseconds: 0)
        self.end = DispatchTime(uptimeNanoseconds: 0)
    }
    
    mutating func incrementJS(file: URL) {
        self.js.append(file)
    }
    
    mutating func incrementUnix(file: URL) {
        self.unix.append(file)
    }
    
    mutating func incrementMacOS(file: URL) {
        self.macOS.append(file)
    }
    
    mutating func incrementError(file: URL) {
        self.error.append(file)
    }
    
    mutating func incrementAllFiles() {
        self.allFiles += 1
    }
    
    mutating func startTime() {
        self.start = DispatchTime.now()
    }
    
    mutating func endTime() {
        self.end = DispatchTime.now()
    }
    
    private func printFilesPaths(files: [URL]) {
        for file in files {
            print(file.absoluteURL)
        }
        print()
    }
    
    func getInfo() {
        print("JS suspicious files:")
        printFilesPaths(files: self.js)
        print("Unix suspicious files:")
        printFilesPaths(files: self.unix)
        print("MacOS suspicious files:")
        printFilesPaths(files: self.macOS)
        print("Errors files:")
        printFilesPaths(files: self.error)
        print("""
            Processed files:    \(self.allFiles)
            JS detects:"        \(self.js.count)
            Unix detects:       \(self.unix.count)
            MacOS detects:      \(self.macOS.count)
            Errors:             \(self.error.count)
            """)
        let timeInterval = Double(self.end.uptimeNanoseconds - self.start.uptimeNanoseconds) / 1_000_000_000
        print("Exection time:", timeInterval, "sec")
    }
}
