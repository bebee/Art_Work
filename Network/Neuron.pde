public class Neuron {
  private float bias;
  float currentVal = 0;
  float weightedInput = 0;
  float error = 0;
  ArrayList<Neuron> connectedNeurons = new ArrayList<Neuron>();
  ArrayList<Float> weights = new ArrayList<Float>(); // the weight index corresponds to the connect neuron
  Neuron() {// initilize a neuron
  this.bias = random(1);
  }
  
   
  void connect(Neuron to){ //connects this Neuron TO the one indicated and adds a random weight value for each connection
    connectedNeurons.add(to);
    weights.add(random(1));
  }
  //CaluculateChecked
  void calculate(){ //calculate current value based on input info for the neuron      output = f( input1 × weight1 + input2 × weight2 + ... )
    Float sum = new Float(0);
    for(int i = 0; i < connectedNeurons.size(); i++){
     // println(connectedNeurons.get(i));
     sum += (connectedNeurons.get(i).getCurrentVal() * weights.get(i).floatValue()) + bias; //gets the current value of the previous neuron multiplies it by the weight of the connection and sums it
    }
    weightedInput = sum; //storing the sum which is the weighted input for this neuron to then access it during backprop
     currentVal = calcSig(sum);
    
  }
  
  void setCurrentVal(float f){
    currentVal = f;
  }
  
  void setBias(float f ){ // sets the bias
    bias = f;
  }
  
  ArrayList<Neuron> getConnections(){
    return connectedNeurons;
  }
  
  float getCurrentVal(){
    return currentVal;
  }
  
  Float getWeight(int i){// get the weight value for the connected neuron
  
    return weights.get(i);
  }
  ArrayList<Float> getWeights(){
   return weights; 
  }
  int getNumberOfWeights(){
   return weights.size(); 
  }
  Float getWeight(Neuron n){ //get the weight of the connect neuron by using the actual connect neuron
   int i = connectedNeurons.indexOf(n); 
   return weights.get(i);
  }
  
  void setWeight(Neuron n, float w){
    weights.set(connectedNeurons.indexOf(n), new Float(w)); //uses a neuron 
  }
  void setWeight(int i, float w){ //what index to change the weight of and the float value, shoud add a method to inout the neuron and update the weight using the neuron
    weights.set(i, new Float(w));
  // println("Neuron: " + i + " has weight: " + w);
  }
  float getWeightedInput(){
    return weightedInput;
  }
  
  float calcSig(Float f){//return the output from the sigmoid activation curve
   return (float)(1/(1+Math.exp(-f.doubleValue()))); 
  }
  
  float calcDerivSig(float f ){ //return the output of the derivative of sigmoid function
    return (calcSig(f) * (1 - calcSig(f)));
  }
  
  float calcSig(){//return the output from the sigmoid activation curve
   return (float)(1/(1+Math.exp(-weightedInput))); 
  }
  
  float calcDerivSig(){ //return the output of the derivative of sigmoid function
    return (calcSig(weightedInput) * (1 - calcSig(weightedInput)));
  }
  
  void setError(float f){
   error = f; 
  }
  float getError(){
   return error; 
  }
  float getBias(){
   return bias; 
  }
}