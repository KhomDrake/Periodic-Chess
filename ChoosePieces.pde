public class ChoosePieces
{
   public boolean isChoosePlayerOne, isChoosePlayerTwo, isSelected;
   public ElementsType myType;
   public int AtomicNumber;
   public PImage myImage;
   public String name;
   
   ChoosePieces(ElementsType type, int AN, PImage img)
   {
     this.myType = type;
     this.AtomicNumber = AN;
     this.myImage = img;
   }
   
   ChoosePieces(String type, int AN, PImage img, String n)
   {
     this.myType = whatType(type);
     this.AtomicNumber = AN;
     this.myImage = img;
     this.name = n;
   }
   
   ElementsType whatType(String type)
   {
       if(type.intern() == "Nonmetal")
       {
           return ElementsType.OtherNoMetals;
       }
       else if(type.intern() == "Noble Gas")
       {
           return ElementsType.NobleGases;
       }
       else if(type.intern() == "Alkali Metal")
       {
           return ElementsType.AlkalineMetals;
       }
       else if(type.intern() == "Alkaline Earth Metal")
       {
           return ElementsType.AlkalineEarthMetals;
       }
       else if(type.intern() == "Metalloid") // semi metal
       {
           return ElementsType.SemiMetals;
       }
       else if(type.intern() == "Halogen")
       {
           return ElementsType.Halogens;
       }
       else if(type.intern() == "Transition Metal" || type.intern() == "Transactinide")
       {
           return ElementsType.TransitionMetals;
       }
       else if(type.intern() == "Metal") // Metais de Pos Transição
       {
           return ElementsType.PosTransitionMetals;
       }
       else if(type.intern() == "Lanthanide")
       {
           return ElementsType.Lanthanoids;
       }
       else if(type.intern() == "Actinide")
       {
           return ElementsType.Actinoids;
       }
       
      return null;
   }
}

public enum ElementsType
{
    Actinoids(0),
    AlkalineEarthMetals(1),
    AlkalineMetals(2),
    Halogens(3),
    Lanthanoids(4),
    NobleGases(5),
    OtherNoMetals(6),
    PosTransitionMetals(7),
    SemiMetals(8),
    TransitionMetals(9);
    
    private int valor;
    
    private ElementsType(int v)
    {
      valor = v;
    }
    
    int elementsType()
    {
       return valor;
    }
}


public boolean canSelected(ChoosePieces piece, int[] playerChoices)
{
    if(piece.myType == ElementsType.Actinoids && playerChoices[0] < 1)
    {
       playerChoices[0]++;
       return true;
    }
    if(piece.myType == ElementsType.AlkalineMetals && playerChoices[1] < 2)
    {
       playerChoices[1]++;
       return true;
    }
    if(piece.myType == ElementsType.AlkalineEarthMetals && playerChoices[2] < 2)
    {
       playerChoices[2]++;
       return true;
    }
    if(piece.myType == ElementsType.Halogens && playerChoices[3] < 2)
    {
       playerChoices[3]++;
       return true;
    }
    if(piece.myType == ElementsType.Lanthanoids && playerChoices[4] < 1)
    {
       playerChoices[4]++;
       return true;
    }
    if(piece.myType == ElementsType.NobleGases && playerChoices[5] < 1)
    {
       println("asd");
       playerChoices[5]++;
       return true;
    }
    if(piece.myType == ElementsType.OtherNoMetals && playerChoices[6] < 2)
    {
       playerChoices[6]++;
       return true;
    }
    if(piece.myType == ElementsType.PosTransitionMetals && playerChoices[7] < 2)
    {
       playerChoices[7]++;
       return true;
    }
    if(piece.myType == ElementsType.SemiMetals && playerChoices[8] < 2)
    {
       playerChoices[8]++;
       return true;
    }
    if(piece.myType == ElementsType.TransitionMetals && playerChoices[9] < 2)
    {
       playerChoices[9]++;
       return true;
    }
     
     
    println(playerChoices);
    println(piece.myType);
    return false;  
}

