public class Button
{
  public int sceneToLoad;
  public PImage imageButton;
  public boolean haveText, isDrawing;
  public String textButton;
  public color myColor;
  public PVector size, position;
  public Type myType;
  public ButtonType myButtonType;

  Button(PImage img, String text, Type _myType, PVector _position, ButtonType type)
  {
    this.haveText = true;
    this.textButton = text;
    this.imageButton = img;
    this.myType = _myType;
    this.position = _position;
    this.myButtonType = type;
  }

  Button(PImage img, Type _myType, PVector _position, ButtonType type)
  {
    this.haveText = true;
    this.imageButton = img;
    this.myType = _myType;
    this.position = _position;
    this.myButtonType = type;
  }

  Button(PImage img, Type _myType, PVector _position, PVector _size, ButtonType type)
  {
    this.imageButton = img;
    this.myType = _myType;
    this.position = _position;
    this.size = _size;
    this.myButtonType = type;
  }

  Button(PImage img, String text, Type _myType, PVector _position, ButtonType type, int load)
  {
    this.haveText = true;
    this.textButton = text;
    this.imageButton = img;
    this.myType = _myType;
    this.position = _position;
    this.myButtonType = type;
    this.sceneToLoad = load;
  }

  Button(PImage img, Type _myType, PVector _position, ButtonType type, int load)
  {
    this.imageButton = img;
    this.myType = _myType;
    this.position = _position;
    this.myButtonType = type;
    this.sceneToLoad = load;
  }

  Button(PImage img, Type _myType, PVector _position, PVector _size, ButtonType type, int load)
  {
    this.imageButton = img;
    this.myType = _myType;
    this.position = _position;
    this.size = _size;
    this.myButtonType = type;
    this.sceneToLoad = load;
  }

  Button(PImage img, String text, Type _myType, PVector _position, PVector _size, ButtonType type, int load)
  {
    this.haveText = true;
    this.textButton = text;
    this.imageButton = img;
    this.myType = _myType;
    this.size = _size;
    this.position = _position;
    this.myButtonType = type;
    this.sceneToLoad = load;
  }

  Button(PImage img, String text, Type _myType, PVector _position, PVector _size, ButtonType type)
  {
    this.haveText = true;
    this.textButton = text;
    this.imageButton = img;
    this.myType = _myType;
    this.size = _size;
    this.position = _position;
    this.myButtonType = type;
  }

  Button(Type _myType, color _myColor, PVector _size, PVector _position, ButtonType type)
  {
    this.myType = _myType;
    this.myColor = _myColor;
    this.size = _size;
    this.position = _position;
    this.myButtonType = type;
  }

  Button(Type _myType, color _myColor, float _size, PVector _position, ButtonType type)
  {
    this.myType = _myType;
    this.myColor = _myColor;
    this.size = new PVector(_size, _size);
    this.position = _position;
    this.myButtonType = type;
  }

  public void isInside(PVector mousePosition)
  {
    if (myType == Type.ImageCircle || myType == Type.ImageCircleSize)
    {
      if (PVector.dist(new PVector(position.x + size.x/2, position.y + size.y/2), mousePosition) < (this.size.x / 2))
      {
        if (ButtonType.ChangeScene == myButtonType)
        {
          scene = sceneToLoad;
        }
      }
    } else
    {
      if (mousePosition.x < size.x + position.x && mousePosition.x > position.x)
      {
        if (mousePosition.y < size.y + position.y && mousePosition.y > position.y)
        {
          if (ButtonType.ChangeScene == myButtonType)
          {
            scene = sceneToLoad;
          }
        }
      }
    }
  }   

  public boolean isInsideCheck(PVector mousePosition)
  {
    if (mousePosition.x < size.x + position.x && mousePosition.x > position.x)
    {
      if (mousePosition.y < size.y + position.y && mousePosition.y > position.y)
      {
        return true;
      }
    }

    return false;
  }

  public void DrawText()
  {
    if (haveText)
    {
      fill(0, 0, 255);
      textAlign(CENTER);
      textSize(size.x/5);
      text(textButton, position.x + (size.x / 4) + size.x/5, position.y + (size.y / 2));
    }
  }

  public void DrawButton(int index)
  {
    index = 0;
  }

  public void DrawButton()
  {
    if (myType == Type.Rect)
    {
      fill(myColor);
      rect(position.x, position.y, size.x, size.y);
      DrawText();
      isDrawing = true;
    } else if (myType == Type.Image)
    {   
      tint(255, 255);
      image(imageButton, position.x, position.y);
      DrawText();
      isDrawing = true;
    } else if (myType == Type.ImageSize)
    {
      tint(255, 255);
      image(imageButton, position.x, position.y, size.x, size.y);
      DrawText();
      isDrawing = true;
    } else if (myType == Type.ImageCircleSize)
    {
      tint(255, 255);
      image(imageButton, position.x, position.y, size.x, size.y);
      DrawText();
      isDrawing = true;
    }
  }
}

public enum ButtonType
{
  ChangeScene, 
    ChoosePieces, 
    ChangeChoosePiecesImages, 
    PositionInTable,
    InGame
}


public enum Type
{
  Image, 
    Rect, 
    ImageCircle, 
    ImageSize, 
    ImageCircleSize
}
