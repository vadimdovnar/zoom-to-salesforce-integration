@RestResource(urlMapping='/zoom/webhooks/*')
global without sharing class DemoZoomWebhookSubscriptions {

    // private Final String SIGNATURE_VALID_MESSAGE = 'Signature verified';
    // private Final String SIGNATURE_INVALID_MESSAGE = 'Signature could not be verified';
    // private Final String ZOOM_WEBHOOK_SECRET_TOKEN = 'xycg1AC2S66zaPbC9NA0VQ';


    @HttpPost
    global static void doPost() {
        RestResponse response = RestContext.response;
        response.addHeader('Content-Type', 'application/json');
        String responseString = RestContext.request.requestBody.toString();
        System.debug( System.LoggingLevel.DEBUG, '**** \n' + responseString );
        
        response.responseBody = Blob.valueOf('{success; true, event: "Unknonw"}');
        response.statusCode =200;
    }

    // @HttpGet
    // global static String doGet(){
    //     System.debug(System.LoggingLevel.DEBUG, '**** \n' + 'LOOOOOOOG' );
    //     return '{"message: "JOPA"}';
    // }

    // @HttpPost
    // global static void doPost() {
    //     String SIGNATURE_VALID_MESSAGE = 'Signature verified';
    //     RestResponse response = RestContext.response;
    //     response.addHeader('Content-Type', 'application/json');
    //     String responseString = RestContext.request.requestBody.toString();
    //     System.debug( System.LoggingLevel.DEBUG, '**** responseString ***** \n' + responseString );

    //     String responseValid = generateSignature(RestContext.request, responseString);
    //     // String responseValid = WebhooksController.generateSignature(RestContext.request, responseString);
    //     System.debug( System.LoggingLevel.DEBUG, + 'response generateSignature \n ' + responseValid  );
    //     if(responseValid != SIGNATURE_VALID_MESSAGE){
    //         response.responseBody = Blob.valueOf('{success: false, event: "Unknown", "message: "'+responseValid+'"}');
    //         response.statusCode = 401;
    //         System.debug( System.LoggingLevel.DEBUG, + '!!!!!!!! Signature could not be verified !!!!!!!' );
    //         return;
    //     } else{
    //         System.debug( System.LoggingLevel.DEBUG, + '!!!!!!!!!!Signature verified !!!!!!!' );
    //         response.responseBody = Blob.valueOf('{success: true, event: "Unknown"}');
    //         response.statusCode = 200;
    //     }
    // }

    // private static String generateSignature(RestRequest request, String responseString) {
    //     //OAth
    //     // String ZOOM_WEBHOOK_SECRET_TOKEN = 'xycg1AC2S66zaPbC9NA0VQ';
    //     //Webhook
    //     String ZOOM_WEBHOOK_SECRET_TOKEN = 'Z9Pbkrp-QBeO6AX8GLqhAw';
    //     Map<String, String> headers = request.headers;

    //     String signature = headers.get('x-zm-signature');
    //     System.debug(System.LoggingLevel.DEBUG, '**************** SIGNATURE ***************** \n' + signature );

    //     Map<String, String> sigMap = new Map<String, String>();
    //     List<String> signatures = signature.split(',');
    //     System.debug(System.LoggingLevel.DEBUG, '**************** SIGNATURES ***************** \n' + signatures );
        
    //     for (String kv : signatures) {
    //         sigMap.put( kv.split('=')[0], kv.split('=')[1] );
    //     }
    //     System.debug(System.LoggingLevel.DEBUG, '**************** SIGMap ***************** \n' + sigMap );
        
    //     String signature_payload = sigMap.get('v0') + '.'+responseString;
    //     System.debug(System.LoggingLevel.DEBUG, '**************** signature_payload ***************** \n' + signature_payload );
    //     Blob input = Blob.valueOf(signature_payload);

    //     Blob privateKey = Blob.valueOf(ZOOM_WEBHOOK_SECRET_TOKEN);

    //     Blob hmac = Crypto.generateMac('HmacSHA256', input, privateKey);
    //     System.debug(System.LoggingLevel.DEBUG, '**************** hmac ***************** \n' + hmac );
    //     String incomingSignature = sigMap.get('v0');
    //     System.debug(System.LoggingLevel.DEBUG, '**************** \n Incoming signature' + incomingSignature );

    //     String response = (incomingSignature == EncodingUtil.convertToHex(hmac)) ? 'Signature verified' : 'Signature could not be verified';
    //     System.debug(System.LoggingLevel.DEBUG, '**************** RESPONSE ***************** \n' + response );
    //     return response;
	// }

}

// const message = `v0:${request.headers['x-zm-request-timestamp']}:${JSON.stringify(request.body)}`

// const hashForVerify = crypto.createHmac('sha256', ZOOM_WEBHOOK_SECRET_TOKEN).update(message).digest('hex')

// const signature = `v0=${hashForVerify}`

// if (request.headers['x-zm-signature'] === signature) {
//   // Webhook request came from Zoom
// } else {
//   // Webhook request did not come from Zoom
// }