// Movement

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
	
		x += xMove;
		y += yMove;
	}
	else
	{
		moveDir = noone;
	}