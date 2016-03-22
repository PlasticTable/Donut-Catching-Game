%File Name: FinalEvaluationsAttemptOne.t
%Author: Diana Tsai
%Date: December 7th 2011
%Description:Level 4. Donuts Game
setscreen ("graphics:640;480;nocursor")
var font1, font2, Top_Score : int
var x, y, c, x1, y1, c1 : int

c := 114
c1 := 0
x := 100
y := 380
x1 := 100
y1 := 380
Top_Score := 0
% process KisforKelson
%    Music.PlayFile ("K is for Kelson - Bibio.mp3")
% end KisforKelson

proc menu1
    cls
    var font1, font2 : int
    var x, y, c, x1, y1, c1 : int
    c := 114
    c1 := 0
    x := 100
    y := 380
    x1 := 100
    y1 := 380
    drawfilloval (x, y, 100, 100, c)
    drawfilloval (x, y, 50, 50, c1)
    drawfilloval (640, 240, 100, 100, c)
    drawfilloval (640, 240, 50, 50, c1)
    drawfilloval (250, 0, 100, 100, c)
    drawfilloval (250, 0, 50, 50, c1)
    %Multiplayer mode is now moved to Options
    font1 := Font.New ("Freestyle Script:72:underline")
    font2 := Font.New ("Magneto:36")
    Font.Draw ("Catch that Donut!", 100, 350, font1, 54)
    Font.Draw ("Play", 270, 270, font2, 53)
    Font.Draw ("Instructions", 180, 220, font2, 53)
    Font.Draw ("Options", 230, 170, font2, 53)
    Font.Draw ("High Scores", 160, 120, font2, 53)
    %The drawboxes are just to help me for mousewhere. They will be gone.
    %drawbox (270, 255, 390, 305, 16)
    %drawbox (180, 220, 480, 253, 16)
    %drawbox (230, 159, 430, 204, 16)
    %drawbox (159, 108, 497, 157, 16)

end menu1

proc menu2

    cls
    setscreen ("graphics: 640; 480; nocursor")
    %Vertical Stripes
    drawfillbox (0, 0, 30, 480, 45) %Green
    drawfillbox (40, 0, 600, 480, 43) %Orange
    drawfillbox (610, 0, 640, 480, 44) %Yellow
    drawfillbox (0, 10, 640, 20, 51) %Turquoise
    drawfillbox (0, 25, 640, 50, 100) %Light Blue
    drawfillbox (0, 55, 640, 65, 103) %Light Purple

    drawbox (20, 20, 620, 460, 16)
    drawbox (10, 10, 630, 470, 16)
    var font3 : int
    var font4 : int
    var font5 : int
    %Back to Menu
    font3 := Font.New ("Magneto:20")
    Font.Draw ("Back to Menu", 400, 30, font3, 16)
    %Heading
    font4 := Font.New ("Bradley Hand ITC:30:underline")
    Font.Draw ("Instructions", 40, 420, font4, 16)
    %Intructions
    font5 := Font.New ("Tekton Pro:16")
    Font.Draw ("Use the arrow keys to move the basket. You can only use the", 45, 390, font5, 16)
    Font.Draw ("right and left arrow key. Pretty simple, right?", 45, 370, font5, 16)
    Font.Draw ("If you didn't catch one donut, it's game over.", 45, 350, font5, 16)
    Font.Draw ("Everytime the score increases by 10, the donuts'", 45, 330, font5, 16)
    Font.Draw ("speed range inscreases by 1. And everytime the score", 45, 310, font5, 16)
    Font.Draw ("increases by 20, the box size gets smaller.", 45, 290, font5, 16)
    Font.Draw ("The box will stop shrinking when the score is 120 or more.", 45, 270, font5, 16)
    Font.Draw ("The donuts you will be catching are boston cream ones of", 45, 250, font5, 16)
    Font.Draw ("different colors.", 45, 230, font5, 16)
    Font.Draw ("Good luck, have fun!", 140, 180, font4, 16)

    %drawbox (370, 30, 613, 52, 16)
    var x2, y2, button2 : int

end menu2

