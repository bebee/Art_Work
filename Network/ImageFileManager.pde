public class ImageFileManager{
PImage trainingImage; 
float [] output;
float [] input;
int imgSize;



  ImageFileManager(String path){
   trainingImage = loadImage(path);
   imgSize = trainingImage.width*trainingImage.height;
      input = new float[imgSize];
   output = new float[imgSize];
   setImageTrainingData();
  }
  
  
   void setImageTrainingData(){ //used to load images as training data
   trainingImage.loadPixels();
   for(int x = 0; x < imgSize; x++){ 
     output[x] = trainingImage.pixels[x]/2000000000;
     input[x] = 0.0; //Just adding a white color to the input and expecting the mona lisa as output, the input data issomething that can be use to experiment
   }
   PrintWriter writer = createWriter("imageOutput.txt");
   for( int x = 0; x < 1280; x ++){
    writer.println(output[x]); 
   }
   writer.flush();
   writer.close();
   }
 
  
    float[] getOutput(){//returns the expected output for the net
    return output;
  }
  float[] getInput(){//returns the input for the net
   return input; 
  }
  
  void saveFinalImage(String path){//saves the final output of the net as an image
   PImage img = createImage(256,256,ARGB);
   img.loadPixels();
   PrintWriter writer = createWriter("PixelColors.txt");
   for(int x = 0; x < network.getSize(network.getSize()-1);x++){
    // img.pixels[x] = (int)output[x];
   img.pixels[x] = (int)(network.getOutputVal()[x] * 2000000000);
   writer.println(network.getOutputVal()[x]);
   }
   writer.flush();
   writer.close();
   img.updatePixels();
   img.save("monalisa's_sister.png");
  }
  
}