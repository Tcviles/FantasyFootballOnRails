Player.update_players
@user = User.create(:email=> "test@aol.com", password: "12345678")

@league = League.create(:name=>"testleague")

@mascot = Mascot.create(:name=>"testmascot", color:"test", motto:"testing!testing!")

@team = Team.new(:name => "testteam")
@team.league = @league
@team.user = @user
@team.player_ids = [4,8,15,16,23]
@team.mascot = @mascot
@team.save