function game (Top_Score : int) : int

    %File Name: Play (Falling Donuts and Objects)
    %Date Started: Wednesday December 14, 2011
    %Author: Diana Tsai
    %Description: Falling donuts and objects



    setscreen ("graphics:640;480;nocursor")
    var Oval_x, Oval_y, New_Oval_y, Oval_Color, Radius, Oval_Top, Oval_Speed, Oval_Top_Speed : int %One donut
    var Chars : array char of boolean
    var BoxBottom_x, New_BoxBottom_x, BoxBottom_y, Box_x_size, Box_y_size, Box_Color, Box_Speed : int %basket
    var Score : int
    var Catch : int
    var Anykey : string (1)
    var font4 : int
    var Tryagain : int
    var GameTopScore : int;

    Catch := 0
    Oval_Top := 430
    New_Oval_y := Oval_Top
    Radius := 20
    Oval_Color := Rand.Int (1, 200)
    Oval_Speed := 10
    Oval_Top_Speed := 20

    Box_Color := 114
    Box_x_size := 80
    Box_y_size := 50
    Box_Speed := 25

    BoxBottom_x := 20
    BoxBottom_y := 20
    New_BoxBottom_x := BoxBottom_x

    Score := 0
    GameTopScore := Score
    Tryagain := 0

    cls
    font4 := Font.New ("Bradley Hand ITC:30")
    Font.Draw ("Ready ? Press any key to start", 80, 260, font4, 16)
    getch (Anykey)
    cls



    loop
	fork KisforKelson
	Oval_x := Rand.Int (21, 619)
	Oval_y := Oval_Top
	if (Score mod 10) = 0 then %Every time the score increases by 10, the speed range of the donut increases by one
	    Oval_Top_Speed := Oval_Top_Speed + 1
	end if
	if (Score mod 20) = 0 then %Everytime the score increases by 20, the basket get smaller by 5b (stops shrinking when you are at 120 for score)
	    Box_x_size := Box_x_size - 5
	    if Box_x_size <= 50 then
		Box_x_size := 50
	    end if
	end if

	Oval_Color := Rand.Int (1, 200)
	Oval_Speed := Rand.Int (10, Oval_Top_Speed)
	cls
	put "Score: ", Score
	Catch := 0
	loop
	    drawfilloval (Oval_x, Oval_y, Radius, Radius, Oval_Color)
	    drawfillbox (BoxBottom_x, BoxBottom_y, BoxBottom_x + Box_x_size, BoxBottom_y + Box_y_size, Box_Color)
	    delay (50)

	    Input.KeyDown (Chars)
	    if Chars (KEY_RIGHT_ARROW) then % Right
		New_BoxBottom_x := BoxBottom_x + Box_Speed
	    end if
	    if Chars (KEY_LEFT_ARROW) then % Left
		New_BoxBottom_x := BoxBottom_x - Box_Speed
	    end if

	    if (New_BoxBottom_x <= 0) then
		New_BoxBottom_x := 0
	    end if
	    if (New_BoxBottom_x + Box_x_size >= 640) then
		New_BoxBottom_x := 640 - Box_x_size
	    end if
	    New_Oval_y := Oval_y - Oval_Speed

	    % if the box catches the donut

	    if Oval_y - Radius <= BoxBottom_y + Box_y_size then
		if (Oval_x + Radius >= BoxBottom_x) and (Oval_x - Radius <= BoxBottom_x + Box_x_size) then
		    Score := Score + 1
		    Catch := 1
		    exit when 1 = 1
		end if
	    end if

	    drawfilloval (Oval_x, Oval_y, Radius, Radius, 0)
	    drawfillbox (BoxBottom_x, BoxBottom_y, BoxBottom_x + Box_x_size, BoxBottom_y + Box_y_size, 0)
	    BoxBottom_x := New_BoxBottom_x
	    Oval_y := New_Oval_y
	    exit when Oval_y - Radius <= 0

	end loop

	if Catch = 0 then
	    cls
	    Font.Draw ("Try Again ? y (yes)/n (no)", 80, 260, font4, 16)
	    loop
		Input.KeyDown (Chars)
		if Chars ('Y') or Chars ('y') then
		    if Score > GameTopScore then
			GameTopScore := Score
		    end if
		    Score := 0
		    Tryagain := 1
		    exit when 1 = 1
		end if
		if Chars ('N') or Chars ('n') then
		    if Score > GameTopScore then
			GameTopScore := Score
		    end if
		    Tryagain := 0
		    exit when 1 = 1
		end if
	    end loop
	    if Tryagain = 0 then
		exit when 1 = 1
	    end if
	    if Tryagain = 1 then
		cls
		font4 := Font.New ("Bradley Hand ITC:30")
		Font.Draw ("Ready ? Press anykey to start", 80, 260, font4, 16)
		getch (Anykey)
		cls
	    end if
	end if

    end loop

    if GameTopScore > Top_Score then
	result GameTopScore
    else
	result Top_Score
    end if

