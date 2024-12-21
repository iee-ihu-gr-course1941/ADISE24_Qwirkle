<?php

function show_board($input) {
	global $mysqli;
	
	$sql = 'select * from board';
	$st = $mysqli->prepare($sql);

	$st->execute();
	$res = $st->get_result();

	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function show_piece($x,$y) {
	global $mysqli;
	
	$sql = 'select * from board where x=? and y=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('ii',$x,$y);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function reset_board() {
	global $mysqli;
	$sql = 'call clean_board()';
	$mysqli->query($sql);
}

function move_piece($x,$y,$p,$c,$token) {

	if($token==null || $token=='') {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"token is not set."]);
		exit;
	}

	$color = current_color($token);
	if($color==null ) {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"You are not a player of this game."]);
		exit;
	}

	$status = read_status();
	if($status['status']!='started') {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"Game is not in action."]);
		exit;
	}
	if($status['p_turn']!=$color) {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"It is not your turn."]);
		exit;
	}

	if($p == "C")$p = 1;
	if($p == "4")$p = 2;
	if($p == "D")$p = 3;
	if($p == "S")$p = 4;
	if($p == "8")$p = 5;
	if($p == "CL")$p = 6;

	if($c == "R")$c = 1;
	if($c == "O")$c = 2;
	if($c == "Y")$c = 3;
	if($c == "G")$c = 4;
	if($c == "B")$c = 5;
	if($c == "P")$c = 6;
	
	$orig_board=read_board();
	$board=convert_board($orig_board);

	if(check_if_board_empty($board) == 0){
		do_move($x,$y,$p,$c);
	}
	else if(check_if_correct_color($board,$x,$y,$c) == 0){
		do_move($x,$y,$p,$c);
	}
	else if(check_if_correct_piece($board,$x,$y,$p) == 0){
		do_move($x,$y,$p,$c);
	}
}

function check_if_board_empty(&$board) {
	$found_piece=0;
	
	for($x=1;$x<9;$x++) {
		for($y=1;$y<9;$y++) {
			if($board[$x][$y]['piece'] != NULL){
				$found_piece = 1;
			}
		}
	}
	if($found_piece == 1){
		return(1);
	}
	else{
		return(0);
	}
}

function check_if_correct_color(&$board,$x,$y,$c){
	
	if($c == 1)$c = "R";
	if($c == 2)$c = "O";
	if($c == 3)$c = "Y";
	if($c == 4)$c = "G";
	if($c == 5)$c = "B";
	if($c == 6)$c = "P";

	$flag1=0;
	$flag2=0;
	$flag3=0;
	$flag4=0;

	$flag = 0;
	$x0=0;
	$y0=0;

	if($board[$x][$y]['piece'] != NULL)$flag=1;

	if($x!=8){
		if($board[$x+1][$y]['piece'] != NULL)$flag1=1;
	}
	if($x!=1){
		if($board[$x-1][$y]['piece'] != NULL)$flag2=1;
	}
	if($y!=8){
		if($board[$x][$y+1]['piece'] != NULL)$flag3=1;
	}
	if($y!=1){
		if($board[$x][$y-1]['piece'] != NULL)$flag4=1;
	}

	if($flag1 && $flag2 && $flag3 && $flag4)$flag=1;

	if($board[$x][$y]['piece'] == NULL && $x!=1){
		$x0=$x-1;
		$y0=$y;
		for($i=$x0;$i>1;$i--) {
			if($board[$i][$y0]['piece'] == NULL)break;
			else if($board[$i][$y0]['piece_color'] != $c)$flag=1;
		}
	}
	if($board[$x][$y]['piece'] == NULL && $x!=8){
		$x0=$x+1;
		$y0=$y;
		for($i=$x0;$i<8;$i++) {
			if($board[$i][$y0]['piece'] == NULL)break;
			else if($board[$i][$y0]['piece_color'] != $c)$flag=1;
		}
	}
	if($board[$x][$y]['piece'] == NULL && $y!=8){
		$x0=$x;
		$y0=$y+1;
		for($i=$y0;$i<8;$i++) {
			if($board[$x0][$i]['piece'] == NULL)break;
			else if($board[$x0][$i]['piece_color'] != $c)$flag=1;
		}
	}
	if($board[$x][$y]['piece'] == NULL && $y!=1){
		$x0=$x;
		$y0=$y-1;
		for($i=$y0;$i>1;$i--) {
			if($board[$x0][$i]['piece'] == NULL)break;
			else if($board[$x0][$i]['piece_color'] != $c)$flag=1;
		}
	}

	return($flag);
}

function check_if_correct_piece(&$board,$x,$y,$p){
	
	if($p == 1)$p = "C";
	if($p == 2)$p = "4";
	if($p == 3)$p = "D";
	if($p == 4)$p = "S";
	if($p == 5)$p = "8";
	if($p == 6)$p = "CL";

	$flag1=0;
	$flag2=0;
	$flag3=0;
	$flag4=0;

	$flag = 0;
	$x0=0;
	$y0=0;

	if($board[$x][$y]['piece'] != NULL)$flag=1;

	if($x!=8){
		if($board[$x+1][$y]['piece'] != NULL)$flag1=1;
	}
	if($x!=1){
		if($board[$x-1][$y]['piece'] != NULL)$flag2=1;
	}
	if($y!=8){
		if($board[$x][$y+1]['piece'] != NULL)$flag3=1;
	}
	if($y!=1){
		if($board[$x][$y-1]['piece'] != NULL)$flag4=1;
	}

	if($flag1 && $flag2 && $flag3 && $flag4)$flag=1;

	if($board[$x][$y]['piece'] == NULL && $x!=1){
		$x0=$x-1;
		$y0=$y;
		for($i=$x0;$i>1;$i--) {
			if($board[$i][$y0]['piece'] == NULL)break;
			else if($board[$i][$y0]['piece'] != $p)$flag=1;
		}
	}
	if($board[$x][$y]['piece'] == NULL && $x!=8){
		$x0=$x+1;
		$y0=$y;
		for($i=$x0;$i<8;$i++) {
			if($board[$i][$y0]['piece'] == NULL)break;
			else if($board[$i][$y0]['piece'] != $p)$flag=1;
		}
	}
	if($board[$x][$y]['piece'] == NULL && $y!=8){
		$x0=$x;
		$y0=$y+1;
		for($i=$y0;$i<8;$i++) {
			if($board[$x0][$i]['piece'] == NULL)break;
			else if($board[$x0][$i]['piece'] != $p)$flag=1;
		}
	}
	if($board[$x][$y]['piece'] == NULL && $y!=1){
		$x0=$x;
		$y0=$y-1;
		for($i=$y0;$i>1;$i--) {
			if($board[$x0][$i]['piece'] == NULL)break;
			else if($board[$x0][$i]['piece'] != $p)$flag=1;
		}
	}

	return($flag);
}

function do_move($x,$y,$p,$c) {
	global $mysqli;
	$sql = 'call `move_piece`(?,?,?,?);';
	$st = $mysqli->prepare($sql);
	$st->bind_param('iiii',$x,$y,$p,$c );
	$st->execute();

	header('Content-type: application/json');
	print json_encode(read_board(), JSON_PRETTY_PRINT);
}

function read_board() {
	global $mysqli;
	$sql = 'select * from board';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	return($res->fetch_all(MYSQLI_ASSOC));
}


function convert_board(&$orig_board) {
	$board=[];
	foreach($orig_board as $i=>&$row) {
		$board[$row['x']][$row['y']] = &$row;
	} 
	return($board);
}
?>