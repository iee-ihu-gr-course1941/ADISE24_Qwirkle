var me={};
var game_status={};
var timer = null;

$(function (){
    draw_empty_board();
    fill_board();
    $('#qwirkle_reset').click(reset_board);
    $('#qwirkle_login').click(login_to_game);
	$('#move_div').hide();
	$('#do_move').click(do_move);
}
)

function draw_empty_board() {
    var t='<table id="qwirkle_table">';
    for(var i=1;i<9;i++) {
        t += '<tr>';
        for(var j=1;j<9;j++) {
            t += '<td class="qwirkle_square"id="square_'+j+'_'+i+'">' + j +','+i+'</td>';
            }
            t+='</tr>';
    }
    t+='</table>';
    $('#qwirkle_board').html(t);
}

function fill_board() {
    $.ajax(
        {url: "qwirkle.php/board/",
        success: fill_board_by_data
        }
        );
}

function reset_board() {
    $.ajax(
        {url: "qwirkle.php/board/",
        method: 'post',
        success: fill_board_by_data
        }
        );
}

function fill_board_by_data(data) {
	for(var i=0;i<data.length;i++) {
		var o = data[i];
		var id = '#square_'+ o.x +'_' + o.y;
		var c = (o.piece!=null)?o.piece_color + '_' + o.piece:'';
		var im = (o.piece!=null)?'<img class="piece '+'" src="images/'+c+'.png">':'';
		$(id).addClass(o.b_color+'_square').html(im);
	}
}

function login_to_game() {
	if($('#username').val()=='') {
		alert('You have to set a username');
		return;
	}
	var p_color = $('#pcolor').val();
	draw_empty_board(p_color);
	fill_board();

	$.ajax({url: "qwirkle.php/players/"+p_color, 
			method: 'PUT',
			dataType: "json",
			headers: {"X-Token": me.token},
			contentType: 'application/json',
			data: JSON.stringify( {username: $('#username').val(), piece_color: p_color}),
			success: login_result,
			error: login_error});

}

function login_result(data) {
	me = data[0];
	$('#game_initializer').hide();
	update_info();
	game_status_update();
}

function login_error(data,y,z,c) {
	var x = data.responseJSON;
	alert(x.errormesg);
}

function update_info(){
	$('#game_info').html("I am Player: "+me.piece_color+", my name is "+me.username +'<br>Token='+me.token+'<br>Game state: '+game_status.status+', '+ game_status.p_turn+' must play now.');
	
	
}

function game_status_update() {
	
	clearTimeout(timer);
	$.ajax({url: "qwirkle.php/status/", success: update_status,headers: {"X-Token": me.token} });
}

function update_status(data) {
	last_update=new Date().getTime();
	var game_stat_old = game_status;
	game_status=data[0];
	update_info();
	clearTimeout(timer);
	
	if(game_status.p_turn==me.piece_color &&  me.piece_color!=null) {
		x=0;
		// do play
		if(game_stat_old.p_turn!=game_status.p_turn) {
			fill_board();
		}
		$('#move_div').show(1000);
		timer=setTimeout(function() { game_status_update();}, 15000);
	} else {
		// must wait for something
		$('#move_div').hide(1000);
		timer=setTimeout(function() { game_status_update();}, 4000);
	}
	
}

