import Foundation
import PackagePlugin

@main
struct SourceryPlugin: BuildToolPlugin {

    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let templatesPath = context.package.directory
            .removingLastComponent()
            .removingLastComponent()
            .removingLastComponent()
            .appending(subpath: "sourcery/templates").string

        guard FileManager.default.fileExists(atPath: templatesPath) else {
            Diagnostics.error("Could not find templates for Sourcery at: \(templatesPath)")
            return []
        }

        let generatedDirectory = context.pluginWorkDirectory.appending("SourceryGenerated")

        // Command to remove the previously-generated codes
        let clearCommand = Command.prebuildCommand(
            displayName: "Clear previously-generated data",
            executable: .init("/bin/rm"),
            arguments: [
                "-rf",
                generatedDirectory
            ],
            outputFilesDirectory: generatedDirectory
        )

        let sourceryExecutable = try context.tool(named: "sourcery")

        // Command to generate codes from latest changes
        let sourceryCommand = Command.prebuildCommand(
            displayName: "Generate mocked types for \(target) target",
            executable: sourceryExecutable.path,
            arguments: [
                "--sources",
                target.directory,
                "--templates",
                templatesPath,
                "--args",
                "autoMockableImports=\(target.recursiveTargetDependencies.map(\.name))",
                "--output",
                generatedDirectory,
                "--verbose"
            ],
            outputFilesDirectory: generatedDirectory
        )

        return [clearCommand, sourceryCommand]
    }
}
