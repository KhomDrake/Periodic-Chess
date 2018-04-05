void SceneControllSetup() //<>//
{
  // definindo a primeira cena.
  scene = 0;

  // carregando a imagem da primeira cena
  menuScene = new Scene(loadImage("sprites/menuScene/background.png"));
  // Criando um objeto da nova cena 
  choosePieceScene = new SceneChoosePieces(loadImage("sprites/choosePieceScene/backgroundChoosePieces.png"));
  // Carregando os elementos.
  loadImagesElements();
  PVector _size = new PVector(width/5, width/5);
  menuScene.buttons.add(new Button(loadImage("sprites/menuScene/nuclear.png"), "Two Player", Type.ImageCircleSize, new PVector(width * 0.3 - _size.x/2, height/2 - _size.y/2), _size, ButtonType.ChangeScene, 1));
  menuScene.buttons.add(new Button(loadImage("sprites/menuScene/nuclear.png"), "Settings", Type.ImageCircleSize, new PVector(width * 0.7 - _size.x/2, height/2 - _size.y/2), _size, ButtonType.ChangeScene, 4));

  PVector size = new PVector(width/12, width/12);
  float widthFactor = width/14;
  float heightFactor = height/6;
  choosePieceScene.SetButtonsChoosePieces(
    new ButtonChoosePieces(imgTest[0], Type.ImageSize, new PVector(widthFactor, heightFactor - height/7), size, ButtonType.ChoosePieces), 
    new ButtonChoosePieces(imgTest[1], Type.ImageSize, new PVector(widthFactor, heightFactor * 2 - height/7), size, ButtonType.ChoosePieces), 
    new ButtonChoosePieces(imgTest[2], Type.ImageSize, new PVector(widthFactor, heightFactor * 3 - height/7), size, ButtonType.ChoosePieces), 
    new ButtonChoosePieces(imgTest[3], Type.ImageSize, new PVector(widthFactor, heightFactor * 4 - height/7), size, ButtonType.ChoosePieces), 
    new ButtonChoosePieces(imgTest[4], Type.ImageSize, new PVector(widthFactor, heightFactor * 5 - height/7), size, ButtonType.ChoosePieces));

  choosePieceScene.buttons.add(new Button(loadImage("sprites/choosePieceScene/left.jpg"), Type.ImageSize, new PVector(widthFactor, heightFactor * 6 - height/7), new PVector(40, 40), ButtonType.ChangeChoosePiecesImages));
  choosePieceScene.buttons.add(new Button(loadImage("sprites/choosePieceScene/right.jpg"), Type.ImageSize, new PVector(widthFactor + size.x - 40, heightFactor * 6 - height/7), new PVector(40, 40), ButtonType.ChangeChoosePiecesImages));

  PImage img = loadImage("sprites/choosePieceScene/PositionChess.jpg");

  size = new PVector(height/10, height/10);

  for (int i = 0; i < 10; i++)
  {  
    for (int j = 0; j < 10; j++)
    {
      if (j < 3)
        choosePieceScene.setPositionInTable(i, j, new PositionInTable(img, Type.ImageSize, new PVector(i * size.x + width/3, j * size.y), size, ButtonType.PositionInTable, true, true));
      else if (j > 6)
        choosePieceScene.setPositionInTable(i, j, new PositionInTable(img, Type.ImageSize, new PVector(i * size.x + width/3, j * size.y), size, ButtonType.PositionInTable, false, true));
      else
        choosePieceScene.setPositionInTable(i, j, new PositionInTable(img, Type.ImageSize, new PVector(i * size.x + width/3, j * size.y), size, ButtonType.PositionInTable, false, false));
    }
  }

  choosePieceScene.CreateElements();
  choosePieceScene.setButtonsElements();
  playerTurnChoosePieces = true;
  
  manager = new PeriodicChessManager(loadImage("sprites/InGame/Map.png"));
  
  for (int i = 0; i < 10; i++)
  {  
    for (int j = 0; j < 10; j++)
    {
       manager.tableS[i][j] = new TableSquare(i,j,img, Type.ImageSize, new PVector(i * size.x + width/4, j * size.y), size, ButtonType.InGame);
    }
  }
  playerTurnGame = true;
}

void SceneControllDraw(int _scene)
{  
  if (_scene == 0) {
    LoadSceneMenu();
  } else if (_scene == 1){
    LoadSceneChoosePieces();
  } else if (_scene == 2) {
    LoadSceneGame();
  }
}

void SceneControllMousePressed(int _scene)
{  
  if (_scene == 0)
  {
    menuScene.CheckButtons();
  } else if (_scene == 1)
  {
    choosePieceScene.CheckButtons();
  } else if (_scene == 2) {
    LoadSceneGameInMousePressed();
  }
}


void LoadSceneGame()
{
   
   manager.DrawBackground();
   
   if(!gameEnd)
     manager.DrawTable();
   else
   {
      fill(0, 0, 255);
      textAlign(CENTER);
      textSize(60);
      text(textEnd, width/2, height/2);
   }
}

void LoadSceneGameInMousePressed()
{
  if(!gameEnd)
    manager.CheckButtons();
}

void LoadSceneMenu()
{
  menuScene.DrawBackground();
  menuScene.DrawButtons();
}

void LoadSceneChoosePieces()
{
  fill(0, 0, 255);
  textAlign(CENTER);
  textSize(30);
  choosePieceScene.DrawBackground();
  choosePieceScene.DrawButtons();
  choosePieceScene.DrawChoosePiecesButtons();

  if (playerTurnChoosePieces)
  {
    text("Player One", width - width/20, height/20);
  } else
  {
    text("Player Two", width - width/20, height/20);
  }
  
  fill(255,0,0);
  text(textElement, width/4, height * 0.9); 
  
  
  if (playerOnePieces == 17 && playerTwoPieces == 17) {
    scene = 2;
    for(int i = 0; i < piecesPlayerOne.size(); i++)
    {
       PeriodicTableElements s = piecesPlayerOne.get(i);      
       manager.tableS[s.positionY][s.positionX].element = s;
    }
    for(int i = 0; i < piecesPlayerTwo.size(); i++)
    {
       PeriodicTableElements s = piecesPlayerTwo.get(i);      
       manager.tableS[s.positionY][s.positionX].element = s;
    }
  }
}

void loadImagesElements()
{
  elementsData = loadTable("PeriodicTableofElements.csv", "header");

  for (int i = 0; i < 105; i++)
  {
    TableRow index = elementsData.getRow(i);
    imgTest[index.getInt("Atomic Number") - 1] = loadImage("elements/" + index.getString("Element") + ".png");
  }
}
