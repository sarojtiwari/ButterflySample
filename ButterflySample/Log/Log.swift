//
//  Log.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 09/03/2023.
//

import Foundation
enum Log {
    enum LogLevel {
        case info
        case warning
        case error
        case success
        
        fileprivate var prefix: String {
            switch self {
            case .info:
                return "⚠️ INFO ⚠️"
            case .warning:
                return "⚠️ WARN ⚠️"
            case .error:
                return "‼️ ALERT ‼️"
            case .success:
                return "✅✅ SUCCESS ✅✅"
            }
        }
    }
    
    struct Context {
        let file: String
        let function: String
        let line: Int
        
        var description: String {
            return "\((file as NSString).lastPathComponent):\(line)\(function)"
        }
    }
    
    static func info(_ str: String, shouldLogContect: Bool = true, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .info, str: str.description, shouldLogContect: shouldLogContect, context: context)
    }
    
    static func error(_ str: String, shouldLogContect: Bool = true, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .error, str: str.description, shouldLogContect: shouldLogContect, context: context)
    }
    
    static func success(_ str: String, shouldLogContect: Bool = true, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .success, str: str.description, shouldLogContect: shouldLogContect, context: context)
    }
    
    fileprivate static func handleLog(level: LogLevel, str: String, shouldLogContect: Bool, context: Context) {
        let logComponents = ["[\(level.prefix)]", str]
        var fullString = logComponents.joined(separator: " ")
        if shouldLogContect {
            fullString += " -> \(context.description)"
        }
        
        #if DEBUG
        print(fullString)
        #endif
    }
}
