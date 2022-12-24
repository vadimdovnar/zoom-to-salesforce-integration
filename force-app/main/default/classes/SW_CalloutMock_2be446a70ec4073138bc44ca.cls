@isTest
global class SW_CalloutMock_2be446a70ec4073138bc44ca implements HttpCalloutMock {
    private String endpointUrl;

    global SW_CalloutMock_2be446a70ec4073138bc44ca(String endpointUrl) {
        this.endpointUrl = endpointUrl;
    }

    global HTTPResponse respond(HTTPRequest req) {
        System.assertEquals('POST', req.getMethod());

        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"example": "test"}');
        res.setStatusCode(200);
        return res;
    }
}