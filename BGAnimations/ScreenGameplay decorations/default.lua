local t = LoadFallbackB()


local customscore=GetCustomScoreMode();
 local cscore="SuperNOVA2";
 if not GAMESTATE:IsCourseMode() then
 local stepcnt={0,0}
 t[#t+1] = Def.Actor{
     JudgmentMessageCommand = function(self, params)
		if STATSMAN:GetCurStageStats():GetPlayerStageStats(params.Player):GetFailed() == false then
         if params.TapNoteScore and
          params.TapNoteScore ~= 'TapNoteScore_AvoidMine' and
          params.TapNoteScore ~= 'TapNoteScore_HitMine' and
          params.TapNoteScore ~= 'TapNoteScore_CheckpointMiss' and
          params.TapNoteScore ~= 'TapNoteScore_CheckpointHit' and
          params.TapNoteScore ~= 'TapNoteScore_None'
         then
             if customscore=="old" then
                 Scoring[scoreType](params, 
                     STATSMAN:GetCurStageStats():GetPlayerStageStats(params.Player))
             elseif customscore=="5b2" then
                 local pn=((params.Player==PLAYER_1) and 1 or 2);
                 stepcnt[pn]=stepcnt[pn]+1;
                 CustomScore_SM5b2(params,cscore,GAMESTATE:GetCurrentSteps(params.Player),stepcnt[pn]);
             elseif customscore=="5b1" then
                 local pn=((params.Player==PLAYER_1) and 1 or 2);
                 stepcnt[pn]=stepcnt[pn]+1;
                 CustomScore_SM5b1(params,cscore,GAMESTATE:GetCurrentSteps(params.Player),stepcnt[pn]);
             else
                 local pn=((params.Player==PLAYER_1) and 1 or 2);
                 stepcnt[pn]=stepcnt[pn]+1;
                 CustomScore_SM5a2(params,cscore,GAMESTATE:GetCurrentSteps(params.Player),stepcnt[pn]);
             end;
         end
		 end
     end;
     InitCommand=function(self)
         if customscore=="non" then
             CustomScore_SM5a2_Init();
         end;
     end;
     OffCommand=function(self)
         if customscore=="non" then
             CustomScore_SM5a2_Out();
         end;
     end;
 };
 end;
 

t[#t+1] = LoadActor("OptionsHack.lua")..{
	InitCommand=cmd(draworder,1);
};



if ReadPrefFromFile("UserPrefGameplayShowFastSlow") ~= nil then
	if GetUserPrefB("UserPrefGameplayShowFastSlow") then
		t[#t+1] = LoadActor("TimingJudgements.lua")..{
			InitCommand=cmd(draworder,1);
		};
	end
end

--Song Options 

t[#t+1] = Def.BitmapText {
		Font = "Common Condensed",
		InitCommand=cmd(draworder,5;shadowlengthy,1;horizalign,left;x,Center1Player() and SCREEN_CENTER_X-143 or SCREEN_CENTER_X-516;y,648;zoom,0.5;diffusealpha,0;sleep,2;linear,0.5;diffusealpha,0.5;),
		OnCommand=function(self)
			self:settext(GAMESTATE:GetPlayerState(1):GetPlayerOptionsString(0))
			end;		
		};

t[#t+1] = Def.BitmapText {
		Font = "Common Condensed",
		InitCommand=cmd(draworder,5;shadowlengthy,1;horizalign,left;x,Center1Player() and SCREEN_CENTER_X-225 or SCREEN_CENTER_X-600;y,648;zoom,0.5;diffusealpha,0;sleep,2;linear,0.5;diffusealpha,0.75;),
		OnCommand=function(self)
			self:settext("Song Options:")
			end;	
		};
		

t[#t+1] = LoadActor("ScoreDispay")..{
	InitCommand=cmd(visible,ThemePrefs.Get("TargetScore") == "On" and ThemePrefs.Get("NowPlayingOverlay") == "On";bob;effectmagnitude,0,4,0;effecttiming,4,0,4,0;);
	OnCommand=cmd(heartbeat;effectclock,'beat';effectmagnitude,1.0,1.01,1.0;diffusealpha,0;zoom,Center1Player() and 1 or 1;rotationy,Center1Player() and -25 or 0;fov,Center1Player() and 40 or 0;y,Center1Player() and SCREEN_CENTER_Y or SCREEN_CENTER_Y;x,Center1Player() and 275 or 620;addx,-200;sleep,5;decelerate,1;addx,200;diffusealpha,1;);
};

