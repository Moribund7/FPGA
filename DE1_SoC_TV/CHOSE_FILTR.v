module CHOSE_FILTR(
							SW,
							iRed,
							iBlue,
							iGreen,
							iRed_new,
							iBlue_new,
							iGreen_new);
							
input    [9:0] SW;				
input		[9:0]	iRed;
input		[9:0]	iGreen;
input		[9:0]	iBlue;

output   [9:0] iRed_new;
output	[9:0]	iBlue_new;
output   [9:0] iGreen_new;						





reg   [9:0] iRed_temp;
reg	[9:0]	iBlue_temp;
reg   [9:0] iGreen_temp;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
always begin /////////////////////////////////////TO DO: TO NIE DZIAŁA!!!! FILTRY SIE NIE WYSWIETLAJA NAPRAWAIC
					
																		
if(SW[9]==1 && SW[8]==0)begin                                    //jakiś randomowy filtr
																		
iRed_temp	  =	iRed;
iBlue_temp	  =	iBlue;
iGreen_temp    =	iGreen;

//if(CHOSE)begin

																							
if(SW[0])begin

	iRed_temp	  =	iBlue_temp;
	iBlue_temp	  =	iRed_temp;
	iGreen_temp    =	iGreen_temp;
	
				end

if(SW[1])begin
	
	iRed_temp	  =	iRed_temp;
	iBlue_temp	  =	iGreen_temp;
	iGreen_temp    =	iBlue_temp;
	end

if(SW[2]) begin
	
	iRed_temp	  =	iGreen_temp;
	iBlue_temp	  =	iBlue_temp;
	iGreen_temp    =	iRed_temp;
	
	end

	end
			
			
	if(SW[8]==1 && SW[9]==0)begin      //ustawia kolejne kombinacje kolorów (wszystkich jest 27), na każdy z trzech
												  //kolorów na wyjściu ustawiamy jeden z trzech kolorów na wejściu 

																							
if(SW[2:0]==0)begin

	iRed_temp	  =	iRed;
	iBlue_temp	  =	iBlue;
	iGreen_temp    =	iGreen;
	
				end

if(SW[2:0]==1)begin
	
	iRed_temp	  =	iRed;
	iBlue_temp	  =	iGreen;
	iGreen_temp    =	iBlue;
	end

if(SW[2:0]==2) begin
	
	iRed_temp	  =	iBlue;
	iBlue_temp	  =	iRed;
	iGreen_temp    =	iGreen;

end

if(SW[2:0]==3) begin
	
	iRed_temp	  =	iBlue;
	iBlue_temp	  =	iGreen;
	iGreen_temp    =	iRed;

end 	 	

if(SW[2:0]==4) begin
	
	iRed_temp	  =	iGreen;
	iBlue_temp	  =	iRed;
	iGreen_temp    =	iBlue;

end 	 

if(SW[2:0]==5) begin
	
	iRed_temp	  =	iGreen;
	iBlue_temp	  =	iBlue;
	iGreen_temp    =	iRed;

end 	 

if(SW[4:0]==6) begin
	
	iRed_temp	  =	iRed;
	iBlue_temp	  =	iBlue;
	iGreen_temp    =	iRed;

end 	

if(SW[4:0]==7) begin
	
	iRed_temp	  =	iRed;
	iBlue_temp	  =	iGreen;
	iGreen_temp    =	iRed;

end 

if(SW[4:0]==8) begin
	
	iRed_temp	  =	iRed;
	iBlue_temp	  =	iRed;
	iGreen_temp    =	iBlue;

end 

 if(SW[4:0]==9) begin
	
	iRed_temp	  =	iRed;
	iBlue_temp	  =	iRed;
	iGreen_temp    =	iGreen;

end 

if(SW[4:0]==10) begin
	
	iRed_temp	  =	iBlue;
	iBlue_temp	  =	iRed;
	iGreen_temp    =	iRed;

end 

if(SW[4:0]==11) begin
	
	iRed_temp	  =	iGreen;
	iBlue_temp	  =	iRed;
	iGreen_temp    =	iRed;

end 