function do_move(){
	var s = $('#the_move').val();
	
	var b = s.trim().split(/[ ]+/);
	var a = s.trim().split(/[ ]+/);

	if($("#piece").find("option:selected").text() == "Blue 4pt Star"){
		a[2] = '4';
		a[3] = 'B';
	}
	if($("#piece").find("option:selected").text() == "Blue 8pt Star"){
		a[2] = '8';
		a[3] = 'B';
	}
	if($("#piece").find("option:selected").text() == "Blue Circle"){
		a[2] = 'C';
		a[3] = 'B';
	}
	if($("#piece").find("option:selected").text() == "Blue Clover"){
		a[2] = 'CL';
		a[3] = 'B';
	}
	if($("#piece").find("option:selected").text() == "Blue Diamond"){
		a[2] = 'D';
		a[3] = 'B';
	}
	if($("#piece").find("option:selected").text() == "Blue Square"){
		a[2] = 'S';
		a[3] = 'B';
	}

	if($("#piece").find("option:selected").text() == "Green 4pt Star"){
		a[2] = '4';
		a[3] = 'G';
	}
	if($("#piece").find("option:selected").text() == "Green 8pt Star"){
		a[2] = '8';
		a[3] = 'G';
	}
	if($("#piece").find("option:selected").text() == "Green Circle"){
		a[2] = 'C';
		a[3] = 'G';
	}
	if($("#piece").find("option:selected").text() == "Green Clover"){
		a[2] = 'CL';
		a[3] = 'G';
	}
	if($("#piece").find("option:selected").text() == "Green Diamond"){
		a[2] = 'D';
		a[3] = 'G';
	}
	if($("#piece").find("option:selected").text() == "Green Square"){
		a[2] = 'S';
		a[3] = 'G';
	}

	if($("#piece").find("option:selected").text() == "Orange 4pt Star"){
		a[2] = '4';
		a[3] = 'O';
	}
	if($("#piece").find("option:selected").text() == "Orange 8pt Star"){
		a[2] = '8';
		a[3] = 'O';
	}
	if($("#piece").find("option:selected").text() == "Orange Circle"){
		a[2] = 'C';
		a[3] = 'O';
	}
	if($("#piece").find("option:selected").text() == "Orange Clover"){
		a[2] = 'CL';
		a[3] = 'O';
	}
	if($("#piece").find("option:selected").text() == "Orange Diamond"){
		a[2] = 'D';
		a[3] = 'O';
	}
	if($("#piece").find("option:selected").text() == "Orange Square"){
		a[2] = 'S';
		a[3] = 'O';
	}

	if($("#piece").find("option:selected").text() == "Purple 4pt Star"){
		a[2] = '4';
		a[3] = 'P';
	}
	if($("#piece").find("option:selected").text() == "Purple 8pt Star"){
		a[2] = '8';
		a[3] = 'P';
	}
	if($("#piece").find("option:selected").text() == "Purple Circle"){
		a[2] = 'C';
		a[3] = 'P';
	}
	if($("#piece").find("option:selected").text() == "Purple Clover"){
		a[2] = 'CL';
		a[3] = 'P';
	}
	if($("#piece").find("option:selected").text() == "Purple Diamond"){
		a[2] = 'D';
		a[3] = 'P';
	}
	if($("#piece").find("option:selected").text() == "Purple Square"){
		a[2] = 'S';
		a[3] = 'P';
	}

	if($("#piece").find("option:selected").text() == "Red 4pt Star"){
		a[2] = '4';
		a[3] = 'R';
	}
	if($("#piece").find("option:selected").text() == "Red 8pt Star"){
		a[2] = '8';
		a[3] = 'R';
	}
	if($("#piece").find("option:selected").text() == "Red Circle"){
		a[2] = 'C';
		a[3] = 'R';
	}
	if($("#piece").find("option:selected").text() == "Red Clover"){
		a[2] = 'CL';
		a[3] = 'R';
	}
	if($("#piece").find("option:selected").text() == "Red Diamond"){
		a[2] = 'D';
		a[3] = 'R';
	}
	if($("#piece").find("option:selected").text() == "Red Square"){
		a[2] = 'S';
		a[3] = 'R';
	}

	if($("#piece").find("option:selected").text() == "Yellow 4pt Star"){
		a[2] = '4';
		a[3] = 'Y';
	}
	if($("#piece").find("option:selected").text() == "Yellow 8pt Star"){
		a[2] = '8';
		a[3] = 'Y';
	}
	if($("#piece").find("option:selected").text() == "Yellow Circle"){
		a[2] = 'C';
		a[3] = 'Y';
	}
	if($("#piece").find("option:selected").text() == "Yellow Clover"){
		a[2] = 'CL';
		a[3] = 'Y';
	}
	if($("#piece").find("option:selected").text() == "Yellow Diamond"){
		a[2] = 'D';
		a[3] = 'Y';
	}
	if($("#piece").find("option:selected").text() == "Yellow Square"){
		a[2] = 'S';
		a[3] = 'Y';
	}

	if(b.length!=2) {
		alert('Must give 2 numbers');
		return;
	}
	$.ajax({url: "qwirkle.php/board/piece/", 
			method: 'PUT',
			dataType: "json",
			contentType: 'application/json',
			data: JSON.stringify({x: b[0], y: b[1], piece: a[2], piece_color: a[3]}),
			headers: {"X-Token": me.token},
			success: move_result/*,
			error: function( xhr ) {
				var readyState = {
					1: "Loading",
					2: "Loaded",
					3: "Interactive",
					4: "Complete"
				};
				if(xhr.readyState !== 0 && xhr.status !== 0 && xhr.responseText !== undefined) {
					alert("readyState: " + readyState[xhr.readyState] + "\n status: " + xhr.status + "\n\n responseText: " + xhr.responseText);
				}
			}*/});
}

function move_result(data){
game_status_update();
fill_board_by_data(data);
}