public void howManyPiecesAlreadyBeenChoose(int[] playerChoices, boolean playerOne)
{
    if(playerChoices[5] == 1)
    {
       for(int i = 0; i < 108; i++)
       {
          if(choosePieceScene.choosePieces[i].myType == ElementsType.NobleGases)
          {
             if(playerOne)
               choosePieceScene.choosePieces[i].isChoosePlayerOne = true;
             else
               choosePieceScene.choosePieces[i].isChoosePlayerTwo = true;
          }
       }
    }
    
    if(playerChoices[0] == 1)
    {
       for(int i = 0; i < 108; i++)
       {
          if(choosePieceScene.choosePieces[i].myType == ElementsType.Actinoids)
          {
             if(playerOne)
               choosePieceScene.choosePieces[i].isChoosePlayerOne = true;
             else
               choosePieceScene.choosePieces[i].isChoosePlayerTwo = true;
          }
       }
    }
    if(playerChoices[1] == 2)
    {
       for(int i = 0; i < 108; i++)
       {
          if(choosePieceScene.choosePieces[i].myType == ElementsType.AlkalineMetals)
          {
             if(playerOne)
               choosePieceScene.choosePieces[i].isChoosePlayerOne = true;
             else
               choosePieceScene.choosePieces[i].isChoosePlayerTwo = true;
          }
       }
    }
    if(playerChoices[2] == 2)
    {
       for(int i = 0; i < 108; i++)
       {
          if(choosePieceScene.choosePieces[i].myType == ElementsType.AlkalineEarthMetals)
          {
             if(playerOne)
               choosePieceScene.choosePieces[i].isChoosePlayerOne = true;
             else
               choosePieceScene.choosePieces[i].isChoosePlayerTwo = true;
          }
       }
    }
    if(playerChoices[3] == 2)
    {
       for(int i = 0; i < 108; i++)
       {
          if(choosePieceScene.choosePieces[i].myType == ElementsType.Halogens)
          {
             if(playerOne)
               choosePieceScene.choosePieces[i].isChoosePlayerOne = true;
             else
               choosePieceScene.choosePieces[i].isChoosePlayerTwo = true;
          }
       }
    }
    if(playerChoices[4] == 1)
    {
       for(int i = 0; i < 108; i++)
       {
          if(choosePieceScene.choosePieces[i].myType == ElementsType.Lanthanoids)
          {
             if(playerOne)
               choosePieceScene.choosePieces[i].isChoosePlayerOne = true;
             else
               choosePieceScene.choosePieces[i].isChoosePlayerTwo = true;
          }
       }
    }
    if(playerChoices[6] == 2)
    {
       for(int i = 0; i < 108; i++)
       {
          if(choosePieceScene.choosePieces[i].myType == ElementsType.OtherNoMetals)
          {
             if(playerOne)
               choosePieceScene.choosePieces[i].isChoosePlayerOne = true;
             else
               choosePieceScene.choosePieces[i].isChoosePlayerTwo = true;
          }
       }
    }
    if(playerChoices[7] == 2)
    {
       for(int i = 0; i < 108; i++)
       {
          if(choosePieceScene.choosePieces[i].myType == ElementsType.PosTransitionMetals)
          {
             if(playerOne)
               choosePieceScene.choosePieces[i].isChoosePlayerOne = true;
             else
               choosePieceScene.choosePieces[i].isChoosePlayerTwo = true;
          }
       }
    }
    if(playerChoices[8] == 2)
    {
       for(int i = 0; i < 108; i++)
       {
          if(choosePieceScene.choosePieces[i].myType == ElementsType.SemiMetals)
          {
             if(playerOne)
               choosePieceScene.choosePieces[i].isChoosePlayerOne = true;
             else
               choosePieceScene.choosePieces[i].isChoosePlayerTwo = true;
          }
       }
    }
    if(playerChoices[9] == 2)
    {
       for(int i = 0; i < 108; i++)
       {
          if(choosePieceScene.choosePieces[i].myType == ElementsType.TransitionMetals)
          {
             if(playerOne)
               choosePieceScene.choosePieces[i].isChoosePlayerOne = true;
             else
               choosePieceScene.choosePieces[i].isChoosePlayerTwo = true;
          }
       }
    }
}
