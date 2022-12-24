public abstract class SW_Callout_b33372362ed182f1d4bbc132cd50 {

    public static String jsonContent(final Map<String, Object> eventContent) {
        final Map<String, Object> content = new Map<String, Object>(eventContent);
        content.put('UserId', UserInfo.getUserId());
        return JSON.serialize(content);
    }

    @future(callout=true)
    public static void callout(final String url, final String content) {
        final HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('X-Webhook-Token', '8f00f75b-58b3-49b3-a5aa-6848f3774b03');
        request.setBody(content);

        final Http http = new Http();
        http.send(request);
    }

}