/// @desc 랭크 비교 후 잠금 값 변경


//인스턴스 삭제시 한번 전역 랭크값 변동
if ( global.RANK_STATE < 0 )
{
#region
	with( Rank_Base )
	{
		if ( global.RANK_STATE < Inst_Rank )
		{
			global.RANK_STATE = Inst_Rank;	
		}
	}
#endregion
}


//전역 랭크값과 인스턴스의 랭크값을 비교해서 잠금 값 변동
Lock = (global.RANK_STATE <= Inst_Rank );


