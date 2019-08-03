//// Movement

//Move up key pressed?
upKeyPressed = keyboard_check(ord("W"));
	
//Move left key pressed?
leftKeyPressed = keyboard_check(ord("A"));
	
//Move down key pressed?
downKeyPressed = keyboard_check(ord("S"));
	
//Move right key pressed?
rightKeyPressed = keyboard_check(ord("D"));

//Get the x and y motion directions from input
var xDir = rightKeyPressed - leftKeyPressed;
var yDir = downKeyPressed - upKeyPressed;

//If we have inputs
if(upKeyPressed || leftKeyPressed || downKeyPressed || rightKeyPressed)
{
	//Get the combined direction and assign movement values based on that
	moveDir = point_direction(0,0,xDir,yDir);
	
	lightOn = false;
	
	xMove = round(lengthdir_x(spd,moveDir));
	yMove = round(lengthdir_y(spd,moveDir));
}
else
{
	//If there are no inputs, we aren't moving
	moveDir = noone;
	
	xMove = 0;
	yMove = 0;
	
	lightOn = true;
}

//Do move
scr_move_collide();