end game

proc show_top_score (Top_Score : int)

    cls
    setscreen ("graphics: 640; 480; nocursor")
    %Vertical Stripes
    drawfillbox (0, 0, 30, 480, 45) %Green
    drawfillbox (40, 0, 600, 480, 43) %Orange
    drawfillbox (610, 0, 640, 480, 44) %Yellow
    drawfillbox (0, 10, 640, 20, 51) %Turquoise
    drawfillbox (0, 25, 640, 50, 100) %Light Blue
    drawfillbox (0, 55, 640, 65, 103) %Light Purple

    drawbox (20, 20, 620, 460, 16)
    drawbox (10, 10, 630, 470, 16)
    var font3 : int
    var font4 : int
    var font5 : int
    %Back to Menu
    font3 := Font.New ("Magneto:20")
    Font.Draw ("Back to Menu", 400, 30, font3, 16)
    %Heading
    font4 := Font.New ("Bradley Hand ITC:30")
    Font.Draw ("Top Score", 240, 260, font4, 16)
    Font.Draw (intstr (Top_Score), 320, 200, font4, 16)


end show_top_score
    cls
    setscreen ("graphics: 640; 480; nocursor")
    %Vertical Stripes
    drawfillbox (0, 0, 30, 480, 45)     %Green
    drawfillbox (40, 0, 600, 480, 43)     %Orange
    drawfillbox (610, 0, 640, 480, 44)     %Yellow
    drawfillbox (0, 10, 640, 20, 51)     %Turquoise
    drawfillbox (0, 25, 640, 50, 100)     %Light Blue
    drawfillbox (0, 55, 640, 65, 103)     %Light Purple

    drawbox (20, 20, 620, 460, 16)
    drawbox (10, 10, 630, 470, 16)
    var font3 : int
    var font4 : int
    var font5 : int
    %Back to Menu
    font3 := Font.New ("Magneto:20")
    Font.Draw ("Back to Menu", 400, 30, font3, 16)
    %Heading
    font4 := Font.New ("Bradley Hand ITC:30")
    Font.Draw ("Easy", 240, 300, font4, 16)
    Font.Draw ("Medium", 240, 280, font4, 16)
    Font.Draw ("Hard", 240, 260, font4, 16)
    Font.Draw (intstr (Top_Score), 320, 200, font4, 16)
proc Options

end Options
menu1
loop
    var xm, ym, button : int %Mouse variables
    mousewhere (xm, ym, button)
    if (xm >= 270) and (xm <= 390) and (ym >= 255) and (ym <= 305) and (button = 1) then %Play
	Top_Score := game (Top_Score)
	menu1
    end if
    if (xm >= 180) and (ym >= 220) and (xm <= 480) and (ym <= 253) and (button = 1) then %Instructions
	menu2
    end if
    if (xm >= 370) and (ym >= 30) and (xm <= 613) and (ym <= 52) and (button = 1) then %Back to Menu
	menu1

    end if
    if (xm >= 230) and (ym >= 159) and (xm <= 430) and (ym <= 204) and (button = 1) then %Options
	Options
    end if

    if (xm >= 159) and (ym >= 108) and (xm <= 497) and (ym <= 157) and (button = 1) then %High Scores

	show_top_score (Top_Score)

    end if
end loop

