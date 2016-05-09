
/* Current Status
    This network is going to be used to create art by being trained on specific peices of art
  
*/


/*  Current Problems
   Clean code File Manager classs and move the saveweights() and loadWeights() methods to the network class
   Make the sizeof the network dependent on some setting rather than hardcoding the size and length into the array in the nettwork class
   
   
   Look into confidence intervals to prove that the network is learning
   Make the filemanager arraylist two dimensional to hold multiple neuron's traing data; currently it only pairs one input value with another output value
   Have a way of graphing the samples to see what function the net is learning 
 */
 

import java.io.FileReader;
Network network; 
FileManager dataMger;
ImageFileManager imageMger;
 String trainingPath = "C://Users//franco//Documents//github//Art_Work//Network//Images//monalisa.png";
void settings(){//settings() is needed toset size()in processing 3.0+
  size(640,480);
}
  void setup() {
  startNetwork(); //setups everything needed to use a neural net
 
}

void startNetwork(){
    dataMger = new FileManager(trainingPath, ""); //loads training data into the sketch
    imageMger = new ImageFileManager(trainingPath);
    network = new Network(); // sets a new network object 
    network.setStochastic(false); //set to either true or false to have stochastic gradient descent be a feature or disable by setting it to false;
   
    network.setBatchSize(1);
    network.startUp(); // starts the network and sets random bias values
    network.setLearningRate(.9);//sets the learnign rate for the network default is .01
    //if(new File("C://Users//franco//Documents//github//NeuralNetwork//Processing//Network//SavedWeights.txt").exists()) dataMger.loadWeights("C://Users//franco//Documents//github//NeuralNetwork//Processing//Network//SavedWeights.txt");
    noLoop();//stops the main from looping 
   
}

  void draw() {
   background(153);
  int limit = 2;
  int counter = 0;
   
   //while(counter < limit){
   //network.setInputVal(imageMger.getInput());//parameter is zero because only one data set has been loaded
  // network.feedForward();  
   //network.backProp(imageMger.getOutput());//parameter is zero because only one data set has been loaded
   //counter++;  
 //}
   //dataMger.saveWeights("C://Users//franco//Documents//github//NeuralNetwork//Processing//Network//SavedWeights.txt");//saves the networks weights
  imageMger.saveFinalImage("path");//path does not currently do anything
   println("done");
   exit();
}


    

    

    




  