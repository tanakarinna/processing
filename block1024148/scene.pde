void game_scene() {

  thunder_x += thunder_dx;
  thunder_y += thunder_dy;

  snow_x += snow_dx;
  snow_y += snow_dy;

  rainbow_x += rainbow_dx;
  rainbow_y += rainbow_dy;

  moon_x += moon_dx;
  moon_y += moon_dy;

  gameTime = millis() - startTime;
  limitTime = 30000 - gameTime;

  if (gameTime >= 0 && gameTime < 3000) {
    image(sky1, 0, 0, width, height);//初期の背景画像
  }

  if (gameTime >= 3000 && gameTime < 6000) {
    image(sky2, 0, 0, width, height);
  }

  if (gameTime >= 6000 && gameTime < 9000) {
    image(sky3, 0, 0, width, height);
  }

  if (gameTime >= 9000) {
    image(sky4, 0, 0, width, height);
  }



  //rect(x, y, b_w, b_h); // ボールの表示
  //image(sun,x,y,b_w,b_h);//太陽の画像の表示と位置と大きさ

  //rect(thunder_x,thunder_y,thunder_w,thunder_h);//雷アイテムの範囲表示
  //image(thunder,thunder_x,thunder_y,thunder_w,thunder_h);//雷アイテムの画像の表示と位置と大きさ

  sunShot ();//ボールの発射

  moveBlocks();//ブロックを上下に動かす
  checkBlocks(); // ブロックによるボールの跳ね返り処理
  showBlocks(); //　命が残っているブロックを表示する
  
  if (thunderCount > 0) {
    showThunders ();//命が残っている雷アイテムを表示する
  }

  if (snowCount > 0) {
    showSnows ();//命が残っている氷アイテムを表示する
  }

  if (rainbowCount > 0) {
    showRainbows ();//命が残っている虹アイテムを表示する
  }

  if (moonCount > 0) {
    showMoons ();//命が残っている虹アイテムを表示する
  }



  thunder_x += thunder_dx;
  thunder_y += thunder_dy;

  checkAndShowRacket(height-80); // ラケットの表示とボールの打ち返し処理
  //image(teruterubouzu, r_x +20, height-80,r_w,r_h);//てるてる坊主の位置と大きさ
  showRacket();

  PFont myFont = loadFont("ComicSansMS-Italic-48.vlw");
  textFont(myFont);
  fill(255, 255, 255, 75);
  textSize(100);
  text(limitTime/1000, width/2, height/2);

  

  //if (b_y + b_h >= height) { // ボールをラケットで受け損ねたらゲームを初期化する
  //  initBall();
  //  initBlocks();
  //  base_time = millis(); //時間の初期化
  //}
  //if (b_x < 0 || b_x+b_w >=width) {
  //  b_dx = -b_dx;
  //} // ボールが左右の壁に当たったら跳ね返る
  //if (b_y < 0) {
  //  b_dy = -b_dy;
  //} //　ボールが上部の壁に当たったら跳ね返る

  if (gameTime/1000 > 30 || racketLife == 0 || checkBlockDeleted()==false ) {
    for(int i = 0; i < block.length ; i++){
      score = score + block[i];
    }
    scene = 3;
  }
}

void start_scene() {
  image(start, 0, 0, width, height);
}

void result_scene() {
  if(score >= 0 && score <6){
    image(result5, 0, 0, width, height);
  }
  if(score >= 6 && score <11){
    image(result4, 0, 0, width, height);
  }
  if(score >= 11 && score <16){
    image(result3, 0, 0, width, height);
  }
  if(score >= 16 && score <21){
    image(result2, 0, 0, width, height);
  }
  if(score >= 21 ){
    image(result1, 0, 0, width, height);
  }
}



boolean checkBlockDeleted() {
  for (int i = 0; i < block.length; i++) {
   if(block[i]>=1){
     return true;
   }
  }
  return false;
}
