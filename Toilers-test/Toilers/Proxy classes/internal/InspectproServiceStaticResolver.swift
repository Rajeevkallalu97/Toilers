//# xsc 19.1.5-b4e07e-20190905

import Foundation
import SAPOData

internal class InspectproServiceStaticResolver {
    static func resolve() -> Void {
        InspectproServiceStaticResolver.resolve1()
    }

    private static func resolve1() -> Void {
        Ignore.valueOf_any(InspectproServiceMetadata.EntityTypes.inspectorType)
        Ignore.valueOf_any(InspectproServiceMetadata.EntityTypes.loginType)
        Ignore.valueOf_any(InspectproServiceMetadata.EntityTypes.supervisorType)
        Ignore.valueOf_any(InspectproServiceMetadata.EntitySets.inspector)
        Ignore.valueOf_any(InspectproServiceMetadata.EntitySets.login)
        Ignore.valueOf_any(InspectproServiceMetadata.EntitySets.supervisor)
        Ignore.valueOf_any(InspectorType.id)
        Ignore.valueOf_any(InspectorType.name)
        Ignore.valueOf_any(InspectorType.address)
        Ignore.valueOf_any(InspectorType.password)
        Ignore.valueOf_any(InspectorType.phoneNumber)
        Ignore.valueOf_any(LoginType.id)
        Ignore.valueOf_any(LoginType.password)
        Ignore.valueOf_any(SupervisorType.id)
        Ignore.valueOf_any(SupervisorType.name)
        Ignore.valueOf_any(SupervisorType.address)
        Ignore.valueOf_any(SupervisorType.password)
        Ignore.valueOf_any(SupervisorType.phoneNumber)
    }
}
