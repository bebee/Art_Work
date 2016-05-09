import java.util.Scanner;
import java.io.File;
Scanner reader;
ArrayList<Float[]> input = new ArrayList<Float[]>(); //stores the input that the network would recieve
ArrayList<Float[]> output = new ArrayList<Float[]>(); //stores  the expectedoutput of the network for training
String filePath;
PImage trainingImage;
public class FileManager{
  
   FileManager(String path, String type){ //sets the path to the training data file
   filePath = path;
   if(type.equals("text")) ;//setTrainingData(path); //runs the method that loads the data into the sketch to train the network
   else if(type.equals("image")) {
     trainingImage = loadImage(path);
     setImageTrainingData();//set the parameter to be the image in the filepath using PImage
   }
     
   }
   /* //decaprated for now becuase of image work need to comeback t this to update it to use floats rather than Integers
   void setTrainingData(String path){ //used to change the path to training data for the network, it then reloads the fresh data into the sketch  
   filePath = path;
     try{
  Scanner reader = new Scanner(new File(path));
  reader.useDelimiter(" ");
  while(reader.hasNext()){
   reader.next();
  input.add(new Integer(parseInt(reader.next())));
  reader.next();
  output.add(new Integer(parseInt(reader.next())));
  }
  reader.close();
  }catch(Exception e){
   println(e); 
  }
 }
 */
 
 void setImageTrainingData(){ //used to load images as training data
   trainingImage.loadPixels();
   int size = trainingImage.width*trainingImage.height;
   input.add(new Float[size]);
   output.add(new Float[size]);
   for(int a = 0; a < output.size(); a++){//loops through different data sets if necessary
   for(int x = 0; x < size; x++){ // loops through all the pixels and reduces the color resolution to use lessprocessing power to run the net
     output.get(a)[x] = trainingImage.pixels[x];
     input.get(a)[x] = 0.0; //Just adding a white color to the input and expecting the mona lisa as output, the input data issomething that can be use to experiment
   }
   }
 }
   
  
  float [] getInput(int i){
    float [] tmp = {input.get(i).floatValue()};
    return tmp;
  }
  
  float [] getOutput(int i){
    float [] tmp = {output.get(i).floatValue()};
    return tmp;
  }
  
  float getImageOutput(int i){
    return output.get(i);
  }
  
  PImage getTrainingImage(int i){
    return input.get(i);
  }
  float getImageInput(int i){//needs to be worked on here as a placeholder right now
   return 0.0; 
  }
  
  int getTrainingDataSize(){ //returns the amount of sets of training data there is to use
   return input.size(); 
  }
   
   
    void loadWeights(String path){//opens text file that has stored weight values for later use
     try{
       Scanner reader = new Scanner(new File(path));
       while(reader.hasNext()){
         /*
         Sets the for loop to run through all the weights for that neuron
         then it reads which neuron the weights are for
         then it stores the weight values
         */
         int numOfWeights = reader.nextInt(); //stores the amount of weights for a neuron given by the save file
        
         int layer = reader.nextInt(); //reads the layer 
         int neuron = reader.nextInt();// and the neuron the weights are for
         for(int i = 0; i < numOfWeights; i++) network.getNeuron(layer, neuron).setWeight(i,reader.nextFloat()); 
       }
       reader.close();
     }catch(Exception e){
       println(e);
       println("Problem loading weight values from saved file");
     }
     
     println("Loaded Weights");
   }
   
   void saveWeights(String path){
  PrintWriter output = createWriter(path);
  for (int l = 0; l < net.size(); l++) {
    for ( int n =0; n <net.get(l).size(); n++) {
      output.print(network.getNeuron(l,n).getNumberOfWeights() + " " + l + " " + n); 
      /* 
      The first number is the number of weights the neuron has and it is used to load the weightts into the netowrk later
      the other two numbers store the layer and neuron index that we are saving the weights for
      The rest of the numbers are the actual weights
      */
      for(int j = 0 ; j <= net.get(l).get(n).getNumberOfWeights()-1; j++){
        output.print(" " + net.get(l).get(n).getWeight(j)); //stores the weight value of the connection between the current neuron on the previous layer's neuron
      }
      output.println();//start a new line to start a new set of weights for a different neuron
    }
  }
  output.flush();
  output.close();
   }
   
   String getTrainingDataPath(){
    return filePath; 
   }
  
}