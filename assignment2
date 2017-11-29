; Timmy Glynn
; assignment 2

 
include Irvine32.inc
  .data 
;value for the option choices (CHANGE THIS)
choice Byte ?

;values for changeBase
MyInteger	dword ?
count		dword 0

;values for convertLength/convertWeight/convertCurrency
value		dword ?
result		Byte "Your result is: ", 0ah, 0dh, 0

;user prompts 
whichProc		Byte "Which procedure do you want to do? ", 0ah, 0dh, 0
anotherProc		Byte "Do you want to do another procedure? Yes (Y) or No (N)? ", 0ah, 0dh, 0

enterMyInteger	Byte "Enter your decimal integer ", 0ah, 0dh, 0
enterValue		Byte "Enter your value ", 0ah, 0dh, 0

;user options
changeBaseOp		Byte "Enter 'A' for changeBase procedure ", 0ah, 0dh, 0
convertLengthOp		Byte "Enter 'B' for convertLength procedure ", 0ah, 0dh, 0
convertWeightOp		Byte "Enter 'C' for convertWeight procedure ", 0ah, 0dh, 0
convertCurrencyOp	Byte "Enter 'D' for convertCurrency procedure ", 0ah, 0dh, 0
changeTimeOp		Byte "Enter 'E' for changeTime procedure ", 0ah, 0dh, 0

;user option response
choseBase		Byte "You chose changeBase! ", 0ah, 0dh, 0
choseLength		Byte "You chose convertLength! ", 0ah, 0dh, 0
choseWeight		Byte "You chose convertWeight! ", 0ah, 0dh, 0
choseCurrency	Byte "You chose convertCurrency! ", 0ah, 0dh, 0
choseTime		Byte "You chose changeTime! ", 0ah, 0dh, 0

;changeBase strings
whichBase	Byte "Which base do you want to convert to? ", 0ah, 0dh, 0
binary		Byte "Enter 'b' to convert to binary ", 0ah, 0dh, 0
octal		Byte "Enter 'o' to convert to octal ", 0ah, 0dh, 0
hex			Byte "Enter 'h' to convert to hexadecimal ", 0ah, 0dh, 0

;convertLength strings
whichLengthConvert	Byte "Which length conversion do you want to do? ", 0ah, 0dh, 0
lengthOp1			Byte "Enter '1' for Yards to feet ", 0ah, 0dh, 0
lengthOp2			Byte "Enter '2' for Feet to inches ", 0ah, 0dh, 0
lengthOp3			Byte "Enter '3' for Yards to feet ", 0ah, 0dh, 0

;convertWeight strings
whichWeightConvert	Byte "Which weight conversion do you want to do? ", 0ah, 0dh, 0
weightOp1			Byte "Enter '1' for Pounds to ounces", 0ah, 0dh, 0
weightOp2			Byte "Enter '2' for Kilograms to pounds", 0ah, 0dh, 0
weightOp3			Byte "Enter '3' for Kilograms to grams ", 0ah, 0dh, 0

;convertCurrency strings
whichCurrencyConvert		Byte "Which currency conversion do you want to do ?", 0ah, 0dh, 0
currencyOp1					Byte "Enter '1' for US Dollars to Euros", 0ah, 0dh, 0
currencyOp2					Byte "Enter '2' for US Dollars to British Pounds ", 0ah, 0dh, 0
currencyOp3					Byte "Enter '3' for US Dollars to Japanese Yen ", 0ah, 0dh, 0

;changeTime strings
timePrompt		Byte "Enter your time in military time ", 0ah, 0dh, 0
timeResult		Byte "Standard time is: ", 0ah, 0dh, 0
amTime			Byte " am ", 0ah, 0dh, 0
pmTime			Byte " pm ", 0ah, 0dh, 0
semi			Byte ":"


.code
main proc
  
;call the string to ask user what procedure they want to do
;list the procedure options
;set the choices for each option
;call procedures
start:
	lea edx, whichProc
	call writeString
	call crlf

	lea edx, changeBaseOp
	call writeString

	lea edx, convertLengthOp
	call writeString

	lea edx, convertWeightOp
	call writeString

	lea edx, convertCurrencyOp
	call writeString

	lea edx, changeTimeOp
	call writeString
	call crlf

	mov edx, offset choice
	call readChar
	mov choice, al

	;set choices
	cmp al, 'A'
	je changeBase

	cmp al, 'B'
	je convertLength

	cmp al, 'C'
	je convertWeight

	cmp al, 'D' 
	je convertCurrency

	cmp al, 'E'
	je changeTime


