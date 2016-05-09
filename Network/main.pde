
/* Current Status
    This network is going to be used to create art by being trained on specific peices of art

*/


/*  Current Problems
   Clean code in General
   Make robot class that will recieve sensor data and control the robot using the network
   Look into confidence intervals to prove that the network is learning
   Make the filemanager arraylist two dimensional to hold multiple neuron's traing data; currently it only pairs one input value with another output value
   Have a way of graphing the samples to see what function the net is learning 
   Have code to convert the samples into coordinate pairs to make graphs in excel
 */
 

import java.io.FileReader;
Network network; 
FileManager dataMger;
 String trainingpath = "C://Users//franco//Documents//github//Art_Work//Images//monalisa.jpe";
void settings(){//settings() is needed toset size()in processing 3.0+
  size(640,480);
}
  void setup() {
  startNetwork(); //setups everything needed to use a neural net
 
}

void startNetwork(){
    dataMger = new FileManager(trainingPath, "image"); //loads training data into the sketch
    network = new Network(); // sets a new network object 
    network.setStochastic(false); //set to either true or false to have stochastic gradient descent be a feature or disable by setting it to false;
   
    network.setBatchSize(1);
    network.startUp(); // starts the network and sets random bias values
    network.setLearningRate(.9);//sets the learnign rate for the network default is .01
    if(new File("C://Users//franco//Documents//github//NeuralNetwork//Processing//Network//SavedWeights.txt").exists()) dataMger.loadWeights("C://Users//franco//Documents//github//NeuralNetwork//Processing//Network//SavedWeights.txt");
    noLoop();//stops the main from looping 
   
}

  void draw() {
   background(153);
   network.setInputVal(dataMger.getImageInput(0));//parameter is zero because only one data set has been loaded
   network.feedForward();  
   network.backProp(dataMger.getImageOutput(0));//parameter is zero because only one data set has been loaded
   println("Done with " + dataMger.getTrainingDataPath());
   }
   dataMger.saveWeights("C://Users//franco//Documents//github//NeuralNetwork//Processing//Network//SavedWeights.txt");//saves the networks weights
   println("Saved the Net's Weights");
   exit();
}


    

    

    




  