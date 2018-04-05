public class SceneChoosePieces extends Scene
{
  ButtonChoosePieces[] _buttons = new ButtonChoosePieces[5];
  ChoosePieces[] choosePieces = new ChoosePieces[108];
  PositionInTable[][] table = new PositionInTable[10][10];
  int[] indexs;
  int pag = 0, maxPag = 20;

  SceneChoosePieces(PImage bg)
  {
    super(bg);
    indexs = new int[5];
    indexs[0] = 0;
    indexs[1] = 1;
    indexs[2] = 2;
    indexs[3] = 3;
    indexs[4] = 4;
  }

  public void setPositionInTable(int y, int x, PositionInTable piece)
  {
    table[y][x] = piece;
    table[y][x].positionTable = new PVector(x, y);
  }

  void CreateElements()
  {
    for (int i = 0; i < 108; i++)
    {
      TableRow index = elementsData.getRow(i);
      int atomic = index.getInt("Atomic Number") - 1;
      choosePieces[atomic] = new ChoosePieces(index.getString("Type"), index.getInt("Atomic Number") - 1, imgTest[atomic], index.getString("Element"));
    }
  }

  public void SetButtonsChoosePieces(ButtonChoosePieces one, ButtonChoosePieces two, ButtonChoosePieces three, ButtonChoosePieces four, ButtonChoosePieces five )
  {
    _buttons[0] = one;
    _buttons[1] = two;
    _buttons[2] = three;
    _buttons[3] = four;
    _buttons[4] = five;
  }

  public void DrawChoosePiecesButtons()
  {
    for (int i = 0; i < 5; i++)
    {         
      _buttons[i].DrawButton(indexs[i]);
      _buttons[i].IsInside(new PVector(mouseX, mouseY));
    }


    for (int i = 0; i < 10; i++)
    {  
      for (int j = 0; j < 10; j++)
      {
        table[i][j].DrawButton();
      }
    }
  }

  @ Override
    public void DrawButtons()
  {
    if (pag > 0)
      buttons.get(0).DrawButton();
    else
      buttons.get(0).isDrawing = false;

    if (pag < maxPag)
      buttons.get(1).DrawButton();
    else
      buttons.get(1).isDrawing = false;
  }

  public void setButtonsElements()
  {
      _buttons[0].myElement = choosePieces[indexs[0]];
      _buttons[1].myElement = choosePieces[indexs[1]];
      _buttons[2].myElement = choosePieces[indexs[2]];
      _buttons[3].myElement = choosePieces[indexs[3]];
      _buttons[4].myElement = choosePieces[indexs[4]];
  }

  @ Override
    public void CheckButtons()
  {
    if (buttons.get(1).isDrawing && buttons.get(1).isInsideCheck(new PVector(mouseX, mouseY)))
    {
      pag++;
      indexs[0] += 5;
      indexs[1] += 5;
      indexs[2] += 5;
      indexs[3] += 5;
      indexs[4] += 5;
      setButtonsElements();
    }

    if (buttons.get(0).isDrawing && buttons.get(0).isInsideCheck(new PVector(mouseX, mouseY)))
    {
      pag--;
      indexs[0] -= 5;
      indexs[1] -= 5;
      indexs[2] -= 5;
      indexs[3] -= 5;
      indexs[4] -= 5;
      setButtonsElements();
    }

    for (int i = 0; i < 10; i++)
    {  
      for (int j = 0; j < 10; j++)
      {
        table[i][j].isInside(new PVector(mouseX, mouseY));
      }
    }
    
    for(int i = 0; i < 5; i++)
    {
       _buttons[i].isInside(new PVector(mouseX, mouseY));
    }
  }
}