call changeBase
call crlf
call convertLength
call crlf
call convertWeight
call crlf
call convertCurrency
call crlf
call changeTime
call crlf    


	exit
main endp


changeBase proc
	lea edx, choseBase ;clarifies which procedure user chose
	call writeString
	call crlf

	;lea edx, enterMyInteger ;enter decimal integer
	;call writeString
	;call readDec
	;mov MyInteger, eax

	call crlf

	lea edx, whichBase ;ask which type of base conversion user wants to do
	call writeString
	call crlf

	;print the choices for which method to do
	lea edx, binary
	call writeString

	lea edx, octal
	call writeString

	lea edx, hex
	call writeString
	call crlf

	mov edx, offset choice	;enter choice 
	call readChar
	mov choice, al			;store in al

	;compare al to the choice values, jump to corresponding method
	cmp al, 'b'
	je b

	cmp al, 'o'
	je o

	cmp al, 'h'
	je h

	;methods for base conversions
	;this is where the calculations occur

		b:
			lea edx, enterMyInteger ;enter decimal integer
			call writeString
			call readDec
			mov MyInteger, eax

			mov eax, MyInteger
			mov ebx, 2

			startB:
				mov count, 0
				mov MyInteger, eax
				mov eax, MyInteger
				mov ebx, 2

			b1:
				inc count
				mov edx, 0
				div ebx
				push edx
				cmp eax, 0
				ja b1
				call crlf
				mov ecx, count

			b2:
				pop eax
				call writeDec
				loop b2
				call crlf

			;after calculating, ask user if they want to do another procedure
			lea edx, anotherProc
			call writeString
			call crlf

			mov edx, offset choice
			call readChar
			mov choice, al

			cmp al, 'Y'
			je main

			cmp al, 'N'
			ret

		o:
			lea edx, enterMyInteger ;enter decimal integer
			call writeString
			call readDec
			mov MyInteger, eax

			mov eax, MyInteger
			mov ebx, 8

			startO:
			mov count, 0
			mov MyInteger, eax
			mov eax, MyInteger
			mov ebx, 8

			o1:
				inc count
				mov edx, 0
				div ebx
				push edx
				cmp eax, 0
				ja o1
				call crlf
				mov ecx, count

			o2:
				pop eax
				call writeDec
				loop o2
				call crlf

			;after calculating, ask user if they want to do another procedure
			lea edx, anotherProc
			call writeString
			call crlf

			mov edx, offset choice
			call readChar
			mov choice, al

			cmp al, 'Y'
			je main

			cmp al, 'N'
			ret

		h:
			lea edx, enterMyInteger ;enter decimal integer
			call writeString
			call readDec
			mov MyInteger, eax

			mov eax, MyInteger
			mov ebx, 16

			startH:
			mov count, 0
			mov MyInteger, eax
			mov eax, MyInteger
			mov ebx, 16

			h1:
				inc count
				mov edx, 0
				div ebx
				push edx
				cmp eax, 0
				ja h1
				call crlf
				mov ecx, count

			h2:
				pop eax
				cmp eax, 10
				je convertA
				ja if11							;what if the value is higher than 10? find its corresponding character
				jb continue

					continue:
						call writeDec
						call crlf

					convertA:
						mov eax, 'A'
						call writeChar
						jmp stop
						call crlf

					if11:
						cmp eax, 11
						je convertB
						ja if12

					convertB:
						mov eax, 'B'
						call writeChar
						jmp stop
						call crlf

					if12:
						cmp eax, 12
						je convertC
						ja if13

					convertC:
						mov eax, 'C'
						call writeChar
						jmp stop
						call crlf

					if13:
						cmp eax, 13
						je convertD
						ja if14

					convertD:
						mov eax, 'D'
						call writeChar
						jmp stop
						call crlf

					if14:
						cmp eax, 14
						je convertE
						ja if15

					convertE:
						mov eax, 'E'
						call writeChar
						jmp stop
						call crlf

					if15:
						cmp eax, 15
						je convertF

					convertF:
						mov eax, 'F'
						call writeChar
						jmp stop
						call crlf

					stop:
						

						;after calculating, ask user if they want to do another procedure
						call crlf
						call crlf
						lea edx, anotherProc
						call writeString
						call crlf

						mov edx, offset choice
						call readChar
						mov choice, al

						cmp al, 'Y'
						je main

						cmp al, 'N'
						ret
						 
