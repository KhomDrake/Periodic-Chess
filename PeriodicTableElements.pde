public class PeriodicTableElements
{
  boolean playerOne;
  int positionX, positionY;
  ChoosePieces information;
  boolean transitionMetals, posTransitionMetals, otherNoMetals, semiMetals; // actinoids
  boolean alkaliMetals, alkalineEarthMetals, halogens, nobleGases; // lanthanoids
  boolean firstTime;


  PeriodicTableElements(boolean p, PVector position, ChoosePieces t)
  {
    this.playerOne = p;
    this.positionX = (int)position.x;
    this.positionY = (int)position.y;
    this.information = t;
  }

  public boolean[][] PossibleMove()
  {
    boolean[][] r = new boolean[10][10];

    if (information.myType.elementsType() == 0)
    {
      return PossibleMoveActinoids(r);
    } else if (information.myType.elementsType() == 1)
    {
      return PossibleMoveAlkalineEarthMetals(r);
    } else if (information.myType.elementsType() == 2)
    {
      return PossibleMoveAlkalineMetals(r);
    } else if (information.myType.elementsType() == 3)
    {
      return PossibleMoveHalogens(r);
    } else if (information.myType.elementsType() == 4)
    {
      return PossibleMoveLanthanoids(r);
    } else if (information.myType.elementsType() == 5)
    {
      return PossibleMoveNobleGases(r);
    } else if (information.myType.elementsType() == 6)
    {
      return PossibleMoveOtherNoMetals(r);
    } else if (information.myType.elementsType() == 7)
    {
      return PossibleMovePosTransitionMetals(r);
    } else if (information.myType.elementsType() == 8)
    {
      return PossibleMoveSemiMetals(r);
    } else if (information.myType.elementsType() == 9)
    {
      return PossibleMoveTransitionMetals(r);
    }

    return new boolean[10][10];
  }

  public void MovesOfMetals(int x, int y, boolean[][] table)
  {
    TableSquare c;

    if (x >= 0 && x < 10 && y >= 0 & y < 10)
    {
      c = manager.tableS[y][x];

      if (c.element == null)
        table[y][x] = true;
      else if (c.element.playerOne != playerOne)
      {
        table[y][x] = true;
      } else if (c.element.playerOne == playerOne)
      {
        table[y][x] = false;
      }
    }
  }

  public boolean[][] PossibleMoveActinoids(boolean[][] table)
  {
    if (!firstTime)
    {
      firstTime = true;
      int random = (int)random(0, 3);
      if (random == 0)
        transitionMetals = true;
      else if (random == 1)
        posTransitionMetals = true;
      else if (random == 2)
        otherNoMetals = true;
      else if (random == 3)
        semiMetals = true;
    }

    if (transitionMetals)
    {
      table = PossibleMoveTransitionMetals(table);
    } else if (posTransitionMetals)
    {
      table = PossibleMovePosTransitionMetals(table);
    } else if (otherNoMetals)
    {
      table = PossibleMoveOtherNoMetals(table);
    } else if (semiMetals)
    {
      table = PossibleMoveSemiMetals(table);
    }

    return table;
  }

  public boolean[][] PossibleMoveAlkalineEarthMetals(boolean[][] table)
  {
    int i, j;
    TableSquare c;

    // Top Left
    i = positionX;
    j = positionY;
    while (true)
    {
      i -= 2;
      j += 2;
      if (i < 0 || j >= 10)
      {
        break;
      }
      c = manager.tableS[j][i];

      if (c.element == null)
        table[j][i] = true;
      else if (c.element.playerOne != playerOne)
      {
        table[j][i] = true;
        break;
      } else if (c.element.playerOne == playerOne)
      {
        table[j][i] = false;
        break;
      }
    }

    // Down Right
    i = positionX;
    j = positionY;
    while (true)
    {
      i += 2;
      j -= 2;
      if (i >= 10 || j < 0)
      {
        break;
      }
      c = manager.tableS[j][i];

      if (c.element == null)
        table[j][i] = true;
      else if (c.element.playerOne != playerOne)
      {
        table[j][i] = true;
        break;
      } else if (c.element.playerOne == playerOne)
      {
        table[j][i] = false;
        break;
      }
    }

    // Top Right
    i = positionX;
    j = positionY;
    while (true)
    {
      i += 2;
      j += 2;
      if (i >= 10 || j >= 10)
      {
        break;
      }
      c = manager.tableS[j][i];

      if (c.element == null)
        table[j][i] = true;
      else if (c.element.playerOne != playerOne)
      {
        table[j][i] = true;
        break;
      } else if (c.element.playerOne == playerOne)
      {
        table[j][i] = false;
        break;
      }
    }

    // Down Left
    i = positionX;
    j = positionY;
    while (true)
    {
      i -= 2;
      j -= 2;
      if (i < 0 || j >= 10)
      {
        break;
      }
      c = manager.tableS[j][i];

      if (c.element == null)
        table[j][i] = true;
      else if (c.element.playerOne != playerOne)
      {
        table[j][i] = true;
        break;
      } else if (c.element.playerOne == playerOne)
      {
        table[j][i] = false;
        break;
      }
    }

    return table;
  }

  public boolean[][] PossibleMoveAlkalineMetals(boolean[][] table)
  {
    int i, j;
    TableSquare c;

    // Top Left
    i = positionX;
    j = positionY;
    while (true)
    {
      i -= 1;
      j += 1;
      if (i < 0 || j >= 10)
      {
        break;
      }
      c = manager.tableS[j][i];

      if (c.element == null)
        table[j][i] = true;
      else if (c.element.playerOne != playerOne)
      {
        table[j][i] = true;
        break;
      } else if (c.element.playerOne == playerOne)
      {
        table[j][i] = false;
        break;
      }
    }

    // Down Right
    i = positionX;
    j = positionY;
    while (true)
    {
      i += 1;
      j -= 1;
      if (i >= 10 || j < 0)
      {
        break;
      }
      c = manager.tableS[j][i];

      if (c.element == null)
        table[j][i] = true;
      else if (c.element.playerOne != playerOne)
      {
        table[j][i] = true;
        break;
      } else if (c.element.playerOne == playerOne)
      {
        table[j][i] = false;
        break;
      }
    }

    // Top Right
    i = positionX;
    j = positionY;
    while (true)
    {
      i += 1;
      j += 1;
      if (i >= 10 || j >= 10)
      {
        break;
      }
      c = manager.tableS[j][i];

      if (c.element == null)
        table[j][i] = true;
      else if (c.element.playerOne != playerOne)
      {
        table[j][i] = true;
        break;
      } else if (c.element.playerOne == playerOne)
      {
        table[j][i] = false;
        break;
      }
    }

    // Down Left
    i = positionX;
    j = positionY;
    while (true)
    {
      i -= 1;
      j -= 1;
      if (i < 0 || j >= 10)
      {
        break;
      }
      c = manager.tableS[j][i];

      if (c.element == null)
        table[j][i] = true;
      else if (c.element.playerOne != playerOne)
      {
        table[j][i] = true;
        break;
      } else if (c.element.playerOne == playerOne)
      {
        table[j][i] = false;
        break;
      }
    }

    return table;
  }

  public void HalogenMove(int x, int y, boolean[][] table)
  {
    TableSquare c;
    if (x >= 0 && x < 10 && y >= 0 & y < 10)
    {
      c = manager.tableS[y][x];

      if (c.element == null)
        table[y][x] = true;
      else if (c.element.playerOne != playerOne)
      {
        table[y][x] = true;
      } else if (c.element.playerOne == playerOne)
      {
        table[y][x] = false;
      }
    }
  }

  public boolean[][] PossibleMoveHalogens(boolean[][] table)
  {
    //UpLeft
    HalogenMove(positionX - 1, positionY + 3, table);
    //UpRight
    HalogenMove(positionX + 1, positionY + 3, table);
    //RightUp
    HalogenMove(positionX + 3, positionY + 1, table);
    //RightDown
    HalogenMove(positionX + 3, positionY - 1, table);
    //DownLeft
    HalogenMove(positionX - 1, positionY - 3, table);
    //DownRight
    HalogenMove(positionX + 1, positionY - 3, table);
    //LeftUp
    HalogenMove(positionX - 3, positionY + 1, table);
    //LeftDown
    HalogenMove(positionX - 3, positionY - 1, table);

    return table;
  }

  public boolean[][] PossibleMoveLanthanoids(boolean[][] table)
  {
    if (!firstTime)
    {
      firstTime = true;
      int random = (int)random(0, 3);
      if (random == 0)
        alkaliMetals = true;
      else if (random == 1)
        alkalineEarthMetals = true;
      else if (random == 2)
        halogens = true;
      else if (random == 3)
        nobleGases = true;
    }


    if (alkaliMetals)
    {
      table = PossibleMoveAlkalineMetals(table);
    } else if (alkalineEarthMetals)
    {
      table = PossibleMoveAlkalineEarthMetals(table);
    } else if (halogens)
    {
      table = PossibleMoveHalogens(table);
    } else if (nobleGases)
    {
      table = PossibleMoveNobleGases(table);
    }

    return table;
  }

  public boolean[][] PossibleMovePosTransitionMetals(boolean[][] table)
  {
    //UpLeft
    MovesOfMetals(positionX, positionY + 3, table);
    MovesOfMetals(positionX - 1, positionY + 2, table);
    //UpRight
    MovesOfMetals(positionX, positionY + 3, table);
    MovesOfMetals(positionX + 1, positionY + 2, table);
    //RightUp
    MovesOfMetals(positionX + 3, positionY, table);
    MovesOfMetals(positionX + 2, positionY + 1, table);
    //RightDown
    MovesOfMetals(positionX + 3, positionY, table);
    MovesOfMetals(positionX + 2, positionY - 1, table);
    //DownLeft
    MovesOfMetals(positionX, positionY - 3, table);
    MovesOfMetals(positionX - 1, positionY - 2, table);
    //DownRight
    MovesOfMetals(positionX, positionY - 3, table);
    MovesOfMetals(positionX + 1, positionY - 2, table);
    //LeftUp
    MovesOfMetals(positionX - 3, positionY, table);
    MovesOfMetals(positionX - 2, positionY + 1, table);
    //LeftDown  
    MovesOfMetals(positionX - 3, positionY, table);
    MovesOfMetals(positionX - 2, positionY - 1, table);

    return table;
  }

  public boolean[][] PossibleMoveTransitionMetals(boolean[][] table)
  {
    //UpLeft
    MovesOfMetals(positionX, positionY + 2, table);
    MovesOfMetals(positionX - 1, positionY + 1, table);
    //UpRight
    MovesOfMetals(positionX, positionY + 2, table);
    MovesOfMetals(positionX + 1, positionY + 1, table);
    //RightUp
    MovesOfMetals(positionX + 2, positionY, table);
    MovesOfMetals(positionX + 1, positionY + 1, table);
    //RightDown
    MovesOfMetals(positionX + 2, positionY, table);
    MovesOfMetals(positionX + 1, positionY - 1, table);
    //DownLeft
    MovesOfMetals(positionX, positionY - 2, table);
    MovesOfMetals(positionX - 1, positionY - 1, table);
    //DownRight
    MovesOfMetals(positionX, positionY - 2, table);
    MovesOfMetals(positionX + 1, positionY - 1, table);
    //LeftUp
    MovesOfMetals(positionX - 2, positionY, table);
    MovesOfMetals(positionX + 1, positionY - 1, table);
    //LeftDown  
    MovesOfMetals(positionX - 2, positionY, table);
    MovesOfMetals(positionX - 1, positionY - 1, table);


    return table;
  }

  public boolean[][] PossibleMoveSemiMetals(boolean[][] table)
  {
    table = PossibleMoveOtherNoMetals(table);
    table = PossibleMoveAlkalineMetals(table);
    
    return table;
  }

  public boolean[][] PossibleMoveOtherNoMetals(boolean[][] table)
  {
    int i, j;
    TableSquare c;

    // right
    i = positionX;
    j = positionY;
    while (true)
    {
      j++;
      if (j > 9)
        break;

      c = manager.tableS[j][i];

      if (c.element == null)
        table[j][i] = true;
      else if (c.element.playerOne != playerOne)
      {
        table[j][i] = true;
        break;
      } else if (c.element.playerOne == playerOne)
      {
        table[j][i] = false;
        break;
      }
    }

    // left
    i = positionX;
    j = positionY;
    while (true)
    {
      j--;
      if (j < 0)
        break;

      c = manager.tableS[j][i];

      if (c.element == null)
        table[j][i] = true;
      else if (c.element.playerOne != playerOne)
      {
        table[j][i] = true;
        break;
      } else if (c.element.playerOne == playerOne)
      {
        table[j][i] = false;
        break;
      }
    }

    // up
    i = positionX;
    j = positionY;
    while (true)
    {
      i++;
      if (i > 9)
        break;

      c = manager.tableS[j][i];

      if (c.element == null)
        table[j][i] = true;
      else if (c.element.playerOne != playerOne)
      {
        table[j][i] = true;
        break;
      } else if (c.element.playerOne == playerOne)
      {
        table[j][i] = false;
        break;
      }
    }

    // down
    i = positionX;
    j = positionY;
    while (true)
    {
      i--;
      if (i < 0)
        break;

      c = manager.tableS[j][i];

      if (c.element == null)
        table[j][i] = true;
      else if (c.element.playerOne != playerOne)
      {
        table[j][i] = true;
        break;
      } else if (c.element.playerOne == playerOne)
      {
        table[j][i] = false;
        break;
      }
    }

    return table;
  }

  public boolean[][] PossibleMoveNobleGases(boolean[][] table) {
    TableSquare c; 

    int i, j;

    // Top Side
    i = positionX - 1;
    j = positionY + 1;
    if (j <= 9)
    {
      for (int k = 0; k < 3; k++)
      {
        if (i >= 0 && i < 10)
        {
          c = manager.tableS[j][i];

          if (c.element == null)
            table[j][i] = true;
          else if (c.element.playerOne != playerOne)
          {
            table[j][i] = true;
          } else if (c.element.playerOne == playerOne)
          {
            table[j][i] = false;
          }
        }
        i++;
      }
    }


    // Down Side
    i = positionX - 1;
    j = positionY - 1;
    if (j >= 0)
    {
      for (int k = 0; k < 3; k++)
      {
        if (i >= 0 && i <=9)
        {
          c = manager.tableS[j][i];

          if (c.element == null)
            table[j][i] = true;
          else if (c.element.playerOne != playerOne)
          {
            table[j][i] = true;
          } else if (c.element.playerOne == playerOne)
          {
            table[j][i] = false;
          }
        }
        i++;
      }
    }

    i = positionX - 1;
    j = positionY;
    // Middle Left
    if (i >= 0)
    {
      c = manager.tableS[j][i];

      if (c.element == null)
        table[j][i] = true;
      else if (c.element.playerOne != playerOne)
      {
        table[j][i] = true;
      } else if (c.element.playerOne == playerOne)
      {
        table[j][i] = false;
      }
    }

    i = positionX + 1;
    j = positionY;
    // Middle Right
    if (i <= 9)
    {
      c = manager.tableS[j][i];

      if (c.element == null)
        table[j][i] = true;
      else if (c.element.playerOne != playerOne)
      {
        table[j][i] = true;
      } else if (c.element.playerOne == playerOne)
      {
        table[j][i] = false;
      }
    }
    return table;
  }
}
