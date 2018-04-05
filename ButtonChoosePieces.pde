public class ButtonChoosePieces extends Button
{
  public ChoosePieces myElement;

  ButtonChoosePieces(PImage img, Type _myType, PVector _position, PVector _size, ButtonType type)
  {
    super(img, _myType, _position, _size, type);
  }

  public void IsToDraw()
  {
    if (playerTurnChoosePieces) 
    {
      if (myElement.isChoosePlayerOne)
        tint(255, 0);
      else if (myElement.isSelected)
        tint(255, 126);
      else
        tint(255, 255);
    } else
    {
      if (myElement.isChoosePlayerTwo)
        tint(255, 0);
      else if (myElement.isSelected)
        tint(255, 126);
      else
        tint(255, 255);
    }
  }

  @ Override
    public void DrawButton(int index)
  {   
    //pushMatrix();
    if (myElement != null) {
        IsToDraw();
    }
    if (index < 108)
      image(imgTest[index], position.x, position.y, size.x, size.y);

    //popMatrix();
  }
  
  public void IsInside(PVector mousePosition)
  {
    if (mousePosition.x < size.x + position.x && mousePosition.x > position.x)
    {
      if (mousePosition.y < size.y + position.y && mousePosition.y > position.y)
      {
         textElement = "Name: " + myElement.name + "\n" +
         "Type: " + myElement.myType;
      }
    }
  }

  @ Override
    public void isInside(PVector mousePosition)
  {
    if (mousePosition.x < size.x + position.x && mousePosition.x > position.x)
    {
      if (mousePosition.y < size.y + position.y && mousePosition.y > position.y)
      {
        if (ButtonType.ChoosePieces == myButtonType)
        {
          //println(myElement);
          myElement.isSelected = true;
          for (int i = 0; i < 108; i++)
          {
            if (choosePieceScene.choosePieces[i] != myElement)
              choosePieceScene.choosePieces[i].isSelected = false;
          }
        }
      }
    }
  }
}
