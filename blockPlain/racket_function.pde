/*
  checkAndShowRacket()
 float r_y;  // r_hはラケットのy座標
 */
void initRacket() {
  r_x = width /2;
  r_y = height-r_h;
  r_dx = 50.0;
}

void keyPressed() {
  if (key == CODED) {      // コード化されているキーが押された
    if (keyCode == RIGHT) {    // rightキーが押されたとき画面右方向に動かす
      r_x += r_dx;
    }
    if (keyCode == LEFT) {   // leftキーが押されたときに画面左方向に動かす
      r_x -= r_dx;
    }
    if (keyCode == UP && ballStatus == 0) {  //upキーが押されたときに画面上方向に動かす
      ballStatus = 1;
      b_dx = 0;
      b_dy = -50;
    }
    if (keyCode == DOWN) { //downキーが押されたときに画面下方向に動かす
      //r_y += r_speed;
    }
  }
}

void checkAndShowRacket(float r_y) {
  //float r_x = mouseX; // r_x はラケットの左側のx座標
  if (r_x + r_w > width) { // 右に寄りすぎていたら補正する
    r_x = width - r_w;
  }

  if (r_x < 0) { // 左に寄りすぎていたら補正する
    r_x = 0;
  }


  /* ラケットにボールが当たったらボールを上方へ跳ね返す */
  if (blockHitCheck(r_x, r_y, r_w, r_h, b_x, b_y, b_w, b_h, b_dx, b_dy) > 0) {
    b_dy = -2;
  }

  //rect(r_x, r_y, r_w, r_h); // ラケットを表示する

  //int ret_thunder = blockHitCheck(r_x,r_y,r_w,r_h,thunder_x,thunder_y,thunder_w,thunder_h,thunder_dx,thunder_dy); //サンダーと

  //if(ret_thunder > 0){
  if (thunderCount>0) {
    if (isOverlap(b_x, b_y, b_w, b_h, thunder_x, thunder_y, thunder_w, thunder_h)) {
      //r_w = r_w-40;
      //r_h = r_h-40;
      racketLife = racketLife-1;
      println(racketLife);
      thunderCount =thunderCount - 1;
    }
  }


  if (snowCount>0) {
    if (isOverlap(b_x, b_y, b_w, b_h, snow_x, snow_y, snow_w, snow_h)) {
      snowCount = snowCount - 1;
      image(snow2, 0, 0, width, height);
    }
  }


  //int ret_rainbow = blockHitCheck(r_x,r_y,r_w,r_h,rainbow_x,rainbow_y,rainbow_w,rainbow_h,rainbow_dx,rainbow_dy); //虹と


  //if(ret_rainbow > 0){
  //雷に当たったらcount-1、虹に当たったらcount+1にしてその値によって表示するラケット変更

  if (rainbowCount>0) {
    if (isOverlap(b_x, b_y, b_w, b_h, rainbow_x, rainbow_y, rainbow_w, rainbow_h)) {
      //float a=r_w+20;
      //float b=r_h+20;
      //r_w = r_w+20;
      //r_h = r_h+20;
      //image(teruteru2, r_x+20, height-80,a,b);
      rainbowCount = rainbowCount - 1;
      racketLife = racketLife+1;
      println(racketLife);
    }
  }



  if (moonCount>0) {
    if (isOverlap(b_x, b_y, b_w, b_h, moon_x, moon_y, moon_w, moon_h)) {
      // r_w = r_w-40;
      //r_h = r_h-40;
      moonCount = moonCount - 1;
      image(shootingstar, shootingstar_x, shootingstar_y, shootingstar_w, shootingstar_h);
      shootingstar_x += shootingstar_dx;
      shootingstar_y += shootingstar_dy;
    }
  }
}

void showRacket() {
  if (racketLife==3) {
    image(teruteru1, r_x +20, height-80, r_w, r_h);
  } else if (racketLife==2) {
    image(teruteru2, r_x+20, height-80, r_w, r_h);
  } else if (racketLife==1) {
    image(teruteru3, r_x +20, height-80, r_w, r_h);
  } else if (racketLife==0) {
    image(teruteru4, r_x +20, height-80, r_w, r_h);
  }
}