t[#t+1] = LoadActor("ScoreDispay")..{
	InitCommand=cmd(visible,ThemePrefs.Get("TargetScore") == "On" and ThemePrefs.Get("NowPlayingOverlay") == "Off";);
	OnCommand=cmd(heartbeat;effectclock,'beat';effectmagnitude,1.0,1.01,1.0;diffusealpha,0;zoom,Center1Player() and 1 or 0.7;rotationy,Center1Player() and -25 or 0;fov,Center1Player() and 40 or 0;y,Center1Player() and SCREEN_CENTER_Y or SCREEN_CENTER_Y+240;x,Center1Player() and 275 or 642;addx,-200;sleep,5;decelerate,1;addx,200;diffusealpha,1;);
};


--JacketBG
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(visible,ThemePrefs.Get("NowPlayingOverlay") == "On";bob;effectmagnitude,0,4,0;effecttiming,4,0,4,0;);
	LoadActor("cd")..{
	InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X+585 or SCREEN_CENTER_X+510;fov,40;rotationy,25;y,SCREEN_CENTER_Y;zoom,Center1Player() and 0.75 or 1.1;diffusealpha,0;heartbeat;effectclock,'beat';effectmagnitude,1.0,1.01,1.0;);
	OnCommand=cmd(addx,-100;sleep,5;decelerate,1;addx,-100;diffusealpha,1);
};
};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(visible,ThemePrefs.Get("NowPlayingOverlay") == "Off");
	LoadActor("smallmusic")..{
	InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X+375 or SCREEN_CENTER_X;fov,Center1Player() and 40 or 0;rotationy,Center1Player() and 25 or 0;y,Center1Player() and SCREEN_CENTER_Y-10 or SCREEN_CENTER_Y+312;zoom,Center1Player() and 0.75 or 0.5;diffusealpha,0;heartbeat;effectclock,'beat';effectmagnitude,1.0,1.01,1.0;);
	OnCommand=cmd(addx,100;sleep,5;decelerate,1;addx,-100;diffusealpha,1);
};
};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(draworder,1);
	StandardDecorationFromFileOptional("ScoreFrameP1","ScoreFrameP1");
	StandardDecorationFromFileOptional("StageFrame","StageFrame");
	StandardDecorationFromFileOptional("StageDisplay","StageDisplay");
	StandardDecorationFromFileOptional("SongTitle","SongTitle");
};

	t[#t+1] = LoadFont("Common Normal") .. {
	Text=PROFILEMAN:GetProfile(PLAYER_1):GetDisplayName();
	InitCommand=cmd(shadowlengthy,2;maxwidth,300;zoom,0.75;x,SCREEN_CENTER_X+170;y,SCREEN_BOTTOM-35;draworder,5;addy,100;);
	OnCommand=cmd(decelerate,2;addy,-100;);
	};
	
	t[#t+1]=LoadFont("Common Normal") .. {
	Text=THEME:GetString("CustomDifficulty",ToEnumShortString(GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty()));
	InitCommand=cmd(maxwidth,240;shadowlengthy,2;zoom,0.75;x,SCREEN_CENTER_X-190;y,SCREEN_BOTTOM-35;draworder,5;addy,100;diffuse,CustomDifficultyToColor( ToEnumShortString(GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty()) ));
	OnCommand=cmd(decelerate,2;addy,-100;);
	};
	
	t[#t+1]=LoadFont("Common Normal") .. {
	Text=GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter();
	InitCommand=cmd(maxwidth,240;shadowlengthy,2;zoom,0.75;x,SCREEN_CENTER_X-140;y,SCREEN_BOTTOM-35;draworder,5;addy,100;);
	OnCommand=cmd(decelerate,2;addy,-100;);
	};


return t