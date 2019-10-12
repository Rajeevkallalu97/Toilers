//# xsc 19.1.4-aa99e2-20190611

import SAPOData
import Foundation

internal class InspectproServiceStaticResolver {
    static func resolve() -> Void {
        InspectproServiceStaticResolver.resolve1()
    }

    private static func resolve1() -> Void {
        Ignore.valueOf_any(InspectproServiceMetadata.EntityTypes.loginType)
        Ignore.valueOf_any(InspectproServiceMetadata.EntitySets.login)
        Ignore.valueOf_any(LoginType.id)
        Ignore.valueOf_any(LoginType.password)
    }
}
