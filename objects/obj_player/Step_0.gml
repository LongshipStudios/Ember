//// Movement

//Move up key pressed?
upKeyPressed = keyboard_check(ord("W"));
	
//Move left key pressed?
leftKeyPressed = keyboard_check(ord("A"));
	
//Move down key pressed?
downKeyPressed = keyboard_check(ord("S"));
	
//Move right key pressed?
rightKeyPressed = keyboard_check(ord("D"));
	
var xDir = rightKeyPressed - leftKeyPressed;
var yDir = downKeyPressed - upKeyPressed;
	
if(upKeyPressed || leftKeyPressed || downKeyPressed || rightKeyPressed)
{
	moveDir = point_direction(0,0,xDir,yDir);
	
	xMove = lengthdir_x(spd,moveDir);
	yMove = lengthdir_y(spd,moveDir);
}
else
{
	moveDir = noone;
}

var bboxSide = 0;
	
if(xMove > 0) bboxSide = bbox_right; else bboxSide = bbox_left;
if(tilemap_get_at_pixel(tilemap_collision,bboxSide+xMove,bbox_top) != 0)
	
x += xMove;
y += yMove;