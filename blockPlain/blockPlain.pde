int block[] = new int[10]; // 10個のブロックの余命カウンター
float b_x, b_y; // ボールの左上の座標
float b_w = 50, b_h = 50; // ボールの幅と高さ
float b_dx, b_dy; // ボールの移動速度
float r_x,r_y;
float r_w = 80, r_h = 80; // ラケットの幅と高さ
float r_dx;//ラケットの移動速度
int thunderCount = 1;//サンダーの命
int snowCount = 1;//雪の命
int rainbowCount = 1;//虹の命
int moonCount = 1;//月の命
int base_time = 0;//時間の
float time;
int ballStatus = 0;//ボールの状態


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


int racketLife=3; //ラケットのレベル

int thunderItem[] = new int[1];//雷アイテムの余命カウンター
int snowItem[] = new int[1];//雪アイテムの余命カウンター
int rainbowItem[] = new int[1];//虹アイテムの余命カウンター
int moonItem[] = new int[1];//虹アイテムの余命カウンター

void setup() {
  size(700,850);//画面のサイズ
  initBall(); // ボールの初期化
  initRacket();
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
}

void draw() {  
  //x += dx;
 // y += dy;
  
  
  thunder_x += thunder_dx;
  thunder_y += thunder_dy;
  
  snow_x += snow_dx;
  snow_y += snow_dy;
  
  rainbow_x += rainbow_dx;
  rainbow_y += rainbow_dy;
  
  moon_x += moon_dx;
  moon_y += moon_dy;
  
  time = millis() - base_time; 
  
  if(time >= 0 && time < 3000){
  image(sky1,0,0,width,height);//初期の背景画像
  }
  
  if(time >= 3000 && time < 6000){
  image(sky2,0,0,width,height);
  }
  
  if(time >= 6000 && time < 9000){
  image(sky3,0,0,width,height);
  }
  
  if(time >= 9000){
  image(sky4,0,0,width,height);
  }
  
  
  
  //rect(x, y, b_w, b_h); // ボールの表示
  //image(sun,x,y,b_w,b_h);//太陽の画像の表示と位置と大きさ
  
  //rect(thunder_x,thunder_y,thunder_w,thunder_h);//雷アイテムの範囲表示
  //image(thunder,thunder_x,thunder_y,thunder_w,thunder_h);//雷アイテムの画像の表示と位置と大きさ
  
  sunShot ();//ボールの発射 
  
  checkBlocks(); // ブロックによるボールの跳ね返り処理
  showBlocks(); //　命が残っているブロックを表示する
  
  if (thunderCount > 0){
  showThunders ();//命が残っている雷アイテムを表示する
  }
  
  if (snowCount > 0){
  showSnows ();//命が残っている氷アイテムを表示する
  }

  if (rainbowCount > 0){
  showRainbows ();//命が残っている虹アイテムを表示する
  }
 
 if (moonCount > 0){
  showMoons ();//命が残っている虹アイテムを表示する
  }
 
  
  checkAndShowRacket(height-80); // ラケットの表示とボールの打ち返し処理
  //image(teruterubouzu, r_x +20, height-80,r_w,r_h);//てるてる坊主の位置と大きさ
  showRacket();
  
  
  
  text(millis()/1000,width/2,height/2);
 
 
 
  if (b_y + b_h >= height) { // ボールをラケットで受け損ねたらゲームを初期化する
    initBall();
    initBlocks();
    base_time = millis(); //時間の初期化
  }
  if (b_x < 0 || b_x+b_w >=width) {
    b_dx = -b_dx;
  } // ボールが左右の壁に当たったら跳ね返る
  if (b_y < 0) {
    b_dy = -b_dy;
  } //　ボールが上部の壁に当たったら跳ね返る
}
