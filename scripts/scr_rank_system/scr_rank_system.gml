// 랭크 시스템 스크립트 ( 최종수정일 2021 - 02 - 07 )


/* 랭크 시스템 전역 변수 선언 */
global.RANK_STATE = 1;



/// @function instance_create_layer_rank( x , y , layer_id_or_name , obj , rank )
/// @desc 랭크 인스턴스 생성 ( 레이어 )
/// @arg x			x좌표
/// @arg y			y좌표
/// @arg layer_id	생성할 레이어
/// @arg obj		생성할 오브젝트
/// @arg Rank		랭크


function instance_create_layer_rank( _x , _y , layer_id_or_name , obj , rank ){
	
	with ( instance_create_layer( _x , _y , layer_id_or_name , obj ) )
	{
		Inst_Rank = rank;
		
		if ( global.RANK_STATE < Inst_Rank )
		{
			global.RANK_STATE = Inst_Rank;	
		}
		
		return id;
	}
	
}



/// @function instance_create_depth_rank( x , y , depth , obj , rank )
/// @desc 랭크 인스턴스 생성 ( 깊이 )
/// @arg x x좌표
/// @arg y y좌표
/// @arg depth 생성할 깊이
/// @arg obj 생성할 오브젝트
/// @arg Rank 랭크


function instance_create_depth_rank( _x , _y , _depth , obj , rank ){
	
	with ( instance_create_depth( _x , _y , _depth , obj ) )
	{
		Inst_Rank = rank;
		
		if ( global.RANK_STATE < Inst_Rank )
		{
			global.RANK_STATE = Inst_Rank;	
		}
		
		return id;
	}
	
}

