draw_self();

///////Light
if( !surface_exists(surf) ){
    surf = surface_create(room_width,room_height);
}

//New lighting system! Old one's down below if we need to resurrect it.
surface_set_target(surf);
draw_set_color(c_black);
draw_rectangle(0,0,room_width,room_height,false);
surface_reset_target();

scr_render_light_rad(x,y,rad);

scr_render_light_rad(50,50,100);

draw_set_alpha(1);
draw_surface(surf,0,0);
//draw_surface_ext(surf,0,0,1,1,0,0,1);

/**
var lx = x;
var ly = y;
var tileSize = 32;
var tilemap = tilemap_shadowcaster;

var startx = floor((lx-rad)/tileSize);
var endx = floor((lx+rad)/tileSize);
var starty = floor((ly-rad)/tileSize);
var endy = floor((ly+rad)/tileSize);

surface_set_target(surf);
draw_clear_alpha(0,0);

vertex_begin(VBuffer, VertexFormat);
for(var yy=starty;yy<=endy;yy++)
{
    for(var xx=startx;xx<=endx;xx++)
    {
        var tile = tilemap_get(tilemap,xx,yy);
        if( tile!=0 )
        {
            // get corners of the 
            var px1 = xx*tileSize;     // top left
            var py1 = yy*tileSize;
            var px2 = px1+tileSize;    // bottom right
            var py2 = py1+tileSize;


            if( !src_sign_test( px1,py1, px2,py1, lx,ly) ){
				scr_light_shadow(VBuffer,  px1,py1, px2,py1, lx,ly );
		    }
		    if( !src_sign_test( px2,py1, px2,py2, lx,ly) ){
		        scr_light_shadow(VBuffer,  px2,py1, px2,py2, lx,ly );
		    }
		    if( !src_sign_test( px2,py2, px1,py2, lx,ly) ){
		        scr_light_shadow(VBuffer,  px2,py2, px1,py2, lx,ly );
		    }
		    if( !src_sign_test( px1,py2, px1,py1, lx,ly) ){
		        scr_light_shadow(VBuffer,  px1,py2, px1,py1, lx,ly );                      
		    }                 
        }
    }
}
vertex_end(VBuffer);    
vertex_submit(VBuffer,pr_trianglelist,-1);
surface_reset_target();

shader_set(shd_light);
shader_set_uniform_f( LightPosRadius, lx,ly,rad,0.0 );

//draw_circle_colour(lx,ly,rad, c_orange, c_black, false);
draw_surface_ext(surf,0,0,1,1,0,0,0.0000001);
shader_reset();

draw_self();