import java.util.Random;

Random random = new Random();
final int RESOLUTION = 420, POINT_SIZE = 10, X_MAX = RESOLUTION/POINT_SIZE;
int fuelX = 0, fuelY = 0, firstIndex = 1, lastIndex = 0;//The firstIndex is the newest index and the lastIndex is the oldest
int[] snakeX = {3,4}, snakeY = {3,3}, snakeReset;
char prevKey = 't';

void setup(){
  size(420,420);
  for(int i = 0; i < RESOLUTION; i++){//fills the screen with color(220)
    for(int i2 = 0; i2 < RESOLUTION; i2++){
      set(i, i2, color(220));
    }
  }
  
  drawPoint(snakeX[0], snakeY[0], color(0));
  drawPoint(snakeX[1], snakeY[1], color(0));
  
  drawBorder();
  
}

void draw(){
  if(checkFuel()){
    snakeReset = snakeX;
    snakeX = new int[snakeX.length];//adds 1 index becasue .length is 1 higher the indexes
    int resetI = 0, xI = firstIndex;
    while(xI == snakeX.length){
      resetI = resetI < snakeX.length - 1 ? resetI + 1 : 0;
      xI++;
      snakeX[xI] = snakeReset[resetI];
    }
    snakeX[snakeX.length - 1] = snakeReset[lastIndex]+1;
    
    snakeReset = snakeY;
    snakeY = new int[snakeY.length];//adds 1 index becasue .length is 1 higher the indexes
    resetI = 0;
    xI = firstIndex;
    while(xI == snakeY.length){
      resetI = resetI < snakeY.length - 1 ? resetI + 1 : 0;
      xI++;
      snakeY[xI] = snakeReset[resetI];
    }
    snakeY[snakeY.length - 1] = snakeReset[lastIndex]+1;
  
  }else if(checkBorder()){
    
  }else if(checkSnake()){
    
  }
  
  if(){//A certain amount of time has past
    if(key != prevKey && (key == 'w' || key == 'a' || key == 's' || key == 'd')){//Checks if 
    }
    switch(){
      
    }
  }
    if(keyPressed){
      if(key == 'p'){
        System.out.println(lastIndex);
      }
      drawPoint(snakeX[lastIndex], snakeY[lastIndex], color(220));
      int prevFirstIndex = firstIndex;
      firstIndex = firstIndex < snakeX.length - 1 ? firstIndex + 1 : 0;
      
      switch(key){
        case 'w':
          snakeX[firstIndex] = snakeX[prevFirstIndex]; //<>//
          snakeY[firstIndex] = snakeY[prevFirstIndex] - 1;
          break;
          
        case 's':
          snakeX[firstIndex] = snakeX[prevFirstIndex];
          snakeY[firstIndex] = snakeY[prevFirstIndex] + 1;
          break;
        case 'a':
          snakeX[firstIndex] = snakeX[prevFirstIndex] - 1;
          snakeY[firstIndex] = snakeY[prevFirstIndex];
          break;
        case 'd':
          snakeX[firstIndex] = snakeX[prevFirstIndex] + 1;
          snakeY[firstIndex] = snakeY[prevFirstIndex];
          break;
      }
    drawPoint(snakeX[firstIndex], snakeY[firstIndex], color(0));
    //firstIndex++ may also work but im not sure
    //Moves the first and last index to the next index of the array unless it is at the end in which case it goes back to the begining
    lastIndex = lastIndex < snakeX.length-1 ? lastIndex + 1 : 0;
    
  }
}


void drawFuel(){
  fuelX = random.nextInt(RESOLUTION / 10 - 1);
  fuelY = random.nextInt(RESOLUTION / 10 - 1);
  

}

void drawBorder(){
  for(int i = 1; i <= RESOLUTION / 10; i++){
    drawPoint(i, 1, color(10));
    drawPoint(i, RESOLUTION / 10, color(10));
    drawPoint(1, i, color(10));
    drawPoint(RESOLUTION / 10, i, color(10)); 
  }
}

void drawPoint(int x, int y, int pColor){
  for(int i = y * POINT_SIZE; i > y * POINT_SIZE - POINT_SIZE; i--){
    for(int i2 = x * POINT_SIZE; i2 > x * POINT_SIZE - POINT_SIZE; i2--){
      set(i2, i, pColor);
    }
  }
}

boolean checkFuel(){
  if(snakeX[firstIndex] == fuelX && snakeY[firstIndex] == fuelY){
    return true;
  }else{
    return false;
  }
}

boolean checkBorder(){
  if(snakeX[firstIndex] >=RESOLUTION / 10 || snakeX[firstIndex] <= 1 || snakeY[firstIndex] >= RESOLUTION / 10 || snakeY[firstIndex] <= 1){
    return true;
  }else{
    return false;
  }
}