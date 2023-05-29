class AudioPlayer {
  double volume=0;
  bool isplaying=false;

  void play() {
    print("start playing audio");
  }

  void pause() {
    print("pause audio playback");
  }

  void stop() {
    print("stop playing audio");
  }
}

class Visualizer
{
  void visualizeAudio()
  {
    print("to visualize the audio being played ");
  }
}
class Equalizer
{
  void adjustEqualizer()
  {
    print("to adjust the audio equalizer settings ");
  }
}

class MusicPlayer extends AudioPlayer implements Visualizer,Equalizer
{
  @override
  void adjustEqualizer() {
    // TODO: implement adjustEqualizer
    print("Adjust Equalizer");
  }

  @override
  void visualizeAudio() {
    // TODO: implement visualizeAudio
    print("Visulization Audio");
  }

  @override
  void play() {
    // TODO: implement play
    super.play();
  }

  void adjustAudio()
  {
    print("show audio visualization ");
  }

  void showVisualization()
  {
    print("adjust audio settings ");
  } 
}

void main(List<String> args) {
  MusicPlayer m=MusicPlayer();
  m.adjustEqualizer();
  m.play();
  m.adjustAudio();
}