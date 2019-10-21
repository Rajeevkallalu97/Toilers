//# xsc 19.1.5-b4e07e-20190905

import Foundation
import SAPOData

internal class InspectproServiceMetadataParser {
    internal static let options: Int = (CSDLOption.allowCaseConflicts | CSDLOption.disableFacetWarnings | CSDLOption.disableNameValidation | CSDLOption.processMixedVersions | CSDLOption.retainOriginalText | CSDLOption.ignoreUndefinedTerms)

    internal static let parsed: CSDLDocument = InspectproServiceMetadataParser.parse()

    static func parse() -> CSDLDocument {
        let parser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = InspectproServiceMetadataParser.options
        let metadata = parser.parseInProxy(InspectproServiceMetadataText.xml, url: "inspectpro.InspectproService")
        metadata.proxyVersion = "19.1.5-b4e07e-20190905"
        return metadata
    }
}
