//The object that runs this script MUST have xMove and yMove

y += yMove;

//vertical motion
if(yMove > 0) //downwards movement
{        
	//       Gets whether we are colliding or not                            Gets rid of unnecessary tile information (dark magic)
	var t1 = tilemap_get_at_pixel(tilemap_collision, bbox_left, bbox_bottom) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap_collision, bbox_right, bbox_bottom) & tile_index_mask; //Two point collision
	
	//If either of our two collision points got a hit
	if(t1 != 0 || t2 != 0)
	{   //Uses the dark arts of binary math to snap us back to the grid
		y = ((bbox_bottom & ~31) - 1) - sprBBoxBottom;
		yMove = 0;
	}
}
else //upwards movement
{
	//Same thing, but up
	var t1 = tilemap_get_at_pixel(tilemap_collision, bbox_left, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap_collision, bbox_right, bbox_top) & tile_index_mask; 
	
	if(t1 != 0 || t2 != 0)
	{
		y = ((bbox_top + 32) & ~31) - sprBBoxTop;
		yMove = 0;
	}
}

x += xMove;

//horizontal motion (same thing, but left and right
if(xMove > 0) //rightwards movement
{   
	var t1 = tilemap_get_at_pixel(tilemap_collision, bbox_right, bbox_bottom) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap_collision, bbox_right, bbox_top) & tile_index_mask;
	
	if(t1 != 0 || t2 != 0)
	{
		x = ((bbox_right & ~31) - 1) - sprBBoxRight;
		xMove = 0;
	}
}
else //leftwards movement
{
	var t1 = tilemap_get_at_pixel(tilemap_collision, bbox_left, bbox_bottom) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap_collision, bbox_left, bbox_top) & tile_index_mask; 
	
	if(t1 != 0 || t2 != 0)
	{
		x = ((bbox_left + 32) & ~31) - sprBBoxLeft;
		xMove = 0;
	}
}