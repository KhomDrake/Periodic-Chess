public class TableSquare extends Button
{
  public int x,y;
  public PeriodicTableElements element;
  public boolean isHighLight;

  TableSquare(int Y, int X, PImage img, Type _myType, PVector _position, PVector _size, ButtonType type)
  {
    super(img, _myType, _position, _size, type);
    x = X;
    y = Y;
  }

  @ Override
    public void DrawButton()
  {  
    if (element == null)
      image(imageButton, position.x, position.y, size.x, size.y);
    else
      image(element.information.myImage, position.x, position.y, size.x, size.y);

    if (isHighLight)
    {
      line(position.x, position.y, position.x + size.x, position.y + size.y);
      line(position.x, position.y + size.y, position.x + size.x, position.y);
    }
    //noFill();
    //strokeWeight(24);
    //rect(position.x, position.y, size.x, size.y);
  }

  @ Override
    public void isInside(PVector mousePosition)
  {

    if (mousePosition.x < size.x + position.x && mousePosition.x > position.x)
    {
      if (mousePosition.y < size.y + position.y && mousePosition.y > position.y)
      {
        if (element != null && element.playerOne == playerTurnGame)
        {
          if (manager.selectedPiece == null)
            manager.SelectPiece(this);
          else if (manager.selectedPiece != null)
            manager.MovePiece(element.positionX, element.positionY);
        }
        else if(element != null && element.playerOne != playerTurnGame)
        {
            manager.MovePiece(element.positionX, element.positionY);          
        }
        else if(element == null)
        {
           manager.MovePiece(x,y);
        }
      }
    }
  }
}
