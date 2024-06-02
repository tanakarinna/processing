int block[] = new int[10]; // 10個のブロックの余命カウンター
float x, y; // ボールの左上の座標
float b_w = 50, b_h = 50; // ボールの幅と高さ
float dx, dy; // ボールの移動速度
float r_w = 10.0, r_h = 3.0; // ラケットの幅と高さ

PImage teruterubouzu;
PImage kumoikari;
PImage kumohutuu;
PImage kumokanasimi;
PImage taiyou;
PImage kaminari;

void setup() {
  size(830,930);//画面のサイズ
  initBall(); // ボールの初期化
  initBlocks(); // ブロックの初期化
  initKaminari (); //雷アイテム
  teruterubouzu = loadImage("teruterubouzu.png");
  kumoikari = loadImage("kumoikari.png");
  kumohutuu = loadImage("kumohutuu.png");
  kumokanasimi = loadImage("kumokanasimi.png");
  taiyou = loadImage("taiyou.png");
  kaminari = loadImage("kaminari.png");
}

void draw() {  
  x += dx;
  y += dy;
  background(234, 111, 80);

  kaminari_x += kaminari_dx;
  kaminari_y += kaminari_dy;
  
  
  rect(x, y, b_w, b_h); // ボールの表示
  image(taiyou,x,y,b_w,b_h);//太陽の画像の表示と位置と大きさ
  
  rect(kaminari_x,kaminari_y,kaminari_w,kaminari_h);//雷アイテムの範囲表示
  image(kaminari,kaminari_x,kaminari_y,kaminari_w,kaminari_h);//雷アイテムの画像の表示と位置と大きさ
  
  checkBlocks(); // ブロックによるボールの跳ね返り処理
  showBlocks(); //　命が残っているブロックを表示する
  
  checkAndShowRacket(height-80); // ラケットの表示とボールの打ち返し処理
  image(teruterubouzu, mouseX-20, height-80,80,80);//てるてる坊主の位置と大きさ
  
  
 
  if (y + b_h >= height) { // ボールをラケットで受け損ねたらゲームを初期化する
    initBall();
    initBlocks();
  }
  if (x < 0 || x+b_w >=width) {dx = -dx;} // ボールが左右の壁に当たったら跳ね返る
  if (y < 0) {dy = -dy;} //　ボールが上部の壁に当たったら跳ね返る
}
