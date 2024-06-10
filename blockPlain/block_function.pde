float bw; 
float bh = 60;

/*
 10個のブロックを初期化する
*/
void initBlocks() {
  for (int i = 0; i < block.length ; i++) {
    block[i] = 3;
  }
  bw = width / block.length; // ブロックの幅を決める
}

/*
 ボールが10個のブロックのいずれかにぶつかったら跳ね返る
*/
void checkBlocks() {
  for (int i = 0; i < block.length ; i++) {
    if (block[i] > 0) {
      int ret_block = blockHitCheck(i*bw,40,bw,bh,b_x,b_y,b_w,b_h,b_dx,b_dy);
      if (ret_block > 0) {
        if (ret_block == 1) {
          ballStatus = 0;
          //b_dx = -b_dx;
        } else if (ret_block == 2) {
           ballStatus = 0;
          //b_dy = -b_dy;
          block[i]--;
        } else if (ret_block == 3) {
          ballStatus = 0;
          //b_dx = -b_dx;
          //b_dy = -b_dy;
          block[i]--;
        }
        return;
      }
    }
  }  
}

/*
 10個のブロックを表示する
*/
void showBlocks() {
  for (int i = 0; i < block.length ; i++) {
    if (block[i] > 0) {
      
      if (block[i]== 3 ){
       //rect(i * bw, 40, bw, bh); // ブロックの描画
       image(cloud3,i * bw, 40, bw, bh);
      }
      if (block[i] == 2){
        //rect(i * bw, 40, bw-30, bh);
        image(cloud2,i * bw, 40, bw-20, bh);
      }
      if (block[i]== 1){
        //rect(i * bw, 40, bw-50, bh);
        image(cloud1,i * bw, 40, bw-30, bh);
      }
      text(block[i], i * bw, bh-20); // ブロックごとの余命を表示
    }
  }
}
