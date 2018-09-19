; Timmy Glynn 
; TITLE: Assignment1
  
   
include Irvine32.inc  
.data
 
;set number variables
;set a variable to enter choices 
	num1 word  ?  
	num2 word  ?  
	choice Byte ?
	  
;Ask user which algorithmic operation they want to do (+, -, /, *)
chooseOp  Byte "Choose an algorithmic operation to perform (case sensitive): ", 0ah, 0dh, 0  
	addOp Byte "Addition (a) ", 0ah, 0dh, 0  
	subOp Byte "Subtraction (s) ", 0ah, 0dh, 0  
	mulOp Byte "Multiplication (m) ", 0ah, 0dh, 0  
	divOp Byte "Division (d) ", 0ah, 0dh, 0 

;Make strings for when user chooses their option ("You chose...")
;Error message when user chooses division and sets denominator as zero
	choseAdd Byte "You chose addition!", 0ah, 0dh, 0
	choseSub Byte "You chose subtraction!", 0ah, 0dh, 0
	choseMul Byte "You chose multiplication!", 0ah, 0dh, 0
	choseDiv Byte "You chose division!", 0ah, 0dh, 0  
	divError Byte "Cannot divide by zero! Try again. ", 0ah, 0dh, 0 

;"Enter number..." strings
enter1 Byte "Enter the first number: ", 0ah, 0dh, 0  
enter2 Byte "Enter the second number: ", 0ah, 0dh, 0  
result Byte "The result is: ", 0  

;Set strings for partB
;NewOp(n) are the choices
;choseNewOp(n) are displayed when user choses their option 
chooseNewOpCalc Byte "Do you want to do another calculation? yes(y) or no(n)? " 
chooseNewOp Byte "Choose a binary operation to perform (case sensitive): ", 0ah, 0dh, 0 
	NewOp1 Byte "Shift-right (1)", 0ah, 0dh, 0 
	NewOp2 Byte "Shift-left (2)", 0ah, 0dh, 0 
	NewOp3 Byte "Rotate-right (3)", 0ah, 0dh, 0 
	NewOp4 Byte "Rotate-left (4)", 0ah, 0dh, 0 
	NewOp5 Byte "AND (5)", 0ah, 0dh, 0 
	NewOp6 Byte "OR (6)", 0ah, 0dh, 0 
	NewOp7 Byte "XOR (7)", 0ah, 0dh, 0 

	choseNewOp1 Byte "You chose shift right", 0ah, 0dh, 0
	choseNewOp2 Byte "You chose shift left", 0ah, 0dh, 0
	choseNewOp3 Byte "You chose rotate right", 0ah, 0dh, 0
	choseNewOp4 Byte "You chose rotate left", 0ah, 0dh, 0
	choseNewOp5 Byte "You chose AND", 0ah, 0dh, 0
	choseNewOp6 Byte "You chose OR", 0ah, 0dh, 0
	choseNewOp7 Byte "You chose XOR", 0ah, 0dh, 0
   
.code  
main proc  
 
 ;call all the "choose op..." strings 
start:  
	lea edx, chooseOp								
	call writeString   
	call crlf  
  
	lea edx, addOp  
	call writeString  
	call crlf  
  
	lea edx, subOp  
	call writeString  
	call crlf  
  
	lea edx, mulOp  
	call writeString  
	call crlf  
  
	lea edx, divOp  
	call writeString  
	call crlf  
  
	mov edx, offset choice  
	call readChar  
	mov choice, al  
  
  ;set the choices (a, s, m, d) to the corresponding methods (a for addition, s for subtraction, etc)
	cmp al, 'a'  
	je Addition  
  
	cmp al, 's'  
	je Subtraction  
  
	cmp al, 'm'  
	je Multiplication  
  
	cmp al, 'd'  
	je Division  
 
 ;ALGORITHMIC OPERATION METHODS:
 ;	Addition
 ;	Subtraction
 ;	Multiplition
 ;	Divsision
 ;		Division has if statement where if the denominator is zero, redo division
 ;		If the denominator is not zero, continue

Addition:   
	mov edx, offset choseAdd  
	call writeString  
	call crlf   
  
	mov  edx, offset enter1  
	call writeString  
	call readDec  
	mov  num1, ax  
  
	mov  edx, offset enter2  
	call writeString  
	call readDec  
	mov  num2, ax  
  
	call crlf  
  
	mov edx, offset result 
	call writeString  
	mov ax, num1  
	add ax, num2  
	call WriteDec  
	call crlf  
	call crlf  
	jmp NewOp 
 
	jmp stop 
	jmp start  
  
Subtraction:  
	mov edx, offset choseSub   
	call writeString  
	call crlf   
  
	mov edx, offset enter1  
	call writeString  
	call readDec  
	mov num1, ax  
  
	mov edx, offset enter2  
	call writeString  
	call readDec  
	mov  num2, ax  
  
	call crlf  
  
	mov edx, offset result 
	call writeString  
	mov ax, num1  
	sub ax, num2  
	call WriteDec  
	call crlf  
	call crlf  
	jmp NewOp

	jmp stop 
	jmp start  
  
Multiplication:  
	mov edx, offset choseMul   
	call writeString  
	call crlf   
  
	mov edx, offset enter1  
	call writeString  
	call readDec  
	mov num1, ax  
  
	mov edx, offset enter2  
	call writeString  
	call readDec  
	mov num2, ax  
  
	call crlf  
  
	mov edx, offset result 
	call writeString  
	mov ax, num1  
	mov bx, num2  
	mul bx  
	call WriteDec  
	call crlf  
	call crlf  
	jmp NewOp

	jmp stop 
	jmp start  
  
