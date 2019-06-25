fe.layout.width =  320;
fe.layout.height = 240;

fe.load_module("animate");

local clock = fe.add_text( "", 0, 0, 320, 120 );
clock.align = Align.Centre;
//clock.align = Align.TopCentre;
clock.charsize = 70;
clock.set_rgb( 255, 255, 255 );
clock.set_bg_rgb( 100, 10, 2 );
clock.font="ARCADE";
//clock.font="ARCADECLASSIC";


class sonicAni
{
	obj=0;
	obj_config=0;
	constructor()
	{
		obj = fe.add_image("sonic.gif", 0, 170, 40, 40 );
		obj_config = {
			when = Transition.StartLayout,
			property = "position",  
			start = { x = 0, y = 170 }, 
			end = { x = 280, y = 170 }, 
			restart = true, 
			loop = true,
			delay  = 10,
			tween = Tween.Bounce, 
			time = 5000
		}
		animation.add( PropertyAnimation( obj, obj_config ) );
		obj.visible = false;
		obj.video_playing = false;
	}
	function stop()
	{
		obj.visible = false;
		obj.video_playing = false;
	}
	function play( )
	{
		obj.visible = true;
		obj.video_playing = true;
	}
}

class marioAni
{
	obj=0;
	obj_config=0;
	constructor()
	{
		obj = fe.add_image("mario.gif", 120, 100, 100, 100 );
		obj.visible = false;
		obj.video_playing = false;		
	}
	function stop()
	{
		obj.visible = false;
		obj.video_playing = false;
	}
	function play( )
	{
		obj.visible = true;
		obj.video_playing = true;
	}
}

class kirbyAni
{
	obj=0;
	obj_config=0;
	constructor()
	{
		obj = fe.add_image("kirby.gif", 30, 100, 200, 100 );
		obj.visible = false;
		obj.video_playing = false;		
	}
	function stop()
	{
		obj.visible = false;
		obj.video_playing = false;
	}
	function play( )
	{
		obj.visible = true;
		obj.video_playing = true;
	}
}

class zeldaAni
{
	obj=0;
	obj_config=0;
	constructor()
	{
		obj = fe.add_image("zelda.gif", 120, 120, 100, 100 );
		obj.visible = false;
		obj.video_playing = false;		
	}
	function stop()
	{
		obj.visible = false;
		obj.video_playing = false;
	}
	function play( )
	{
		obj.visible = true;
		obj.video_playing = true;
	}
}

local modes = [];
modes.append( sonicAni() ); 
modes.append( marioAni() );
modes.append( kirbyAni() );
modes.append( zeldaAni() );
modes.append( sonicAni() ); 
modes.append( marioAni() );


local clockAni = modes[0];

local isPlay = false;

function update_clock( ttime )
{
	local now = date();
	//clock.msg = format("%02d", now.hour) + ":" + format("%02d", now.min ) + ":" + format("%02d", now.sec );
	clock.msg = "" + format("%02d", now.hour) + ":" + format("%02d", now.min ) + ":" + format("%02d", now.sec );

	local sec =  format("%02d", now.sec ).tointeger();
	local min =  format("%02d", now.sec ).tointeger();
	
	if( sec%10 == 0 && isPlay == false )
	{
		clockAni.stop();
		//clockAni = modes[rand()%modes.len()];
		clockAni = modes[ sec/10 ];
		clockAni.play();
		isPlay = true;
	}	

	if( sec%2 == 1 && isPlay == true )
	{
		isPlay = false;
	}
	
}

fe.add_ticks_callback( this, "update_clock" );
/*
    Linear = "linear",
    Cubic = "cubic",
    Quad = "quad",
    Quart = "quart",
    Quint = "quint",
    Sine = "sine",
    Expo = "expo",
    Circle = "circle",
    Elastic = "elastic",
    Back = "back",
    Bounce = "bounce"

*/



