// runs in Processing 3
import themidibus.*; //Import the library

MidiBus myBus;

void setup() {
  size(600, 600);
  background(225);

  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.
  //                 Parent In Out
  //                   |    |  |
  myBus = new MidiBus(this, 1, 2); // Create a new MidiBus using the device index to select the Midi input and output devices respectively.
}

void draw() {
  int channel = 0;
  int pitch = 64;
  int velocity = 127;
  
  background(225);

  myBus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
  delay(200);
  myBus.sendNoteOff(channel, pitch, velocity); // Send a Midi nodeOff

  int number = 0;
  int value = 90;

  myBus.sendControllerChange(channel, number, value); // Send a controllerChange
  //delay(2000); // optional input delay
}

void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
  
  // hi hat
  if (channel == 3 && pitch == 47) {
      fill(100, 100, 100);
      strokeWeight(1);
      fill(180, 25, 24);
      triangle(120, 300, 232, 80, 344, 300);
  }
  // kick
  if (channel == 3 && pitch == 37) {
      strokeWeight(3);
      line(random(0, 300), random(0, 300), 50, 50);
  }
  // snair
  if (channel == 3 && pitch == 62) {
      fill(100, 100, 100);
      strokeWeight(1);
      line(random(0, 500), random(0, 550), 550, 50);
      line(random(0, 500), random(0, 550), 550, 50);
      line(random(0, 500), random(0, 550), 550, 50);
  }

  
  // bass
  if (channel == 6 ) {
      // draw rect when key is pressed
      strokeWeight(1);
      fill(random(0, 256), random(0, 256), random(0, 256));
      rect(random(50, 500), random(250, 500), 50, 50);
  }
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  println();
  println("Note Off:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  
  // draw line when knob is turned
  line(0, value * 10, width, value);
}

void delay(int time) {
  int current = millis();
  while (millis () < current+time) Thread.yield();
}
