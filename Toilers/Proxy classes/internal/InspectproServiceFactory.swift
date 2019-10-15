//# xsc 19.1.5-b4e07e-20190905

import Foundation
import SAPOData

internal class InspectproServiceFactory {
    static func registerAll() throws -> Void {
        InspectproServiceMetadata.EntityTypes.inspectorType.registerFactory(ObjectFactory.with(create: { InspectorType(withDefaults: false) }, createWithDecoder: { d in try InspectorType(from: d) } ))
        InspectproServiceMetadata.EntityTypes.loginType.registerFactory(ObjectFactory.with(create: { LoginType(withDefaults: false) }, createWithDecoder: { d in try LoginType(from: d) } ))
        InspectproServiceMetadata.EntityTypes.supervisorType.registerFactory(ObjectFactory.with(create: { SupervisorType(withDefaults: false) }, createWithDecoder: { d in try SupervisorType(from: d) } ))
        InspectproServiceStaticResolver.resolve()
    }
}
