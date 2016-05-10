  //static int layers = 2;
static int [] layerLength = {512, 10000, 512};
static ArrayList<ArrayList<Neuron>> net = new ArrayList <ArrayList <Neuron>>();
static float learningRate = 1; //The learning rate for the network
float batchSize = 10; //size of training Batches
int stochastic = 0; //0 disables stochastic gradient descent and a 1 enables it 
void startUp() {
  for (int l =0; l < layerLength.length; l++) {//loop through the different layers of the net

    net.add(new ArrayList<Neuron>(layerLength[l]));

    for (int n = 0; n < layerLength[l]; n++) {//add the number of needed neurons in each layer of the net
      net.get(l).add(new Neuron());
    }
  }
  //connect each layer's neurons to each other starting from the back forward
  for (int l = net.size() - 1; l > 0; l--) {//loop through the different layers of the net starting from the back and working your way forward to the first layer
    for (int n = 0; n < layerLength[l]; n++) {//loop through the neurons of each layer and connect them to the neurons in the layer in front
      for (int k = 0; k < layerLength[l-1]; k++) {//loop through the layer in front neurons 
        getNeuron(l, n).connect(net.get(l-1).get(k));
      }
    }
  }
}
void setStochastic( boolean b) {
  if (b) stochastic = 1;
  else stochastic = 0;
}
void setLearningRate(float l) {
  learningRate = l;
}

ArrayList<Neuron> getNeurons(int l) {
  return net.get(l);
}


Neuron getNeuron(int l, int n) {
  return net.get(l).get(n);
}

float getValue(int l, int n) { // get the current value of the neuron in the specific layer
  return net.get(l).get(n).getCurrentVal();
}

int getSize(int l) { //gets the amount of neurons in the layer specified
  return net.get(l).size();
}

int getSize() {// gets the number of layers in the network
  return net.size();
}

void feedForward() {
  for (int l = 1; l < layerLength.length; l++) {// loop through each layer skipping the first because it is input
    for (int n = 0; n < this.getSize(l); n++) {// loop through all the neurons in the layer and calculate their current values
      getNeuron(l, n).calculate();
    }
  }
}

void backProp(float [] t) { //compare output to training set and back prop the error
for(int l = getSize()-1; l > 0; l--){
  for(int n = 0; n < getSize(l); n++){
    if(l == getSize() - 1){
      getNeuron(l,n).setError((getNeuron(l,n).getCurrentVal() - t[n]) * getNeuron(l,n).calcDerivSig());
    }else{
       float errorSum =0;
      // println("here");
      for(int k = 0; k < getSize(l+1);k++){
       errorSum += (getNeuron(l+1,k).getError() * getNeuron(l+1,k).getWeight(n) * getNeuron(l,n).calcDerivSig());
        
      
      //getNeuron(l+1,k).getError() gets the error of the neuron in the next layer
      //getNeuron(l,n).getWeight(k) gets the weight value associated with the neuron in the next layer
    }
    getNeuron(l,n).setError(errorSum);
    }
  }
}
for(int l = getSize()-1; l > 0; l--){
  for(int n = 0; n < getSize(l); n++){
    getNeuron(l,n).setBias(getNeuron(l,n).getBias() - (learningRate) * getNeuron(l,n).getError());
    for(int k = 0; k < getSize(l-1); k++){
    getNeuron(l, n).setWeight(k, ( getNeuron(l, n).getWeight(k) - (learningRate) * (getNeuron(l-1, k).getCurrentVal() * getNeuron(l,n).getError())));
       //println("here");
    }
  }
}

}

void setBatchSize(float i) {
  batchSize = i;
}
void setInputVal(float [] f) {//sets the input values for the first layer of the neural network
  
    for (int i = 0; i < net.get(0).size(); i++) { 
      net.get(0).get(i).setCurrentVal(f[i]);
    }
}

void setInputVal(Float [] f) {//sets the input values for the first layer of the neural network using an object Float array
    for (int i = 0; i < net.get(0).size(); i++) { 
      net.get(0).get(i).setCurrentVal(f[i].floatValue());
    }
}

void setInputVal(int i , float val){//used to load data to each neuron seperately
  net.get(0).get(i).setCurrentVal(val);
}

float[] getOutputVal() {// get the output from the output layer neurons
  float [] output = new float[net.get(net.size()-1).size()]; 

  for (int n = 0; n < net.get(net.size()-1).size(); n++) {
    output[n] = net.get(net.size()-1).get(n).getCurrentVal();
  }
  return output;
}

float getOutputVal(int i){//used to get the output of a specific neuron
  return net.get(net.size()-1).get(i).getCurrentVal();
}

void printOutput() {//prints the last layers values to print the output of the network
  float [] out = getOutputVal();
  for (float o : out) {
    println("Final Output: " + o);
  }
}