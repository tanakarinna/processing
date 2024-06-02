/*
  checkAndShowRacket()
  float r_y;  // r_hはラケットのy座標
*/
void checkAndShowRacket(float r_y) {
  float r_x = mouseX; // r_x はラケットの左側のx座標
  
  if (r_x + r_w > width) { // 右に寄りすぎていたら補正する
    r_x = width - r_w;
  } 
  
  /* ラケットにボールが当たったらボールを上方へ跳ね返す */
  if (blockHitCheck(r_x,r_y,r_w,r_h,x,y,b_w,b_h,dx,dy) > 0) {
    dy = -2;
  }
  int ret = blockHitCheck(r_x,r_y,r_w,r_h,kaminari_x,kaminari_y,kaminari_w,kaminari_h,kaminari_dx,kaminari_dy);
  if(ret > 0){
    kaminari_dy = -kaminari_dy;
  }
  
  rect(r_x, r_y, r_w, r_h); // ラケットを表示する
}
