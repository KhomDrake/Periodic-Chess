PImage[] imgTest = new PImage[108];
Table elementsData;
int scene;
boolean playerTurnChoosePieces, playerTurnGame, gameEnd;
String textEnd, textElement = "";
boolean show;
Scene menuScene;
ArrayList<PeriodicTableElements> piecesPlayerOne = new ArrayList<PeriodicTableElements>();
ArrayList<PeriodicTableElements> piecesPlayerTwo = new ArrayList<PeriodicTableElements>();
int[] piecesCanHave = new int[]{1,2,2,2,1,1,2,2,2,2};
int[] piecesPlayerOneHave = new int[]{0,0,0,0,0,0,0,0,0,0};
int[] piecesPlayerTwoHave = new int[]{0,0,0,0,0,0,0,0,0,0};
int playerOnePieces = 0;

int playerTwoPieces = 0;
SceneChoosePieces choosePieceScene;
PeriodicChessManager manager;

void setup()
{
    fullScreen();
//   size(displayWidth,displayHeight);
   SceneControllSetup();
}

void draw()
{
  background(0);
  
  SceneControllDraw(scene);
}

void mousePressed()
{
   SceneControllMousePressed(scene);
}
