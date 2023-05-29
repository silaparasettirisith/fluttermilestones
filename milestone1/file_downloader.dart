import 'dart:io';

void main() async {
  // Get the list of files to download.
  List<String> urls = [
    "https://th.bing.com/th/id/OIP.OF59vsDmwxPP1tw7b_8clQHaE8?pid=ImgDet&rs=1",
    "https://th.bing.com/th/id/OIP.rvSWtRd_oPRTwDoTCmkP5gAAAA?pid=ImgDet&rs=1",
    "https://th.bing.com/th?id=OIP.MBlOJPg-beF5E6q2yR5k9gAAAA&w=204&h=306&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"
  ];
  var c=0;
  urls.forEach((e)
  {
    c=c+1;
    return filedownload(e,c);
  });

}

void filedownload(String urls,int c) async {
  HttpClient client = new HttpClient();
  HttpClientRequest request = await client.getUrl(Uri.parse(urls));
  HttpClientResponse response = await request.close();
  print("downloaded $c");
  response.pipe(new File('./logo_pipe$c.png').openWrite());
}
