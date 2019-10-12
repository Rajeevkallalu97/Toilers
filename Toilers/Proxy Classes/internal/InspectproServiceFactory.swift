//# xsc 19.1.4-aa99e2-20190611

import SAPOData
import Foundation

internal class InspectproServiceFactory {
    static func registerAll() throws -> Void {
        InspectproServiceMetadata.EntityTypes.loginType.registerFactory(ObjectFactory.with(create: { LoginType(withDefaults: false) }, createWithDecoder: { d in try LoginType(from: d) } ))
        InspectproServiceStaticResolver.resolve()
    }
}
