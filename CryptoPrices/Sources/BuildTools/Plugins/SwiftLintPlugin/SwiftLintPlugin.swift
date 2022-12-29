//
//  SwiftLintPlugin.swift
//  BuildTools
//
//  Created by Doan Thieu on 28/12/2022.
//

import Foundation
import PackagePlugin

@main
struct SwiftLintPlugin: BuildToolPlugin {

    func createBuildCommands(context: PackagePlugin.PluginContext, target: PackagePlugin.Target) async throws -> [PackagePlugin.Command] {
        let configPath = context.package.directory
            .removingLastComponent()
            .removingLastComponent()
            .removingLastComponent()
            .appending(subpath: ".swiftlint.yml").string

        guard FileManager.default.fileExists(atPath: configPath) else {
            Diagnostics.error("Could not find configuration file for SwiftLint at: \(configPath)")
            return []
        }

        let swiftLintExecutable = try context.tool(named: "swiftlint")

        let swiftLintCommand = Command.buildCommand(
            displayName: "Linting sources of \(target.name)",
            executable: swiftLintExecutable.path,
            arguments: [
                "lint",
                "--config",
                configPath,
                "--strict",
                "--cache-path",
                context.pluginWorkDirectory,
                "--path",
                target.directory.string
            ]
        )

        return [swiftLintCommand]
    }
}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension SwiftLintPlugin: XcodeBuildToolPlugin {

    func createBuildCommands(context: XcodePluginContext, target: XcodeTarget) throws -> [Command] {
        let configPath = context.xcodeProject.directory
            .appending(subpath: ".swiftlint.yml").string

        guard FileManager.default.fileExists(atPath: configPath) else {
            Diagnostics.error("Could not find configuration file for SwiftLint at: \(configPath)")
            return []
        }

        let swiftLintExecutable = try context.tool(named: "swiftlint")

        let swiftLintCommand = Command.buildCommand(
            displayName: "Linting sources of \(target.displayName)",
            executable: swiftLintExecutable.path,
            arguments: [
                "lint",
                "--config",
                configPath,
                "--strict",
                "--cache-path",
                context.pluginWorkDirectory
            ]
        )

        return [swiftLintCommand]
    }
}
#endif
