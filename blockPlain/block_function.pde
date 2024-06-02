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
      int ret = blockHitCheck(i*bw,40,bw,bh,x,y,b_w,b_h,dx,dy);
      if (ret > 0) {
        if (ret == 1) {
          dx = -dx;
        } else if (ret == 2) {
          dy = -dy;
          block[i]--;
        } else if (ret == 3) {
          dx = -dx;
          dy = -dy;
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
       rect(i * bw, 40, bw, bh); // ブロックの描画
       image(kumoikari,i * bw, 40, bw, bh);
      }
      if (block[i] == 2){
        rect(i * bw, 40, bw-30, bh);
        image(kumohutuu,i * bw, 40, bw-20, bh);
      }
      if (block[i]== 1){
        rect(i * bw, 40, bw-50, bh);
        image(kumokanasimi,i * bw, 40, bw-30, bh);
      }
      text(block[i], i * bw, bh-20); // ブロックごとの余命を表示
    }
  }
}
