class YandexMusicApi{
  void get(){}
}

class SpotifyApi{
  void findAll(){}
}

class VkMusicApi{
  void query(){}
}

////////////////
//////DIP
///////////////

abstract class MusicApi {
  void getTracks();
}
class MusicClient implements MusicApi{
  MusicApi client;
  MusicClient(this.client);

  @override
  void getTracks() {
   client.getTracks();
  }
}
class YandexMusicApiDIP implements MusicApi{
  @override
  void getTracks() {
   //realisation
  }
}

class SpotifyApiDIP implements MusicApi{
  @override
  void getTracks() {
    //realisation
  }
}

class VkMusicApiDIP implements MusicApi{
  @override
  void getTracks() {
    //realisation
  }
}

