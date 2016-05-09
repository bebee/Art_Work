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
     output[x] = trainingImage.pixels[x];
     input[x] = 0.0; //Just adding a white color to the input and expecting the mona lisa as output, the input data issomething that can be use to experiment
   }
   }
 
  
    float[] getOutput(){//returns the expected output for the net
    return output;
  }
  float[] getInput(){//returns the input for the net
   return input; 
  }
  
}