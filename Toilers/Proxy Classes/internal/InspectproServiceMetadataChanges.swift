//# xsc 19.1.4-aa99e2-20190611

import SAPOData
import Foundation

internal class InspectproServiceMetadataChanges {
    static func merge(metadata: CSDLDocument) -> Void {
        metadata.hasGeneratedProxies = true
        InspectproServiceMetadata.document = metadata
        InspectproServiceMetadataChanges.merge1(metadata: metadata)
        try! InspectproServiceFactory.registerAll()
    }

    private static func merge1(metadata: CSDLDocument) -> Void {
        Ignore.valueOf_any(metadata)
        if !InspectproServiceMetadata.EntityTypes.loginType.isRemoved {
            InspectproServiceMetadata.EntityTypes.loginType = metadata.entityType(withName: "inspectpro.InspectproService.LoginType")
        }
        if !InspectproServiceMetadata.EntitySets.login.isRemoved {
            InspectproServiceMetadata.EntitySets.login = metadata.entitySet(withName: "Login")
        }
        if !LoginType.id.isRemoved {
            LoginType.id = InspectproServiceMetadata.EntityTypes.loginType.property(withName: "ID")
        }
        if !LoginType.password.isRemoved {
            LoginType.password = InspectproServiceMetadata.EntityTypes.loginType.property(withName: "Password")
        }
    }
}