Division:  
	mov edx, offset choseDiv  
	call writeString  
	call crlf   
  
	mov edx, offset enter1  
	call writeString  
	call readDec  
	mov num1, ax  
  
	mov edx, offset enter2  
	call writeString  
	call readDec  
	mov num2, ax    
 
	cmp ax, 00 
	jz denZero 
 
	cmp ax,00 
	jnz denNonZero 
 
	denZero: 
		lea edx, divError 
		call writeString 
		jmp Division 
 
	call crlf  
 
	denNonZero:  
		mov edx, offset result 
		call writeString  
		mov ax, num1  
		mov bx, num2  
		mov dx, 0  
		div bx  
		call writeDec  
		call crlf  
		call crlf  
		jmp NewOp

	jmp stop 
	jmp start 
 
;Setting up Part B
;Call all the option strings
NewOp: 
	lea edx, NewOp1
	call writeString 
	call crlf 
 
	lea edx, NewOp1 
	call writeString 
	call crlf 
 
	lea edx, NewOp2 
	call writeString 
	call crlf 
 
	lea edx, NewOp3 
	call writeString 
	call crlf 
 
	lea edx, NewOp4 
	call writeString 
	call crlf 
 
	lea edx, NewOp5 
	call writeString 
	call crlf 
 
	lea edx, NewOp6 
	call writeString 
	call crlf 
 
	lea edx, NewOp7 
	call writeString 
 
 
	mov edx, offset choice 
	call readChar 
	mov choice, al 
 
 ;set the choice values (1, 2, 3, 4, 5, 6, 7) to its corresponding method (1 = shift right, 2 = shift left, etc)
	cmp al,'1' 
	je  shrOp
 
	cmp al,'2' 
	je  shlOP 
 
	cmp al,'3' 
	je  rorOp 
 
	cmp al,'4' 
	je  rolOp 
 
	cmp al,'5' 
	je  andOp 
 
	cmp al,'6' 
	je  orOp 
 
	cmp al,'7' 
	je  xorOp 
 
 ;BINARY OPERATION METHODS
 ;	shift right
 ;	shift left
 ;	rotate right
 ;	rotate left
 ;	AND
 ;	OR
 ;	XOR

shrOp: 
	mov edx, offset choseNewOp1
	call writeString
	call crlf 

	mov edx, offset enter1
	call writeString
	call readDec
	mov num1, ax

	call crlf

	mov edx, offset result
	call writeString
	mov ax, num1
	SHR ax,1
	call WriteDec
	call crlf
	call crlf
	jmp NewOpCalc

shlOp: 
	mov edx, offset choseNewOp2
	call writeString
	call crlf 

	mov edx, offset enter1
	call writeString
	call readDec
	mov num1, ax

	call crlf

	mov edx, offset result
	call writeString
	mov ax, num1
	SHL ax,1
	call WriteDec
	call crlf
	call crlf
	jmp NewOpCalc
 
rorOp: 
	mov edx, offset choseNewOp3
	call writeString
	call crlf 

	mov edx, offset enter1
	call writeString
	call readDec
	mov num1,ax

	call crlf

	mov edx, offset result
	call writeString
	mov ax, num1
	ror ax, 1
	call WriteDec
	call crlf
	call crlf
	jmp NewOpCalc

rolOp: 
	mov edx, offset choseNewOp4
	call writeString
	call crlf 

	mov edx, offset enter1
	call writeString
	call readDec
	mov num1, ax
	call crlf

	mov edx, offset result
	call writeString
	mov ax, num1
	ROL ax,1
	call writeDec
	call crlf
	call crlf
	jmp NewOpCalc

andOp: 
	mov edx, offset choseNewOp5
	call writeString
	call crlf 

	mov edx, offset enter1
	call writeString
	call readDec
	mov num1, ax

	mov edx, offset enter2
	call writeString
	call readDec
	mov num2, ax

	call crlf

	mov edx, offset result
	call writeString
	mov ax, num1
	and ax, num2
	call WriteDec
	call crlf
	call crlf
	jmp NewOpCalc

orOp: 
	mov edx, offset choseNewOp6
	call writeString
	call crlf 

	mov edx, offset enter1
	call writeString
	call readDec
	mov num1, ax

	mov edx, offset enter2
	call writeString
	call readDec
	mov num2, ax

	call crlf

	mov edx, offset result
	call writeString
	mov ax, num1
	or ax, num2
	call WriteDec
	call crlf
	call crlf
	jmp NewOpCalc 

xorOp: 
	mov edx, offset choseNewOp7
	call writeString
	call crlf 

	mov edx, offset enter1
	call writeString
	call readDec
	mov num1, ax

	mov edx, offset enter2
	call writeString
	call readDec
	mov num2, ax

	call crlf

	mov edx, offset result
	call writeString
	mov ax, num1
	xor ax, num2
	call WriteDec
	call crlf
	call crlf
	jmp NewOpCalc

;Set string to ask if the use wants to perform another algorithmic calculation 
NewOpCalc:
	mov edx, offset chooseNewOpCalc
	call writeString 
	call crlf

	mov edx, offset choice
	call readChar

	mov choice, al
	cmp al, 'y'
	je start

	cmp al, 'n'
	je stop

stop:  
exit  
main endp  
end main  
