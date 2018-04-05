public class PositionInTable extends Button
{
  public PVector positionTable;
  public boolean isSelected, haveElement;
  public boolean isPlayerOne, isCanChoose;

  PositionInTable(PImage img, Type _myType, PVector _position, PVector _size, ButtonType type, boolean _isPlayer, boolean _isCanChoose)
  {
    super(img, _myType, _position, _size, type);
    this.isPlayerOne = _isPlayer;
    this.isCanChoose = _isCanChoose;
  }

  @ Override
    public void DrawButton(int index)
  {  
    tint(255);
    image(imgTest[index], position.x, position.y, size.x, size.y);
  }

  @ Override
    public void isInside(PVector mousePosition)
  {
    if (isCanChoose && isPlayerOne == playerTurnChoosePieces || haveElement && isPlayerOne == playerTurnChoosePieces ) {
      if (mousePosition.x < size.x + position.x && mousePosition.x > position.x)
      {
        if (mousePosition.y < size.y + position.y && mousePosition.y > position.y)
        {
          isSelected = true;
          if (isPlayerOne)
          {
            for (int i = 0; i < 3; i++)
            {  
              for (int j = 0; j < 10; j++)
              {
                if (this != choosePieceScene.table[i][j] && choosePieceScene.table[i][j].isPlayerOne)
                  choosePieceScene.table[i][j].isSelected = false;
              }
            }
          } else
          {
            for (int i = 7; i < 10; i++)
            {  
              for (int j = 0; j < 10; j++)
              {
                if (this != choosePieceScene.table[i][j] && !choosePieceScene.table[i][j].isPlayerOne)
                  choosePieceScene.table[i][j].isSelected = false;
              }
            }
          }

          for (int i = 0; i < 108; i++)
          {
            if (choosePieceScene.choosePieces[i].isSelected && canSelected(choosePieceScene.choosePieces[i], isPlayerOne ? piecesPlayerOneHave : piecesPlayerTwoHave))
            {
              imageButton = choosePieceScene.choosePieces[i].myImage;
              if (playerTurnChoosePieces)
              {
                playerOnePieces++;
                choosePieceScene.choosePieces[i].isChoosePlayerOne = true;
                piecesPlayerOne.add(new PeriodicTableElements(true, positionTable, choosePieceScene.choosePieces[i]));
                //piecesPlayerOne.add(new PeriodicTableElements(true, new PVector(positionTable.y, positionTable.x), choosePieceScene.choosePieces[i]));
              }
              else
              {
                choosePieceScene.choosePieces[i].isChoosePlayerTwo = true;
                playerTwoPieces++;
                //piecesPlayerTwo.add(new PeriodicTableElements(false, new PVector(positionTable.y, positionTable.x), choosePieceScene.choosePieces[i]));
                piecesPlayerTwo.add(new PeriodicTableElements(false, positionTable, choosePieceScene.choosePieces[i]));
              }

              choosePieceScene.choosePieces[i].isSelected = false;
              
              howManyPiecesAlreadyBeenChoose(isPlayerOne ? piecesPlayerOneHave : piecesPlayerTwoHave, isPlayerOne);
              
              playerTurnChoosePieces = !playerTurnChoosePieces;
            }
          }
        }
      }
    }
  }
}
