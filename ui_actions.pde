public void playBut() {
  if (!song.isPlaying()) {
    song.play();
  }
}

public void stopBut() {
  if (song.isPlaying()) {
    song.pause();
    song.rewind();
  }
}

public void pauseBut() {
  if (song.isPlaying()) {
    song.pause();
  }
}

public void prevBut() {
}

public void nextBut() {
}

public void openBut() {  
  fileSelector.showOpenDialog(null);
  File file = fileSelector.getSelectedFile();
  if (file == null) {
    return;
  }
  if (song != null && song.isPlaying()) {
    song.pause();
    song.rewind();
    song.close();
  }
  song = m.loadFile(file.getAbsolutePath());
  fileSelector.setSelectedFile(null);
  song.play();
}