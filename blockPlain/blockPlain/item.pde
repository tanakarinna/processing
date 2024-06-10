float thunder_x, thunder_y; // 雷の左上の座標
float thunder_w = 50, thunder_h = 50; // 雷の幅と高さ
float thunder_dx, thunder_dy; // 雷の移動速度

void initThunder() {
  thunder_x = 100;
  thunder_y = 200;
  thunder_dx = 0;
  thunder_dy = 10;
}//雷アイテムの位置と速度を初期化

void showThunders () {
  //rect(thunder_x,thunder_y,thunder_w,thunder_h);//雷アイテムの範囲表示
  image(thunder,thunder_x,thunder_y,thunder_w,thunder_h);//雷アイテムの画像の表示と位置と大きさ
}

float rainbow_x,rainbow_y; //虹の左上の座標
float rainbow_w = 50, rainbow_h = 50; //虹の幅と高さ
float rainbow_dx, rainbow_dy; //虹の移動速度

void showRainbows () {
  //rect(rainbow_x,rainbow_y,rainbow_w,rainbow_h);//虹アイテムの範囲表示
  image(rainbow,rainbow_x,rainbow_y,rainbow_w,rainbow_h);//虹アイテムの画像の表示と位置と大きさ
}

void initRainbow () {
  rainbow_x = 400;
  rainbow_y = 200;
  rainbow_dx = 0;
  rainbow_dy = 10;
} //虹アイテムの位置と速度を初期化


float snow_x, snow_y ; //雪の左上の座標
float snow_w = 50, snow_h = 50;//雪の幅と高さ
float snow_dx,snow_dy; //雪の移動速度

void showSnows () {
  image(snow1,snow_x,snow_y,snow_w,snow_h);
  }

void initSnow() {
  snow_x = 300;
  snow_y = 200;
  snow_dx = 0;
  snow_dy = 10;
}//雪アイテムの位置と速度を初期化
