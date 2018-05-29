module	VGA_Ctrl	(	//	Host Side
						iRed,
						iGreen,
						iBlue,
						oCurrent_X,
						oCurrent_Y,
						oAddress,
						oRequest,
						//	VGA Side
						oVGA_R,
						oVGA_G,
						oVGA_B,
						oVGA_HS,
						oVGA_VS,
						oVGA_SYNC,
						oVGA_BLANK,
						oVGA_CLOCK,
						//	Control Signal
						iCLK,
						iRST_N,
						SW);
//	Host Side
input    [9:0] SW;
input		[9:0]	iRed;
input		[9:0]	iGreen;
input		[9:0]	iBlue;
output		[21:0]	oAddress;
output		[10:0]	oCurrent_X;
output		[10:0]	oCurrent_Y;
output				oRequest;
//	VGA Side
output		[9:0]	oVGA_R;
output		[9:0]	oVGA_G;
output		[9:0]	oVGA_B;
output	reg			oVGA_HS;
output	reg			oVGA_VS;
output				oVGA_SYNC;
output				oVGA_BLANK;
output				oVGA_CLOCK;
//	Control Signal
input				iCLK;
input				iRST_N;	
//	Internal Registers
reg			[10:0]	H_Cont;
reg			[10:0]	V_Cont;
////////////////////////////////////////////////////////////
//	Horizontal	Parameter
parameter	H_FRONT	=	16;
parameter	H_SYNC	=	96;
parameter	H_BACK	=	48;
parameter	H_ACT	=	640;
parameter	H_BLANK	=	H_FRONT+H_SYNC+H_BACK;
parameter	H_TOTAL	=	H_FRONT+H_SYNC+H_BACK+H_ACT;
////////////////////////////////////////////////////////////
//	Vertical Parameter
parameter	V_FRONT	=	11;
parameter	V_SYNC	=	2;
parameter	V_BACK	=	31;
parameter	V_ACT	=	480;
parameter	V_BLANK	=	V_FRONT+V_SYNC+V_BACK;
parameter	V_TOTAL	=	V_FRONT+V_SYNC+V_BACK+V_ACT;
////////////////////////////////////////////////////////////
assign	oVGA_SYNC	=	1'b1;			//	This pin is unused.
assign	oVGA_BLANK	=	~((H_Cont<H_BLANK)||(V_Cont<V_BLANK));
assign	oVGA_CLOCK	=	~iCLK;

//assign	oVGA_R		=	iRed;
//assign	oVGA_G		=	iGreen;
//assign	oVGA_B		=	iBlue;

//assign	oVGA_R		=	(H_Cont>=500) ? iRed : 0;   		//iRed tu coś zmieniłem
//assign	oVGA_B		=	(H_Cont<500) ? iBlue: 0;        //cos sie dzieje 			


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//													MÓJ KOD
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
parameter H_HALF = H_FRONT+H_SYNC+(H_ACT/2)+50;	
parameter V_HALF = V_FRONT+V_SYNC+(V_ACT/2)+30;																	
//assign oVGA_R = (H_Cont<=H_HALF && V_Cont<=V_HALF) ?   iRed :      //lewy górny  dobre parametry to 480,270
//					 (H_Cont>H_HALF && V_Cont<=V_HALF) ?   iGreen :		 //prawy górny
//					 (H_Cont<=H_HALF && V_Cont>V_HALF) ?   iBlue://11111'b1 :      //lewy dolny
//					 (H_Cont>H_HALF && V_Cont>V_HALF) ?   0 :				 //prawy dolny				
//                      0 ;

reg		[9:0]	oVGA_R_temp;
reg		[9:0]	oVGA_G_temp;
reg		[9:0]	oVGA_B_temp;

integer mnoznik1;
integer mnoznik2;
integer dzielnik;
//////////////////////



