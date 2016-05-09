import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_151211a extends PApplet {



public void setup(){
  
}

public void draw(){
  background(200);
  
  rect(0,0, 50, 50);
  
 // Network net = new Network();
  
}
 public class Network{
  
  Network(int layers, int [] n){
    
  }
  
  
}
public class Neuron {
  //private int 
  Neuron() {
    
  }
}
 public class Robot{
  private int x,y,size;
  Robot(int startx, int starty, int s){
    this.x = startx;
    this.y = starty;
    this.size = s;
}
 
 
}
  public void settings() {  size(300,300); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_151211a" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
