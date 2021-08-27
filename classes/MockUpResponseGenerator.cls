/**
 * Created by gill.bilal on 25/08/2021.
 */

public with sharing class MockUpResponseGenerator implements HttpCalloutMock  {
        public String body = '';
        public Integer statusCode = 200;

        public MockUpResponseGenerator(String body, Integer statusCode) {
            this.body = body;
            this.statusCode = statusCode;
        }

        public HTTPResponse respond(HTTPRequest request) {
            // Create a fake response
            HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'application/json');
            response.setBody(body);
            response.setStatusCode(statusCode);
            return response;
        }
}