always @ * begin
////////////////////////////////////////////////Wyświetla nieprzetworzony obraz 
	if((SW[7]==0&& SW[6]==0 && SW[8]==0 && SW[9]==0) || (SW[9]==1 && SW[8]==0) || (SW[8]==1 && SW[9]==0))begin
		oVGA_G_temp		=	iGreen;
		oVGA_B_temp		=	iBlue;
		oVGA_R_temp		=	iRed;
		end
		
		
		///////////////////////////////////////Wyświetla fragment obrazu na w różnej jasności
		
		
	else if(SW[7]==1&&SW[6]==0)begin       //Ustalenie max danego koloru 10'b1111111111
		oVGA_G_temp		=	(H_Cont<=H_HALF && V_Cont<=V_HALF) ?   iGreen :      //lewy górny  dobre parametry to 480,270
					 (H_Cont>H_HALF && V_Cont<=V_HALF) ?   iGreen/2 :				 //prawy górny
					 (H_Cont<=H_HALF && V_Cont>V_HALF) ?   iGreen/4 :	//11111'b1 :      //lewy dolny
					 (H_Cont>H_HALF && V_Cont>V_HALF ) ?    iGreen*2/3 :
//	 (H_Cont>H_HALF && V_Cont>V_HALF && iGreen>=(iBlue+iRed)/2) ?    iGreen : //!!!!!!!!!!!!!!!!
							0;
		oVGA_B_temp		=	(H_Cont<=H_HALF && V_Cont<=V_HALF) ?   iBlue :      //lewy górny  dobre parametry to 480,270
					 (H_Cont>H_HALF && V_Cont<=V_HALF) ?   iBlue /2 :				 //prawy górny
					 (H_Cont<=H_HALF && V_Cont>V_HALF) ?   iBlue/4 : 	//11111'b1 :      //lewy dolny
					 (H_Cont>H_HALF && V_Cont>V_HALF) ?    iBlue *2/3 :
							0;
							
		oVGA_R_temp		= (H_Cont<=H_HALF && V_Cont<=V_HALF) ?   iRed :      //lewy górny  dobre parametry to 480,270
					 (H_Cont>H_HALF && V_Cont<=V_HALF) ?   iRed/2 :				 //prawy górny
					 (H_Cont<=H_HALF && V_Cont>V_HALF) ?   iRed/4 :	     //lewy dolny
					 (H_Cont>H_HALF && V_Cont>V_HALF) ?    iRed*2/3 :				 		//prawy dolny				
                      0 ;
		end
	
	
	
	////////////////////////// Wyświetla cztery różne kolorki każdy bez jednego koloru podstawowego  
	
	if (SW[7]==0&&SW[6]==1)begin
				
					
	
		oVGA_G_temp		=	(H_Cont<=H_HALF && V_Cont<=V_HALF) ?   iGreen :      //lewy górny  dobre parametry to 480,270
					 (H_Cont>H_HALF && V_Cont<=V_HALF) ?   iGreen :				 //prawy górny
					 (H_Cont<=H_HALF && V_Cont>V_HALF) ?   iGreen :	//11111'b1 :      //lewy dolny
					 (H_Cont>H_HALF && V_Cont>V_HALF ) ?    0 :