changeBase endp

convertLength proc
	lea edx, choseLength ;clarifies which procedure user chose
	call writeString
	call crlf

	lea edx, whichLengthConvert
	call writeString
	call crlf

	;print the choices for which method to do
	lea edx, lengthOp1
	call writeString

	lea edx, lengthOp2
	call writeString

	lea edx, lengthOp3
	call writeString
	call crlf

	mov edx, offset choice
	call readChar
	mov choice, al

	cmp al, '1'
	je yards2feet

	cmp al, '2'
	je feet2inches

	cmp al, '3'
	je yards2inches

	start:
		yards2feet:
			lea edx, enterValue 
			call writeString
			call readDec

			mov value, eax		;move your value into eax
			mov ebx, 3			;store 3 in ebx
			mul ebx				;multiply your value by 3
			call crlf

			lea edx, result		;store result string in edx 
			call writeString	;print the result string
			call writeDec		;print the value stored in result string (edx)
			call crlf
			call crlf

			;after calculating, ask user if they want to do another procedure
			lea edx, anotherProc
			call writeString
			call crlf

			mov edx, offset choice
			call readChar
			mov choice, al

			cmp al, 'Y'
			je main

			cmp al, 'N'
			ret
			  
		feet2inches:
			lea edx, enterValue 
			call writeString
			call readDec

			mov value, eax		;see yards2feet
			mov edx, 12
			mul edx
			call crlf

			lea edx, result
			call writeString
			call writeDec
			call crlf
			call crlf

			;after calculating, ask user if they want to do another procedure
			lea edx, anotherProc
			call writeString
			call crlf

			mov edx, offset choice
			call readChar
			mov choice, al

			cmp al, 'Y'
			je main

			cmp al, 'N'
			ret

		yards2inches:
			lea edx, enterValue		
			call writeString
			call readDec

			mov value, eax		;see yards2feet
			mov edx, 36
			mul edx
			call crlf
			call crlf

			lea edx, result
			call writeString
			call writeDec
			call crlf
			call crlf

			;after calculating, ask user if they want to do another procedure
			lea edx, anotherProc
			call writeString
			call crlf

			mov edx, offset choice
			call readChar
			mov choice, al

			cmp al, 'Y'
			je main

			cmp al, 'N'
			ret

convertLength endp


convertWeight proc
	lea edx, choseWeight ;clarifies which procedure user chose
	call writeString
	call crlf

	lea edx, whichWeightConvert
	call writeString
	call crlf

	;print the choices for which method to do
	lea edx, weightOp1
	call writeString

	lea edx, weightOp2
	call writeString

	lea edx, weightOp3
	call writeString
	call crlf

	mov edx, offset choice
	call readChar
	mov choice, al

	cmp al, '1'
	je pounds2ounces

	cmp al, '2'
	je kilograms2pounds

	cmp al, '3'
	je kilograms2grams

	start:
		pounds2ounces:
			lea edx, enterValue 
			call writeString
			call readDec

			mov value, eax		;see yards2feet
			mov edx, 16
			mul edx
			call crlf
			call crlf

			lea edx, result
			call writeString
			call writeDec
			call crlf
			call crlf

			;after calculating, ask user if they want to do another procedure
			lea edx, anotherProc
			call writeString
			call crlf

			mov edx, offset choice
			call readChar
			mov choice, al

			cmp al, 'Y'
			je main

			cmp al, 'N'
			ret

		kilograms2pounds:
			lea edx, enterValue 
			call writeString
			call readDec

			mov value, eax		;see yards2feet
			mov edx, 2
			mul edx
			call crlf
			call crlf

			lea edx, result
			call writeString
			call writeDec
			call crlf
			call crlf

			;after calculating, ask user if they want to do another procedure
			lea edx, anotherProc
			call writeString
			call crlf

			mov edx, offset choice
			call readChar
			mov choice, al

			cmp al, 'Y'
			je main

			cmp al, 'N'
			ret

		kilograms2grams:
			lea edx, enterValue 
			call writeString
			call readDec

			mov value, eax		;see yards2feet
			mov edx, 1000
			mul edx
			call crlf
			call crlf

			lea edx, result
			call writeString
			call writeDec
			call crlf
			call crlf

			;after calculating, ask user if they want to do another procedure
			lea edx, anotherProc
			call writeString
			call crlf

			mov edx, offset choice
			call readChar
			mov choice, al

			cmp al, 'Y'
			je main

			cmp al, 'N'
			ret
	

