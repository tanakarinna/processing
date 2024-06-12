/*
 ボールの位置と速度を初期化
*/
void initBall() {
  b_x = width/2;
  b_y = height - r_h;
  b_dx = 0;
  b_dy = 0;
}


void sunShot () {
 if(ballStatus == 1){
   image(sun,b_x,b_y,b_w,b_h); 
   b_x += b_dx;
   b_y += b_dy;
   if(b_y < 0){
    ballStatus = 0;
    b_x = r_x + r_w/2;
    b_y = r_y -b_h;
    }//ボールが画面の外に出た場合
  }
  if(ballStatus == 0){
   b_x = r_x + r_w/2;
   b_y = r_y -b_h;
  }
}