//	 (H_Cont>H_HALF && V_Cont>V_HALF && iGreen>=(iBlue+iRed)/2) ?    iGreen : //!!!!!!!!!!!!!!!!
							0;
		oVGA_B_temp		=	(H_Cont<=H_HALF && V_Cont<=V_HALF) ?   iBlue :      //lewy górny  dobre parametry to 480,270
					 (H_Cont>H_HALF && V_Cont<=V_HALF) ?   iBlue :				 //prawy górny
					 (H_Cont<=H_HALF && V_Cont>V_HALF) ?   0 : 	//11111'b1 :      //lewy dolny
					 (H_Cont>H_HALF && V_Cont>V_HALF) ?    iBlue :
							0;
							
		oVGA_R_temp		= (H_Cont<=H_HALF && V_Cont<=V_HALF) ?   iRed :      //lewy górny  dobre parametry to 480,270
					 (H_Cont>H_HALF && V_Cont<=V_HALF) ?   0 :				 //prawy górny
					 (H_Cont<=H_HALF && V_Cont>V_HALF) ?   iRed :	     //lewy dolny
					 (H_Cont>H_HALF && V_Cont>V_HALF) ?    iRed :				 		//prawy dolny				
                      0 ;
		end
	
	if (SW[7]==1&&SW[6]==1)begin
	
	mnoznik1=(SW[2:0]==1) ? 1 :
					(SW[2:0]==2) ? 2 :
					(SW[2:0]==3) ? 3 :
					(SW[2:0]==4) ? 4 :
					(SW[2:0]==5) ? 5 :
					(SW[2:0]==6) ? 6 :
					(SW[2:0]==7) ? 7 :
					0;
		mnoznik2=(SW[5:3]==1) ? 1 :
					(SW[5:3]==2) ? 2 :
					(SW[5:3]==3) ? 3 :
					(SW[5:3]==4) ? 4 :
					(SW[5:3]==5) ? 5 :
					(SW[5:3]==6) ? 6 :
					(SW[5:3]==7) ? 7 :
					0;	
					
				//////////////////Wycinanie kolorów poza RGB - kolory ustawianie przy pomocy SW[5-0]
	
		oVGA_G_temp		=	(H_Cont<=H_HALF && V_Cont<=V_HALF) ?   iGreen :      //lewy górny  dobre parametry to 480,270
					 (H_Cont>H_HALF && V_Cont<=V_HALF) ?   0 :				 //prawy górny
					 (H_Cont<=H_HALF && V_Cont>V_HALF) ?   0 :	//11111'b1 :      //lewy dolny
					 (H_Cont>H_HALF && V_Cont>V_HALF && iGreen>=(mnoznik1*iBlue+mnoznik2*iRed)/2) ?    iGreen : //!!!!!!!!!!!!!!!!
					 (H_Cont>H_HALF && V_Cont>V_HALF && iGreen<(mnoznik1*iBlue+mnoznik2*iRed)/2) ? 0 :
					  0;
		oVGA_B_temp		=	(H_Cont<=H_HALF && V_Cont<=V_HALF) ?   iBlue :      //lewy górny  dobre parametry to 480,270
					 (H_Cont>H_HALF && V_Cont<=V_HALF) ?   0 :				 //prawy górny
					 (H_Cont<=H_HALF && V_Cont>V_HALF && iBlue>=(mnoznik1*iGreen+mnoznik2*iRed)/2) ?   iBlue :
					 (H_Cont<=H_HALF && V_Cont>V_HALF && iBlue<(mnoznik1*iGreen+mnoznik2*iRed)/2) ?   0:
					 (H_Cont>H_HALF && V_Cont>V_HALF) ?    0:
							0;
							
		oVGA_R_temp		= (H_Cont<=H_HALF && V_Cont<=V_HALF) ?   iRed :      //lewy górny  dobre parametry to 480,270
					 (H_Cont>H_HALF && V_Cont<=V_HALF && iRed>=(mnoznik1*iGreen+mnoznik2*iBlue)/2) ?   iRed :				 //prawy górny
					 (H_Cont>H_HALF && V_Cont<=V_HALF  && iRed<(mnoznik1*iGreen+mnoznik2*iBlue)/2) ?   0 :	
					 (H_Cont<=H_HALF && V_Cont>V_HALF) ?   0 :	     //lewy dolny
					 (H_Cont>H_HALF && V_Cont>V_HALF) ?     0 :
					 0;
		end
	
	
	///////////////////////////////////////Tutaj jest brzydko rozwiązane urzycie przełaczników. Przy wersji nie testowej warto to jakoś usprawnić? 
	
	
	
	if (SW[9]==1&&SW[8]==1)begin
	
	mnoznik1=(SW[2:0]==1) ? 1 :
					(SW[2:0]==2) ? 2 :
					(SW[2:0]==3) ? 3 :
					(SW[2:0]==4) ? 4 :
					(SW[2:0]==5) ? 5 :
					(SW[2:0]==6) ? 6 :
					(SW[2:0]==7) ? 7 :
					0;
		mnoznik2=(SW[5:3]==1) ? 1 :
					(SW[5:3]==2) ? 2 :
					(SW[5:3]==3) ? 3 :
					(SW[5:3]==4) ? 4 :
					(SW[5:3]==5) ? 5 :
					(SW[5:3]==6) ? 6 :
					(SW[5:3]==7) ? 7 :
					0;	
					
			dzielnik=3; ///////////////////////////////Wycinanie kolorów poza kolorem  ustalonym przy pomocy SW[5-0]
	
		oVGA_G_temp		=	(H_Cont<=H_HALF && V_Cont<=V_HALF) ?   iGreen :      //lewy górny  dobre parametry to 480,270
					 (H_Cont>H_HALF && V_Cont<=V_HALF && oVGA_R_temp>0) ?   iGreen :				 //prawy górny
					 (H_Cont<=H_HALF && V_Cont>V_HALF&& oVGA_B_temp>0) ?   iGreen :	     //lewy dolny
					 
					 (H_Cont>H_HALF && V_Cont>V_HALF && iGreen>=(mnoznik1*iBlue+mnoznik2*iRed)/(dzielnik)) ?    iGreen : //!!!!!!!!!!!!!!!!
					 (H_Cont>H_HALF && V_Cont>V_HALF && iGreen<(mnoznik1*iBlue+mnoznik2*iRed)/(dzielnik)) ? 0 :
					
					  0;
		oVGA_B_temp		=	(H_Cont<=H_HALF && V_Cont<=V_HALF) ?   iBlue :      //lewy górny  dobre parametry to 480,270
					 (H_Cont>H_HALF && V_Cont<=V_HALF&& oVGA_R_temp>0) ?   iBlue :				 //prawy górny
					 
					 (H_Cont<=H_HALF && V_Cont>V_HALF&& iBlue>=(mnoznik1*iGreen+mnoznik2*iRed)/(dzielnik)) ?   iBlue:                   //lewy dolny
					 (H_Cont<=H_HALF && V_Cont>V_HALF&& iBlue<(mnoznik1*iGreen+mnoznik2*iRed)/(dzielnik)) ?   0:
					 
					 (H_Cont>H_HALF && V_Cont>V_HALF && oVGA_G_temp>0) ?    iBlue:
							0;
							
		oVGA_R_temp		= (H_Cont<=H_HALF && V_Cont<=V_HALF) ?   iRed :      //lewy górny  dobre parametry to 480,270
					 (H_Cont>H_HALF && V_Cont<=V_HALF && iRed>=(mnoznik1*iBlue+mnoznik2*iGreen)/(dzielnik)) ?   iRed :				 //prawy górny
					 (H_Cont>H_HALF && V_Cont<=V_HALF && iRed<(mnoznik1*iBlue+mnoznik2*iGreen)/(dzielnik)) ?   0:
					 
					 (H_Cont<=H_HALF && V_Cont>V_HALF && oVGA_B_temp>0) ?    iRed:	     //lewy dolny
					 (H_Cont>H_HALF && V_Cont>V_HALF && oVGA_G_temp>0) ?    iRed:
					 
					 0;
		end
	
	
	
	
	
	
	
	
	