if(SW[4:0]==12) begin
	
	iRed_temp	  =	iGreen;
	iBlue_temp	  =	iBlue;
	iGreen_temp    =	iGreen;

end 	

if(SW[4:0]==13) begin
	
	iRed_temp	  =	iGreen;
	iBlue_temp	  =	iRed;
	iGreen_temp    =	iGreen;

end 

if(SW[4:0]==14) begin
	
	iRed_temp	  =	iGreen;
	iBlue_temp	  =	iGreen;
	iGreen_temp    =	iBlue;

end 

 if(SW[4:0]==15) begin
	
	iRed_temp	  =	iGreen;
	iBlue_temp	  =	iGreen;
	iGreen_temp    =	iRed;

end 

if(SW[4:0]==16) begin
	
	iRed_temp	  =	iBlue;
	iBlue_temp	  =	iGreen;
	iGreen_temp    =	iGreen;

end 

if(SW[4:0]==17) begin
	
	iRed_temp	  =	iRed;
	iBlue_temp	  =	iGreen;
	iGreen_temp    =	iGreen;

end 


if(SW[4:0]==18) begin
	
	iRed_temp	  =	iBlue;
	iBlue_temp	  =	iGreen;
	iGreen_temp    =	iBlue;

end 	

if(SW[4:0]==19) begin
	
	iRed_temp	  =	iBlue;
	iBlue_temp	  =	iRed;
	iGreen_temp    =	iBlue;

end 

if(SW[4:0]==20) begin
	
	iRed_temp	  =	iBlue;
	iBlue_temp	  =	iBlue;
	iGreen_temp    =	iGreen;

end 

 if(SW[4:0]==21) begin
	
	iRed_temp	  =	iBlue;
	iBlue_temp	  =	iBlue;
	iGreen_temp    =	iRed;

end 

if(SW[4:0]==22) begin
	
	iRed_temp	  =	iGreen;
	iBlue_temp	  =	iBlue;
	iGreen_temp    =	iBlue;

end 

if(SW[4:0]==23) begin
	
	iRed_temp	  =	iRed;
	iBlue_temp	  =	iBlue;
	iGreen_temp    =	iBlue;

end 

if(SW[4:0]==24) begin
	
	iRed_temp	  =	iRed;
	iBlue_temp	  =	iRed;
	iGreen_temp    =	iRed;

end 

if(SW[4:0]==25) begin
	
	iRed_temp	  =	iBlue;
	iBlue_temp	  =	iBlue;
	iGreen_temp    =	iBlue;

end 

if(SW[4:0]==26) begin
	
	iRed_temp	  =	iGreen;
	iBlue_temp	  =	iGreen;
	iGreen_temp    =	iGreen;

end 
	
end
	

				if((SW[9]==0 && SW[8]==0) || (SW[9]==1&& SW[8]==1))begin 										//Przekierowanie obrazu bez filtrów
				iRed_temp	  =	iRed;
				iBlue_temp	  =	iBlue;
				iGreen_temp    =	iGreen;
				end
end

assign	iRed_new      =	iRed_temp;   
assign	iBlue_new	  =	iBlue_temp;
assign	iGreen_new    =	iGreen_temp;

endmodule









//always begin
//
//if(SW[9])begin
//CHOSE1=1;
//end
//
//end
//
//Filtr_SWITCH 			f1(   .SW(SW[9:0]),
//							.iRed(mRed),
//							.iGreen(mGreen),
//							.iBlue(mBlue),
//							//out
//							.iRed_new(mRed_new),
//							.iGreen_new(mGreen_new),
//							.iBlue_new(mBlue_new));
//
//Filtr_NULL 			f0(   .SW(SW[9:0]),
//							.iRed(mRed),
//							.iGreen(mGreen),
//							.iBlue(mBlue),
//							//out
//							.iRed_new(mRed_new),
//							.iGreen_new(mGreen_new),
//							.iBlue_new(mBlue_new));							
//							
//assign	iRed_new      =	iRed_new;   
//assign	iBlue_new	  =	iBlue_new;
//assign	iGreen_new    =	iGreen_new;							
//							
//							
//endmodule