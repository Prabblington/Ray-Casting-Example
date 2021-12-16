//raycasting in processing java, with minimap of rendered objects
import java.util.ArrayList;

ArrayList<Boundary> walls;
Ray ray;
Particle particle;

public void setup()
{
  size(1000,800);
  background(0);
  stroke(255);
  int wallMax = 10;
  walls = new ArrayList();
  
  for (int i = 0; i < wallMax; i++) 
  {    
    float x1 = random(width);
    float x2 = random(width);
    float y1 = random(height);
    float y2 = random(height);
    walls.add(new Boundary(x1, y1, x2, y2));
  }
  
  particle = new Particle();
}

public void draw()
{
  background(30);
  stroke(255);
  for (Boundary wall : walls) 
  {
    wall.render();
  }
  
  particle.update(mouseX, mouseY);
  particle.render();
  particle.check(walls);
}
