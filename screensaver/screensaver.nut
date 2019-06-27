


class UserConfig { 
	</ label="시계 or 앨범액자", help="시계 or 앨범액자", options="CLOCK,ALBUM", order=0 /> screenType="CLOCK";
	</ label="Ani GIf or 앨범액자 변경주기(분)", help="Ani GIf or 앨범액자 변경주기(분)", options="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59", order=1 /> cycleTime=1;
	</ label="======================================", order=2 /> tmp1="-";
	</ label="년월일 font size", help="년월일 font size", options="20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70", order=3 /> ymd_size=29;
	</ label="년월일 Text Red(R) (0-255) Color", help="년월일 Text Red(R) (0-255) Color", option="47", order=4 /> ymd_red=47;
	</ label="년월일 Text Green(G) (0-255) Color", help="년월일 Text Green(G) (0-255) Color", option="157", order=5 /> ymd_green=157;
	</ label="년월일 Text Blue(B) (0-255) Color", help="년월일 Text Blue(B) (0-255) Color", option="39", order=6 />  ymd_blue=39;
	</ label="======================================", order=7 /> tmp2="-";
	</ label="시계 font size", help="시계 font size", options="20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70", order=8 /> clock_size=69;
	</ label="시계 Text Red(R) (0-255) Color", help="시계 Text Red(R) (0-255) Color", option="47", order=9 /> clock_red=47;
	</ label="시계 Text Green(G) (0-255) Color", help="시계 Text Green(G) (0-255) Color", option="157", order=10 /> clock_green=157;
	</ label="시계 Text Blue(B) (0-255) Color", help="시계 Text Blue(B) (0-255) Color", option="39", order=11 />  clock_blue=39;
	</ label="======================================", order=12 /> tmp3="-";
	</ label="Custom 텍스트 문구", help="Custom 텍스트 문구", option="Nintendo", order=13 /> custom_text="Nintendo";
	</ label="Custom font size", help="Custom font size", options="20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70", order=14 /> custom_size=30;
	</ label="Custom Text Red(R) (0-255) Color", help="Custom Text Red(R) (0-255) Color", option="47", order=15 /> custom_red=47;
	</ label="Custom Text Green(G) (0-255) Color", help="Custom Text Green(G) (0-255) Color", option="157", order=16 /> custom_green=157;
	</ label="Custom Text Blue(B) (0-255) Color", help="Custom Text Blue(B) (0-255) Color", option="39", order=17 />  custom_blue=39;
}

local my_config = fe.get_config();

fe.layout.width =  320;
fe.layout.height = 240;

fe.load_module("animate");
fe.load_module("file");

local playCycleTime = abs(("0"+my_config["cycleTime"]).tointeger());

function random_file(path) 
{
	local dir = DirectoryListing( path );
	local dir_array = [];
	local filename;
	foreach ( f in dir.results )
	{
		/* 
		if(f.find(".png")!= null )
		{
			dir_array.append(f);
		}
		*/
		dir_array.append(f);
		
	}
	
	return dir_array[ rand()%dir_array.len()];
}
	 
	 
if( my_config["screenType"] == "CLOCK" )
{

	local yyyymmdd = fe.add_text( "", 0, 0, 302, 40 );
	yyyymmdd.align = Align.Right;
	yyyymmdd.charsize = abs(("0"+my_config["ymd_size"]).tointeger());		
	yyyymmdd.set_rgb( abs(("0"+my_config["ymd_red"]).tointeger()), abs(("0"+my_config["ymd_green"]).tointeger()), abs(("0"+my_config["ymd_blue"]).tointeger()) );
	yyyymmdd.font="YYYYMMDD";
	//yyyymmdd.set_bg_rgb(231,231,231);
	//yyyymmdd.set_pos(83,0);
	//yyyymmdd.font="DigitalDismay";

	local clock = fe.add_text( "", 0, 0, 320, 120 );
	clock.align = Align.Centre;
	//clock.align = Align.Left;
	//clock.align = Align.TopCentre;
	clock.charsize = abs(("0"+my_config["clock_size"]).tointeger());
	clock.set_rgb( abs(("0"+my_config["clock_red"]).tointeger()), abs(("0"+my_config["clock_green"]).tointeger()), abs(("0"+my_config["clock_blue"]).tointeger()) );
	//clock.set_bg_rgb( 100, 10, 2 );
	clock.font="CLOCK";
	//clock.font="ARCADECLASSIC";
	

	local nintendoLogo = fe.add_text( my_config["custom_text"], 0, 95, 320, 40 );
	nintendoLogo.align = Align.Centre;
	nintendoLogo.charsize = abs(("0"+my_config["custom_size"]).tointeger());
	nintendoLogo.set_rgb( abs(("0"+my_config["custom_red"]).tointeger()), abs(("0"+my_config["custom_green"]).tointeger()), abs(("0"+my_config["custom_blue"]).tointeger()) );
	nintendoLogo.font="CUSTOM";

	local imageView = fe.add_image( random_file("./gif"), 0,140,320,90);
	imageView.preserve_aspect_ratio = true;
	
	local usePlay = false;
	local initPlay = false;
		
	function update_clock( ttime )
	{
		local now = date();
		local min =  format("%02d", now.min ).tointeger();
		local sec =  format("%02d", now.sec ).tointeger();
		local week = "";
		switch( now.wday )
		{
			case 0:	week = "Sun";	break;
			case 1:	week = "Mon";	break;
			case 2:	week = "Tue";	break;
			case 3:	week = "Wed";	break;
			case 4:	week = "Thu";	break;
			case 5:	week = "Fri";	break;
			case 6:	week = "Sat";	break;
			default:	week = "-"	;	break;
			
		}
		clock.msg = "" + format("%02d", now.hour) + ":" + format("%02d", now.min ) + ":" + format("%02d", now.sec );
		//clock.msg = "" + "00" + ":" + "00" + ":" + "00";
		yyyymmdd.msg = format("%04d", now.year) + "/" + format("%02d", now.month+1 ) + "/" + format("%02d", now.day ) + "/" + week ;

		if( initPlay == false )
		{
			imageView.file_name = random_file("./gif");
			usePlay = true;
			initPlay = true;
		}
		
		if( min%playCycleTime == 0 && sec == 0 && usePlay == false )
		{
			imageView.file_name = random_file("./gif");
			usePlay = true;
		}	

		if( min%playCycleTime == 0 && sec == 1 && usePlay == true )
		{
			usePlay = false;
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


}


if( my_config["screenType"] == "ALBUM" )
{
	local clock = fe.add_text( "", 0, 0, 320, 120 );
	
	local imageView = fe.add_image( random_file("./album"), 0,0,320,240);
	imageView.preserve_aspect_ratio = true;
	
	local usePlay = false;
	local initPlay = false;
	
	function update_clock( ttime )
	{
		local now = date();
		local min =  format("%02d", now.min ).tointeger();
		local sec =  format("%02d", now.sec ).tointeger();
		clock.msg = "";
		
		if( initPlay == false )
		{
			imageView.file_name = random_file("./album");
			usePlay = true;
			initPlay = true;
		}
		
		if( min%playCycleTime == 0 && sec == 0 && usePlay == false )
		{
			imageView.file_name = random_file("./album");
			usePlay = true;
		}
		if( min%playCycleTime == 0 && sec == 1 && usePlay == true )
		{
			usePlay = false;
		}
		
	}
	fe.add_ticks_callback( this, "update_clock" );
	
}
