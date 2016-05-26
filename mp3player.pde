import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import controlP5.*;

import javax.swing.*;

Minim m = new Minim(this);
AudioPlayer song;
AudioMetaData meta;

ControlP5 ui;

JFileChooser fileSelector;
PImage seeker, bg;

void setup() {
  bg = loadImage("main.png");
  seeker = loadImage("seeker.png");
  

  PImage[] playBut = {loadImage("play.png"), loadImage("play.png"), loadImage("play.png")};
  PImage[] pauseBut = {loadImage("pause.png"), loadImage("pause.png"), loadImage("pause.png")};
  PImage[] stopBut = {loadImage("stop.png"), loadImage("stop.png"), loadImage("stop.png")};
  PImage[] prevBut = {loadImage("prev.png"), loadImage("prev.png"), loadImage("prev.png")};
  PImage[] nextBut = {loadImage("next.png"), loadImage("next.png"), loadImage("next.png")};
  PImage[] openBut = {loadImage("openfile.png"), loadImage("openfile.png"), loadImage("openfile.png")};

  fileSelector = new JFileChooser();


  ui = new ControlP5(this);
  ui.addButton("playBut").setPosition(35, 105).setImages(playBut).updateSize();
  ui.addButton("stopBut").setPosition(75, 105).setImages(stopBut).updateSize();
  ui.addButton("pauseBut").setPosition(55, 105).setImages(pauseBut).updateSize();
  ui.addButton("prevBut").setPosition(15, 105).setImages(prevBut).updateSize();
  ui.addButton("nextBut").setPosition(95, 105).setImages(nextBut).updateSize();
  ui.addButton("openBut").setPosition(120, 105).setImages(openBut).updateSize();

  String[] args = {"TwoFrameTest"};
  SecondApplet sa = new SecondApplet();
  PApplet.runSketch(args, sa);
};

void settings() {
  size(375, 120);
}

void draw() {
  image(bg, 0, 0);
  if (song != null) {
    meta = song.getMetaData();
    image(seeker, (int)(song.position()/song.length()*(bg.width-seeker.width)), 84);
    textSize(20);
    text(meta.title(), (bg.width-textWidth(meta.title()))/2, 20);
    textSize(20);
    text(meta.author(), (bg.width-textWidth(meta.title()))/2, 40);

    int timeLeft = song.position()-song.length();
    String timeLeftStr = String.format("%02d:%02d", timeLeft/1000/60, -timeLeft/1000%60);
    text( timeLeftStr, (bg.width-textWidth(timeLeftStr))/2, 80);
  }
};