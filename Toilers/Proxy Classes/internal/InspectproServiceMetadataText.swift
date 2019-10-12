//# xsc 19.1.4-aa99e2-20190611

import SAPOData
import Foundation

internal class InspectproServiceMetadataText {
    internal static let xml: String = "<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?><edmx:Edmx Version=\"1.0\" xmlns:edmx=\"http://schemas.microsoft.com/ado/2007/06/edmx\"><edmx:DataServices xmlns:m=\"http://schemas.microsoft.com/ado/2007/08/dataservices/metadata\" m:DataServiceVersion=\"2.0\"><Schema Namespace=\"inspectpro.InspectproService\" xmlns:d=\"http://schemas.microsoft.com/ado/2007/08/dataservices\" xmlns:m=\"http://schemas.microsoft.com/ado/2007/08/dataservices/metadata\" xmlns=\"http://schemas.microsoft.com/ado/2008/09/edm\"><EntityType Name=\"LoginType\"><Key><PropertyRef Name=\"ID\" /></Key><Property Name=\"ID\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"36\" /><Property Name=\"Password\" Type=\"Edm.String\" MaxLength=\"32\" /></EntityType><EntityContainer Name=\"InspectproService\" m:IsDefaultEntityContainer=\"true\"><EntitySet Name=\"Login\" EntityType=\"inspectpro.InspectproService.LoginType\" /></EntityContainer></Schema></edmx:DataServices></edmx:Edmx>\n"
}
