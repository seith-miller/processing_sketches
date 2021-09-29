import themidibus.*;
import java.util.*;

MidiBus bus;
NoteManager nm;

void setup() {
  MidiBus.list();
  bus =new MidiBus(this, 0, 1);
  
  nm = new NoteManager();
}

void draw() {
  nm.track();
}

void noteOn(int channel, int pitch, int velocity) {
  nm.addNote(new Note(channel, pitch, velocity));
  println("Note on: " + channel + ", " + pitch + ", " + velocity);
}

void noteOff(int channel, int pitch, int velocity) {
  nm.releaseNote(new Note(channel, pitch, velocity));
  println("Note off: " + channel + ", " + pitch + ", " + velocity);
}
