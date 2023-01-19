// This file contains the fastlane.tools configuration
// You can find the documentation at https://docs.fastlane.tools
//
// For a list of all available actions, check out
//
//     https://docs.fastlane.tools/actions
//

import Foundation

class Fastfile: LaneFile {

    // MARK: - Code signing

    func syncAdHocStagingCodeSigningLane() {
        desc("Sync the Ad Hoc match signing for the Staging build")
        Match.syncCodeSigning(
            type: .adHoc,
            appIdentifier: [Constant.stagingBundleId]
        )
    }

    func syncAdHocProductionCodeSigningLane() {
        desc("Sync the Ad Hoc match signing for the Production build")
        Match.syncCodeSigning(
            type: .adHoc,
            appIdentifier: [Constant.productionBundleId]
        )
    }

    // MARK: - Build

    func buildAdHocStagingLane() {
        desc("Build ad-hoc staging")
        Build.adHoc(environment: .staging)
    }

    func buildAdHocProductionLane() {
        desc("Build ad-hoc production")
        Build.adHoc(environment: .production)
    }
    
    // MARK: - Test

    func buildAndTestLane() {
        desc("Build and test project")
        Test.buildAndTest(
            environment: .staging,
            targets: [
                Constant.testTarget,
                // TODO: - Put back when we actually add UI tests
//                Constant.uiTestTarget,
                Constant.repositoriesTestTarget,
                Constant.homeTestTarget,
                Constant.myCoinTestTarget,
                Constant.styleguideTestTarget,
                Constant.useCaseTestTarget,
                Constant.kifUITestTarget
            ],
            devices: Constant.devices
        )
    }

    // MARK: - Upload builds to Firebase and AppStore

    func buildStagingAndUploadToFirebaseLane() {
        desc("Build Staging app and upload to Firebase")

        setAppVersion()
        bumpBuild()

        buildAdHocStagingLane()

        // TODO: - Make release notes
        Distribution.uploadToFirebase(environment: .staging, releaseNotes: "")

        Build.saveBuildContextToCI()
    }

    func buildProductionAndUploadToFirebaseLane() {
        desc("Build Staging app and upload to Firebase")

        setAppVersion()
        bumpBuild()

        buildAdHocProductionLane()

        // TODO: - Make release notes
        Distribution.uploadToFirebase(environment: .production, releaseNotes: "")

        Build.saveBuildContextToCI()
    }

    // MARK: - Register device

    func registerNewDeviceLane() {
        let deviceName = prompt(text: "Enter the device name:")
        let deviceUDID = prompt(text: "Enter the device UDID:")

        registerDevice(
            name: deviceName,
            udid: deviceUDID,
            teamId: .userDefined(Constant.teamId)
        )

        Match.syncCodeSigning(type: .development, appIdentifier: [], isForce: true)
        Match.syncCodeSigning(type: .adHoc, appIdentifier: [], isForce: true)
    }

    // MARK: - Utilities

    func cleanUpOutputLane() {
        desc("Clean up Output")
        clearDerivedData(derivedDataPath: Constant.outputPath)
    }

    // MARK: - Private Helper

    private func setAppVersion() {
        desc("Check if any specific version number in build environment")
        guard !Constant.manualVersion.isEmpty else { return }
        incrementVersionNumber(
            versionNumber: .userDefined(Constant.manualVersion)
        )
    }

    private func bumpBuild(buildNumber: Int = numberOfCommits()) {
        desc("Set build number with number of commits")
        incrementBuildNumber(
            buildNumber: .userDefined(String(buildNumber)),
            xcodeproj: .userDefined(Constant.projectPath)
        )
    }
}
