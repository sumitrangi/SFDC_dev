//Generated by wsdl2apex

public class AsyncAutoGenerated_InventoryManagementWS {
    public class installSerialResponse_elementFuture extends System.WebServiceCalloutFuture {
        public String getValue() {
            AutoGenerated_InventoryManagementWS.installSerialResponse_element response = (AutoGenerated_InventoryManagementWS.installSerialResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class AsyncInventoryManagementWS {
        public String endpoint_x = 'https://na15.salesforce.com/services/Soap/class/InventoryManagementWS';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        public AutoGenerated_InventoryManagementWS.SessionHeader_element SessionHeader;
        public AutoGenerated_InventoryManagementWS.AllowFieldTruncationHeader_element AllowFieldTruncationHeader;
        public AutoGenerated_InventoryManagementWS.CallOptions_element CallOptions;
        public AutoGenerated_InventoryManagementWS.DebuggingInfo_element DebuggingInfo;
        public AutoGenerated_InventoryManagementWS.DebuggingHeader_element DebuggingHeader;
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/schemas/class/InventoryManagementWS';
        private String AllowFieldTruncationHeader_hns = 'AllowFieldTruncationHeader=http://soap.sforce.com/schemas/class/InventoryManagementWS';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/schemas/class/InventoryManagementWS';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/schemas/class/InventoryManagementWS';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/schemas/class/InventoryManagementWS';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/schemas/class/InventoryManagementWS', 'AutoGenerated_InventoryManagementWS'};
        public AsyncAutoGenerated_InventoryManagementWS.installSerialResponse_elementFuture beginInstallSerial(System.Continuation continuation,String serialNo,String siteId) {
            AutoGenerated_InventoryManagementWS.installSerial_element request_x = new AutoGenerated_InventoryManagementWS.installSerial_element();
            request_x.serialNo = serialNo;
            request_x.siteId = siteId;
            return (AsyncAutoGenerated_InventoryManagementWS.installSerialResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncAutoGenerated_InventoryManagementWS.installSerialResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/InventoryManagementWS',
              'installSerial',
              'http://soap.sforce.com/schemas/class/InventoryManagementWS',
              'installSerialResponse',
              'AutoGenerated_InventoryManagementWS.installSerialResponse_element'}
            );
        }
    }
}