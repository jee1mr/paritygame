// Global variables
float radius = 50.0;
int X, Y;
int nX, nY;
int delay = 1;

// Setup the Processing Canvas
void setup(){
  gameCount = 0;
  background(255);
  playerTurn = 1;
  frameRate( 15 );
  var deviceWidth = (window.innerWidth > 0) ? window.innerWidth : screen.width;
  var deviceHeight = (window.innerHeight > 0) ? window.innerHeight : screen.height;
  size( deviceWidth, deviceHeight );
  console.log(deviceWidth,deviceHeight);
  gap = deviceWidth<deviceHeight ? deviceWidth/5:deviceHeight/5;
  diffW = max(0,deviceWidth-deviceHeight);
  diffH = max(0,deviceHeight-deviceWidth);
  strokeWeight( max(diffW,diffH)/80 );
  console.log(gap);



  for( var i= gap/2; i< 4*gap; i=i+gap)
  {
    for (var j = gap/2; j < 4*gap ; j=j+gap)
    { 
      rect(i+diffW/2,j+diffH/2,gap,gap);
    }
  }


  /*if(diffW)
  {
    textSize(gap/5);
    fill(255,0,0);
    text("Player 1:",(gap+diffW)/4,gap)
    text("Player 2:",(gap+diffW)/2+gap*4+diffW/4,gap);
    fill(0);
    //text("Your Turn",(gap+diffW)/4,gap/2);

  }

  else{
    textSize(gap/5);
    fill(255,0,0);
    text("Player 1:",gap,(gap+diffH)/4);
    text("Player 2:",gap,(gap+diffH)/2+gap*4+diffH/4);
    fill(0);
    text("Your Turn",gap/2,(gap+diffH)/4);

  }*/



}

// Set circle's next destination
void mouseMoved(){
  nX = mouseX;
  nY = mouseY;  
}


void mouseClicked(){

  /*gap = deviceWidth<deviceHeight ? deviceWidth/5:deviceHeight/5;
  diffW = max(0,deviceWidth-deviceHeight);
  diffH = max(0,deviceHeight-deviceWidth);
  */
  nX = parseInt( 1+(nX-(gap+diffW)/2)/gap ) ;
  nY = parseInt( 1+(nY-(gap+diffH)/2)/gap ) ;

textSize(gap/2);
fill(0,0,255);
if (nX > 0 && nX <= 4  && nY > 0 && nY <= 4 )
{

  gameCount++;
  text("1",nX*gap+diffW/2-gap/5,nY*gap+diffH/2+gap/5);


  playerTurn = (playerTurn)%2+1;
  console.log("Now it's Player " + playerTurn + "'s turn");
  
    
 /* if(diffW)
  {
    textSize(gap/5);
    fill(0);
    
    if(playerTurn==1)
    {
      text("Your Turn",(gap+diffW)/4,gap/2);
      fill(255);
      noStroke();
      rect((gap+diffW)/2+gap*4+diffW/4,gap/3,gap,gap/5);
    }
    else
    {
      text("Your Turn",(gap+diffW)/2+gap*4+diffW/4,gap/2);
      fill(255);
      noStroke();
      rect((gap+diffW)/4,gap/3,gap,gap/5);
    }

  }
  

  else
  {
    textSize(gap/5);
    fill(0);
    if(playerTurn==1)
    {
      text("Your Turn",gap/2,(gap+diffH)/4);
      fill(0);
      noStroke();
      rect((gap+diffH)/2+gap*4+diffH/4,gap/3,gap,gap/5);
    }
    else
    {
      text("Your Turn",gap/2,(gap+diffH)/2+gap*4+diffH/4);
      fill(0);
      noStroke();
      rect((gap+diffH)/4,gap/3,gap,gap/5);
    }

  }
*/


 if(gameCount==16)
  {
    fill(255,0,0);
    textSize(gap/2);
    text("GAME OVER!",500,200)
  }

}

}






void draw()
{
   //To avoid p.draw is not a function Error
}



void touchMove(TouchEvent touchEvent) {
// empty the canvas
noStroke();
fill(255);
rect(0, 0, 400, 300);
 
// draw circles at where fingers touch
fill(180, 180, 100);
for (int i = 0; i < touchEvent.touches.length; i++) {
int x = touchEvent.touches[i].offsetX;
int y = touchEvent.touches[i].offsetY;
ellipse(x, y, 50, 50);
}
}
 
