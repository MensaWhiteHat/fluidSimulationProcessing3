final int N = 128;
final int iter = 16;
final int SCALE = 3;
float t = 0;

Fluid fluid;
//Initalize fluid into your window

void settings() 
{
size(N*SCALE, N*SCALE);
}

void setup() 
{
  //fullScreen(P3D);
  fluid = new Fluid(0.1, 0, 0);
}

void draw()
{
   background(0);
  int cx = int(0.4*width/SCALE);
  int cy = int(0.4*height/SCALE);
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      fluid.addDensity(cx+i, cy+j, random(50, 150));
    }
  }
  for (int i = 0; i < 2; i++) {
    float angle = noise(t) * TWO_PI * 2;
    PVector v = PVector.fromAngle(angle);
    v.mult(0.2);
    t += 0.01;
    fluid.addVelocity(cx, cy, v.x, v.y );
  }


  fluid.step();
  fluid.renderD();
  fluid.renderV();
  fluid.fadeD();
  
}
