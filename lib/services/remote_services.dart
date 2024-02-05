import 'package:api_tutorial/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService{

  Future<List<Post>?> getPosts() async{

    //This line creates an instance of the http.Client class, which can be used to send HTTP requests.
    var client = http.Client();

   //This line creates a Uri object representing the target URL 'https://jsonplaceholder.typicode.com/posts'.
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    //This line sends an asynchronous HTTP GET request to the specified URL using the previously created client.
    // The await keyword is used to wait for the response.
    var response = await client.get(uri);

    //This conditional statement checks if the HTTP response status code is 200 (OK), indicating a successful request.
    if(response.statusCode == 200){

      //If the response status code is 200, this section retrieves the response body (assumed to be JSON)
      // and converts it to a Dart object using a function called postFromJson. 
      var json = response.body;
      return postFromJson(json);

    }
    return null;

  }
}