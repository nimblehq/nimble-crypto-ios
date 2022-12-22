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
            Diagnostics.error("Could not find templates at: \(templatesPath)")
            return []
        }

        let sourceryExecutable = try context.tool(named: "sourcery")

        let sourceryCommand = Command.prebuildCommand(
            displayName: "Generate mocked types for \(target) target",
            executable: sourceryExecutable.path,
            arguments: [
                "--sources",
                target.directory,
                "--templates",
                templatesPath,
                "--args",
                "autoMockableImports=\([target.name] + target.recursiveTargetDependencies.map(\.name))",
                "--output",
                context.package.directory.appending("Sources", "\(context.package.displayName)Mocks"),
                "--verbose"
            ],
            outputFilesDirectory: context.pluginWorkDirectory
        )

        return [sourceryCommand]
    }
}
