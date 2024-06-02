float kaminari_x, kaminari_y; // 雷の左上の座標
float kaminari_w = 50, kaminari_h = 50; // 雷の幅と高さ
float kaminari_dx, kaminari_dy; // 雷の移動速度

void initKaminari() {
  kaminari_x = 100;
  kaminari_y = 200;
  kaminari_dx = 0;
  kaminari_dy = 2;
}//雷アイテムの位置と速度を初期化
