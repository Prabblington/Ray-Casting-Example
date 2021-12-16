class Particle
{
  private PVector position;
  Ray[] rays;
  
  public Particle()
  {
    this.position = new PVector(width / 2, height / 2);
    this.rays = new Ray[360];
    
    for (int a = 0; a < this.rays.length; a++) 
    {
      this.rays[a] = new Ray(this.position, radians(a));
    }
  }
  
  public void update(float x, float y)
  {
   this.position.set(x, y); 
  }
  
  //method checks if the particle intersects with the walls
  public void check(ArrayList<Boundary> walls) 
  {
    for(Ray ray : this.rays)
    {
      PVector closest = null;
      float viewDist = width;
      
      for (Boundary wall : walls) 
      {
        PVector pt = ray.cast(wall);
        if (pt != null) 
        {
          float distance = PVector.dist(this.position, pt);
          if (distance < viewDist) 
          {
            viewDist = distance;
            closest = pt;
          }
        }
      }
      if (closest != null) 
      {
        stroke(255, 5, 120);
        line(this.position.x, this.position.y, closest.x, closest.y);
      }
    }
  }
  
  public void render()
  {
    for (Ray ray : this.rays) 
    {
      ray.render();
    }
  }
  
}
