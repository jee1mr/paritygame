mat = [ [0,0,0,0,0], [0,0,0,0,0], [0,0,0,0,0], [0,0,0,0,0], [0,0,0,0,0] ]

gameCount = 0;
playerTurn = 1;

void draw()
{ 
    background(255); 

    W = (window.innerWidth > 0) ? window.innerWidth : screen.width;
    H = (window.innerHeight > 0) ? window.innerHeight : screen.height;

    size( W, H ) ;

    sz = min( W, H ) ;

    cellSZ = sz/5 ;

    gapW = 0 ;
    gapH = 0 ;

    if( W > H ) gapW = ( W- H ) / 2 ;
    else gapH = ( H - W ) / 2 ;

    strokeWeight( 5 );

    for( var indI=1, i=gapW+cellSZ/2; indI<5 ; i+=cellSZ, indI++ )
    {
        for (var indJ=1, j=gapH+cellSZ/2; indJ<5 ; j+=cellSZ, indJ++ )
        {
            if( mat[indI][indJ] ) 
                fill( 102,51,102 ) ;
            else 
                fill( 255 );
            rect( i, j, cellSZ, cellSZ ) ;
        }
    }

    if(gameCount==16)
    {   

        fill(255);
        
        var s1=' GAME';
        var s2=' OVER';
        textSize(0.8*cellSZ);
        //textAlign(CENTER);

        var j = gapH + cellSZ/2 + 2*cellSZ ;
        for( var indI=1, i = gapW + cellSZ/2; indI < 5 ; indI++, i+=cellSZ )
        {
            text(s1[indI],i+cellSZ/5,j-cellSZ/5);
        }

        var j = gapH + cellSZ/2 + 3*cellSZ ;
        for( var indI=1, i = gapW + cellSZ/2; indI < 5 ; indI++, i+=cellSZ )
        {
            text(s2[indI],i+cellSZ/5,j-cellSZ/5);
        }
    }

    noLoop();
    // player name To be Implemented
}

void mouseClicked()
{    
    x = parseInt( 1+ ( mouseX-gapW-cellSZ/2 )/cellSZ ) ;
    y = parseInt( 1+ ( mouseY-gapH-cellSZ/2 )/cellSZ ) ;

    if ( x < 1 || x > 4 || y < 1 || y > 4 || mat[x][y] )
        return;

    mat[x][y]=1;

    gameCount++;

    playerTurn = (playerTurn)%2+1;

    redraw();
}

public void resizeSketch()
{
    redraw();
}