end






assign oVGA_R = oVGA_R_temp;
assign oVGA_G = oVGA_G_temp;
assign oVGA_B = oVGA_B_temp;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
assign	oAddress	=	oCurrent_Y*H_ACT+oCurrent_X;
assign	oRequest	=	((H_Cont>=H_BLANK && H_Cont<H_TOTAL)	&&
						 (V_Cont>=V_BLANK && V_Cont<V_TOTAL));
assign	oCurrent_X	=	(H_Cont>=H_BLANK)	?	H_Cont-H_BLANK	:	11'h0	;
assign	oCurrent_Y	=	(V_Cont>=V_BLANK)	?	V_Cont-V_BLANK	:	11'h0	;

//	Horizontal Generator: Refer to the pixel clock
always@(posedge iCLK or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		H_Cont		<=	0;
		oVGA_HS		<=	1;
	end
	else
	begin
		if(H_Cont<H_TOTAL)
		H_Cont	<=	H_Cont+1'b1;
		else
		H_Cont	<=	0;
		//	Horizontal Sync
		///////////////////////////////////////////////////////////////TU nie chcemy grzebać
//		if(H_Cont<(H_TOTAL-100))
//		H_Cont <= 11'h0;
		////////////////////////////////////////////////////////////////////////////
		if(H_Cont==H_FRONT-1)			//	Front porch end
		oVGA_HS	<=	1'b0;
		if(H_Cont==H_FRONT+H_SYNC-1)	//	Sync pulse end
		oVGA_HS	<=	1'b1;
	end
end

//	Vertical Generator: Refer to the horizontal sync
always@(posedge oVGA_HS or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		V_Cont		<=	0;
		oVGA_VS		<=	1;
	end
	else
	begin
		if(V_Cont<V_TOTAL)
		V_Cont	<=	V_Cont+1'b1;
		else
		V_Cont	<=	0;
		//	Vertical Sync
		if(V_Cont==V_FRONT-1)			//	Front porch end
		oVGA_VS	<=	1'b0;
		if(V_Cont==V_FRONT+V_SYNC-1)	//	Sync pulse end
		oVGA_VS	<=	1'b1;
	end
end

endmodule