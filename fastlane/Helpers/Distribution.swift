//
//  Distribution.swift
//  FastlaneRunner
//
//  Created by by Mike Pham on 29/11/2022.
//  Copyright © 2022 Nimble. All rights reserved.
//

import Foundation

enum Distribution {

    static func uploadToFirebase(
        environment: Constant.Environment,
        groups: String = Constant.firebaseTesterGroups,
        releaseNotes: String
    ) {
        let ipaPath = makeIPAPath(environment: environment)
        firebaseAppDistribution(
            ipaPath: .userDefined(ipaPath),
            app: .userDefined(environment.firebaseAppId),
            groups: .userDefined(groups),
            releaseNotes: .userDefined(releaseNotes),
            firebaseCliToken: .userDefined(Secret.firebaseCLIToken),
            debug: .userDefined(true)
        )
    }

    private static func makeIPAPath(environment: Constant.Environment) -> String {
        "\(Constant.outputPath)/\(environment.productName).ipa"
    }
}