convertWeight endp


convertCurrency proc
	lea edx, choseCurrency ;clarifies which procedure user chose
	call writeString
	call crlf

	lea edx, whichCurrencyConvert
	call writeString
	call crlf

	;print the choices for which method to do
	lea edx, currencyOp1
	call writeString

	lea edx, currencyOp2
	call writeString

	lea edx, currencyOp3
	call writeString
	call crlf

	mov edx, offset choice
	call readChar
	mov choice, al

	cmp al, '1'
	je us2euro

	cmp al, '2'
	je us2pound

	cmp al, '3'
	je us2yen

	start:
		us2euro:
			lea edx, enterValue 
			call writeString
			call readDec

			mov value, eax		;see yards2feet
			mov edx, 1
			mul edx
			call crlf
			call crlf

			lea edx, result
			call writeString
			call writeDec
			call crlf
			call crlf

			;after calculating, ask user if they want to do another procedure
			lea edx, anotherProc
			call writeString
			call crlf

			mov edx, offset choice
			call readChar
			mov choice, al

			cmp al, 'Y' 
			je main

			cmp al, 'N'
			ret

		us2pound:
			lea edx, enterValue 
			call writeString
			call readDec

			mov value, eax		;see yards2feet
			mov edx, 1
			mul edx
			call crlf
			call crlf

			lea edx, result
			call writeString
			call writeDec
			call crlf
			call crlf

			;after calculating, ask user if they want to do another procedure
			lea edx, anotherProc
			call writeString
			call crlf

			mov edx, offset choice
			call readChar
			mov choice, al

			cmp al, 'Y'
			je main

			cmp al, 'N'
			ret


		us2yen:
			lea edx, enterValue 
			call writeString
			call readDec

			mov value, eax		;see yards2feet
			mov edx, 112
			mul edx
			call crlf
			call crlf

			lea edx, result
			call writeString
			call writeDec
			call crlf
			call crlf

			;after calculating, ask user if they want to do another procedure
			lea edx, anotherProc
			call writeString
			call crlf

			mov edx, offset choice
			call readChar
			mov choice, al

			cmp al, 'Y'
			je main

			cmp al, 'N'
			ret

convertCurrency endp


changeTime proc
	lea edx, choseTime ;clarifies which procedure user chose
	call writeString
	call crlf

	lea edx, timePrompt 
	call writeString
	call readDec
	mov value, eax

	cmp value, 1200
	jge pm

	cmp value, 100
	jge am

	cmp value, 2400
	jge midnight

	cmp value, 0
	jge midnight1 

	pm:
			mov eax, value
			mov ebx, 1200
			sub eax, ebx
			call crlf
			call crlf 

			lea edx, timeResult
			call writeString
			call writeDec
			call crlf
			call crlf
			
			;after calculating, ask user if they want to do another procedure
			lea edx, anotherProc
			call writeString
			call crlf

			mov edx, offset choice
			call readChar
			mov choice, al

			cmp al, 'Y'
			je main

			cmp al, 'N'
			ret
	
		am:
			mov eax, value
			call crlf
			call crlf

			lea edx, timeResult
			call writeString
			call writeDec
			call crlf
			call crlf

			;after calculating, ask user if they want to do another procedure
			lea edx, anotherProc
			call writeString
			call crlf

			mov edx, offset choice
			call readChar
			mov choice, al

			cmp al, 'Y'
			je main

			cmp al, 'N'
			ret

		midnight:
			mov eax, value
			call crlf
			call crlf 

			lea edx, timeResult
			call writeString
			call writeDec
			call crlf
			call crlf

			;after calculating, ask user if they want to do another procedure
			lea edx, anotherProc
			call writeString
			call crlf

			mov edx, offset choice
			call readChar
			mov choice, al

			cmp al, 'Y'
			je main

			cmp al, 'N'
			ret

		midnight1:
			mov eax, value
			call crlf
			call crlf

			lea edx, timeResult
			call writeString
			call writeDec
			call crlf


			;after calculating, ask user if they want to do another procedure
			lea edx, anotherProc
			call writeString
			call crlf

			mov edx, offset choice
			call readChar
			mov choice, al

			cmp al, 'Y'
			je main

			cmp al, 'N'
			ret

		


changeTime endp

end main


