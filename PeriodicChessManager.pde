public class PeriodicChessManager
{
   //PeriodicTableElements[][] table = new PeriodicTableElements[10][10];
   TableSquare[][] tableS = new TableSquare[10][10];
   PImage background;
   TableSquare selectedPiece;
   boolean[][] allowedMove = new boolean[10][10];
   
  PeriodicChessManager(PImage bg)
  {
    this.background = bg;
  }
    
  public void DrawBackground()
  {
    image(background, 0, 0, width, height);
  } 
  
  public void DrawTable()
  {
    for (int i = 0; i < 10; i++)
    {  
      for (int j = 0; j < 10; j++)
      {
         manager.tableS[i][j].DrawButton();
      }
    }
  }
  
  public void CheckButtons()
  {
    for (int i = 0; i < 10; i++)
    {  
      for (int j = 0; j < 10; j++)
      {
         manager.tableS[i][j].isInside(new PVector(mouseX, mouseY));
      }
    }
  }
  
  public void setPositionInTable(int y, int x, TableSquare piece)
  {
    tableS[y][x] = piece;
  }
  
  public void SelectPiece(TableSquare piece)
  {
     selectedPiece = piece;
     allowedMove = HighLight(selectedPiece.element.PossibleMove());
  }
  
  public boolean[][] HighLight(boolean[][] pb)
  {
    for(int i = 0; i < 10; i++)
    {
      for(int j = 0; j < 10; j++)
      {
         if(pb[i][j])
         {
            tableS[i][j].isHighLight = true;
         }
      }
    }
    
    return pb;
  }
  
  public void MovePiece(int positionX, int positionY)
  {
     if(selectedPiece != null && allowedMove[positionY][positionX])
     {
        println(allowedMove[positionY][positionX]);
        TableSquare s = tableS[positionY][positionX];
        //println(s.element.playerOne);
        //println(selectedPiece.element.playerOne);
        if(s.element == null || s != selectedPiece && s.element.playerOne != selectedPiece.element.playerOne)
        {
           if(s.element != null && s.element.information.myType.elementsType() == 5)
           {
             gameEnd = true;
             if(selectedPiece.element.playerOne){
               textEnd = "Player One Won";
             }else
             {
               textEnd = "Player Two Won";
             }
           }
           s.element = selectedPiece.element;
           s.element.positionX = positionX;
           s.element.positionY = positionY;
           selectedPiece.element = null;
        }
        
        playerTurnGame = !playerTurnGame;
     }
     
     DeselectPieces();
     selectedPiece = null;
  }
  
  public void DeselectPieces()
  {
    for(int i = 0; i < 10; i++)
    {
      for(int j = 0; j < 10; j++)
      {
         tableS[i][j].isHighLight = false;
      }
    }
  }
}
