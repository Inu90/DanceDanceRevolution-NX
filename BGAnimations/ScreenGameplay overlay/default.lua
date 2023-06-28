local t = Def.ActorFrame{};



t[#t+1] = Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X-4 or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX")-4;y,SCREEN_TOP+50;draworder,2;);

		Def.SongMeterDisplay{
			InitCommand=cmd(SetStreamWidth,421;zoomy,1.3;y,2;);
			Stream=LoadActor("meter stream");
			Tip=LoadActor("tip")..{
				OnCommand=cmd(zoom,0;sleep,1.8;zoom,1;diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,.5");effectclock,"beat";effectperiod,4;);
			};
		};
	};


};

t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "DDR NX");
		LoadActor("frame")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_TOP+25;zoom,1;);
		OnCommand=cmd(addy,-100;decelerate,2;addy,100);
};
};

t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "A20 Minus");
		LoadActor("goldframe")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_TOP+25;zoom,1;);
		OnCommand=cmd(addy,-100;decelerate,2;addy,100);
};
};

t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "A3 Gold");
		LoadActor("a3goldframe")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_TOP+25;zoom,1;);
		OnCommand=cmd(addy,-100;decelerate,2;addy,100);
};
};

t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "A20 Gold");
		LoadActor("a20goldframe")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_TOP+25;zoom,1;);
		OnCommand=cmd(addy,-100;decelerate,2;addy,100);
};
};

t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "A20 Blue");
		LoadActor("a20blueframe")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_TOP+25;zoom,1;);
		OnCommand=cmd(addy,-100;decelerate,2;addy,100);
};
};

t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "A3 Blue");
		LoadActor("a3frame")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_TOP+25;zoom,1;);
		OnCommand=cmd(addy,-100;decelerate,2;addy,100);
};
};

t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "Cyberia Style");
		LoadActor("cyberiaframe")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_TOP+25;zoom,1;);
		OnCommand=cmd(addy,-100;decelerate,2;addy,100);
};
};

t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "Supernova");
		LoadActor("supernovaframe")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_TOP+25;zoom,1;);
		OnCommand=cmd(addy,-100;decelerate,2;addy,100);
};
};


for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = LoadActor("FullCombo", pn) .. {
	};
end;

t[#t+1] = LoadActor("OniGameOverDisplay");


return t;