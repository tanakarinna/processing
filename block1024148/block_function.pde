float bw; 
float bh = 70;
int block[] = new int[10]; // 10個のブロックの余命カウンター
float [] blockDirection = new float[10];//各ブロックの移動方向の保持
float [] blockY = new float [10]; //各ブロックのY座標を保持
float blockSpeed = 1;//ブロックの移動速度
/*
 10個のブロックを初期化する
*/
void initBlocks() {
  for (int i = 0; i < block.length ; i++) {
    block[i] = 3;
    if(i % 2 == 0){
      blockDirection[i] =1;//偶数番目を１と指定
    } else {
      blockDirection[i] = -1;//奇数番目を‐1と指定
    }   
  blockY[i] = 40;//初期位置を設定
  }
  bw = width / block.length; // ブロックの幅を決める
}

/*
 ボールが10個のブロックのいずれかにぶつかったら跳ね返る
*/
void checkBlocks() {
  for (int i = 0; i < block.length ; i++) {
    if (block[i] > 0) {
      int ret_block = blockHitCheck(i*bw,blockY[i],bw,bh,b_x,b_y,b_w,b_h,b_dx,b_dy);
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
ブロックを上下に動かす
*/
void moveBlocks(){
  for (int i = 0; i < block.length;i++){
    blockY[i] += blockSpeed * blockDirection[i];//各ブロックのY座標を更新する
    if (blockY[i] <= 0 || blockY[i] >= 80){
      blockDirection[i]*= -1;
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
       image(cloud3,i * bw, blockY[i], bw, bh);
      }
      if (block[i] == 2){
        //rect(i * bw, 40, bw-30, bh);
        image(cloud2,i * bw, blockY[i], bw, bh);
      }
      if (block[i]== 1){
        //rect(i * bw, 40, bw-50, bh);
        image(cloud1,i * bw, blockY[i], bw, bh);
      }
      //text(block[i], i * bw, bh-20); // ブロックごとの余命を表示
    }
  }
}
