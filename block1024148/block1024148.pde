float b_x, b_y; // ボールの左上の座標
float b_w = 50, b_h = 50; // ボールの幅と高さ
float b_dx, b_dy; // ボールの移動速度
float r_x,r_y;//ラケットの左上の座標
float r_w = 80, r_h = 80; // ラケットの幅と高さ
float r_dx;//ラケットの移動速度
int thunderCount = 1;//サンダーの命
int snowCount = 1;//雪の命
int rainbowCount = 1;//虹の命
int moonCount = 1;//月の命
int base_time = 0;//時間の
int gameTime;//ゲームプレイの時間
int limitTime;//ゲームの制限時間
int ballStatus = 0;//ボールの状態
int scene = 1;//一番初めのシーン

PImage teruteru1;
PImage cloud3;
PImage cloud2;
PImage cloud1;
PImage sun;
PImage thunder;
PImage sky1;
PImage rainbow;
PImage storm;
PImage snow1;
PImage sky2;
PImage sky3;
PImage sky4;
PImage snow2;
PImage teruteru2;
PImage teruteru3;
PImage teruteru4;
PImage moon;
PImage shootingstar;
PImage start;
PImage result1;
PImage result2;
PImage result3;
PImage result4;
PImage result5;

int score = 0;

int racketLife=3; //ラケットの命

int thunderItem[] = new int[1];//雷アイテムの余命カウンター
int snowItem[] = new int[1];//雪アイテムの余命カウンター
int rainbowItem[] = new int[1];//虹アイテムの余命カウンター
int moonItem[] = new int[1];//虹アイテムの余命カウンター

void setup() {
  size(700,850);//画面のサイズ
  initBall(); // ボールの初期化
  initRacket();//ラケットの初期化
  initBlocks(); // ブロックの初期化
  initThunder (); //雷アイテムの初期化
  initSnow ();//雪アイテムの初期化
  initRainbow();//虹アイテムの初期化
  initMoon();//月アイテムの初期化
  teruteru1 = loadImage("teruteru.png");
  cloud3 = loadImage("cloud3.png");
  cloud2 = loadImage("cloud2.png");
  cloud1 = loadImage("cloud1.png");
  sun = loadImage("sun.png");
  thunder = loadImage("thunder.png");
  sky1 = loadImage("sky1.jpg");
  rainbow = loadImage("rainbow.png");
  storm = loadImage("storm.png");
  snow1 = loadImage ("snow1.png");
  sky2 = loadImage("sky2.jpg");
  sky3 = loadImage("sky3.jpg");
  sky4 = loadImage("sky8.jpg");
  snow2 = loadImage("snow2.png");
  teruteru2 = loadImage("teru2.png");
  teruteru3 = loadImage("teru3.png");
  teruteru4 = loadImage("blackteruteru.png");
  moon = loadImage("moon.png");
  shootingstar = loadImage("shootingstar.png");
  start = loadImage("start_scene.png");
  result1 = loadImage("result1.png");
  result2 = loadImage("result2.png");
  result3 = loadImage("result3.png");
  result4 = loadImage("result4.png");
  result5 = loadImage("result5.png");
}

void draw() {  
  switch(scene){
    case 1:
    start_scene();
    break;
    case 2:
    game_scene();
    break;
    case 3:
    result_scene();
    break;
  }
}
