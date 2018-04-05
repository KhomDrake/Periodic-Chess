public class Scene
{
  public PImage background;
  public ArrayList<Button> buttons = new ArrayList<Button>();
  
  Scene(PImage bg)
  {
    this.background = bg;
  }
    
  public void DrawBackground()
  {
    image(background, 0, 0, width, height);
  }
  
  public void DrawButtons()
  {
     for(int i = 0; i < buttons.size(); i++)
     {
         buttons.get(i).DrawButton();;
     }
  }
  
  public void CheckButtons()
  {
     for(int i = 0; i < buttons.size(); i++)
     {
         buttons.get(i).isInside(new PVector(mouseX, mouseY));
     }  
  }
}
