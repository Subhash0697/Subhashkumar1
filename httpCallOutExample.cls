public class HttpCalloutExample {
    public static void makeHttpCallout() {
        // Define the HTTP request parameters
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://jsonplaceholder.typicode.com/posts/1'); // Replace with your API endpoint
        request.setMethod('GET');
        
        // Create an HTTP client to send the request
        Http http = new Http();
        
        // Send the request and receive the response
        HttpResponse response = http.send(request);
        
        // Check the response status code
        if (response.getStatusCode() == 200) {
            // Parse and print the response body
            String responseBody = response.getBody();
            System.debug('HTTP Response: ' + responseBody);
        } else {
            // Handle errors here if needed
            System.debug('HTTP Request failed with status code: ' + response.getStatusCode());
        }
    }
}