
// Note class handles attributes that all played notes share
class Note {
  
  int channel, velocity, pitch;   // store the channel, velocity and pitch
  int lifespan;                   // lifespan of note, in frames
  boolean isReleased;             // whether or not the note has been released yet
  
  PVector position;              // note's spatial position
  PVector positionalVelocity;    // note's velocity in space

  // constructor for new Note object
  Note(int channel_, int pitch_, int velocity_) {
    this.channel = channel_;
    this.pitch = pitch_;
    this.velocity = velocity_;
    this.lifespan = 45;    // arbitrary lifespan of 45 frames
    this.isReleased = false;
    
    // calculate initial position by scaling pitch to an x value vertically centered on screen
    this.position = new PVector(scaleVal(this.pitch, MINPITCH, MAXPITCH, 0, width), height / 2);
    
    // generate positional velocity loosely based on note velocity
    this.positionalVelocity = new PVector(random(-this.velocity, this.velocity), random(-this.velocity, this.velocity));
    this.positionalVelocity.mult(0.1);
  }
  
  // update note properties
  void update() {
    // change the note's position on the screen by its positional velocity
    this.position.add(this.positionalVelocity);
  }
  
  // display note on canvas
  void display() {
    if(true) {
      fill(scalePitchToRainbow(this.pitch), scaleVal(this.lifespan, 0, 45, 0, 255));  // fill color based on pitch, alpha based on lifespan left (fading)
      // ellipse(this.position.x, this.position.y, 60, 60);  // ellipse representation
      
      if (this.channel == 6) {
        // put your function calls here 
        rect(100, 275, 800, 800);
      }
      if (this.channel == 3) {
        text("boy", 20, 40);
      }
      if (this.channel == 4) {
        text("guitar", 20, 60);
      }
      if (this.channel == 5) {
        text("strings", 20, 80);
      }
      if (this.channel == 8) {
        text("bass", 20, 100);
      }
      if (this.channel == 7) {
        text("drums", 20, 120);
      }
      if (this.channel == 0) {
        String part = "N/A";
        if(this.pitch == 60){
          part = "intro";
        }
        if(this.pitch == 61){
          part = "verse";
        }
        if(this.pitch == 62){
          part = "chorus";
        }
        if(this.pitch == 63){
          part = "brige";
        }
        if(this.pitch == 64){
          part = "outro";
        }
        text("song part: " + part, 20, 200);
      }
    }
  }
}

// momentary data like particular sounds
void kick() {
  
}

// macrodata about what part of the song we are in
void songPart(){
  
}

// intensity: an arbitrary value showing how intense the song is at a given moment.
void intensity(){
  
}
