;Timmy Glynn
;Assignment 4

include Irvine32.inc

.data

	;strings for main menu
	enterString Byte "Enter a string:",0ah, 0dh,0
	options Byte "Your options are: ", 0ah, 0dh, 0
	enterChoice	Byte "Enter your option: ", 0
	choice Byte ?
	op1		Byte "Enter 1 to: Write your string ", 0ah, 0dh, 0
	op2		Byte "Enter 2 to: Scan the string and replace the word 'Dog' with the word 'Cat' ", 0ah, 0dh, 0
	op3		Byte "Enter 3 to: Scan the string and replace the word 'A' with the word 'The ", 0ah, 0dh, 0
	op4		Byte "Enter 4 to: Scan the string for the word 'Fox' and make it plural ", 0ah, 0dh, 0
	op5		Byte "Enter 5 to: Reverse the string ", 0ah, 0dh, 0 
	op6		Byte "Enter 6 to: Count the number of vowels and consonants in the string and replace each vowel with the next consonant", 0ah, 0dh,0
	
	;error message
	error	Byte "Error. Try again!", 0ah, 0dh, 0

	;program data strings
	string1 Dword 100 DUP (0)
	string2 DWord 100 DUP (0)
	string3 DWord 100 DUP (0)

	;other program data
	reverse Byte " reversed is:", 0ah, 0dh, 0
	vowels Byte " The number of vowels is: ",0
	consonents Byte "The number of consonents is: ",0
	count dword 0

.code

main proc
	mov edx, offset enterString
	call writeString

	mainTask1:								
		mov edx, offset string1
		mov ecx, Sizeof string1

		call readString
		call crlf
		inc count
		mov ebx, count

	mov esi, offset string1
	mov edi, offset string2

	mov ecx, lengthof string1
	cld
	rep movsb

	mov edi, offset string2
	mov ecx, lengthof string2

	mainTask2:								
		mov eax, [edi]
		call writechar
		add edi, 1
		loop mainTask2
	
	call crlf
	call mainMenu					

main endp

mainMenu proc

	mov edx, offset options
	call writeString
	call crlf

	mov edx, offset op1
	call writeString
	call crlf

	mov edx, offset op2
	call writeString
	call crlf

	mov edx, offset op3
	call writeString
	call crlf

	mov edx, offset op4
	call writeString
	call crlf

	mov edx, offset op5
	call writeString
	call crlf

	mov edx, offset op6
	call writeString
	call crlf

	mov edx, offset enterChoice
	call writeString
	call readChar		
	call writeChar
	mov choice, al
	call crlf
	call crlf

	cmp al, "1"
	je Choice1

	cmp al, "2"
	je Choice2

	cmp al, "3"
	je Choice3

	cmp al, "4"
	je Choice4

	cmp al, "5"
	je Choice5

	cmp al, "6"
	je Choice6

	mov edx, offset error
	call writeString
	call crlf
	call crlf
	call mainMenu						

		Choice1:
			call main

		Choice2:
			call proc2

		Choice3:
			call proc3

		Choice4:
			call proc4

		Choice5:
			call proc5

		Choice6:
			call proc6

mainMenu endp

proc2 proc

		cld
		mov edi,offset string1
		mov ecx,lengthof string1
 
		proc2Start:
 			mov al,[esi]
			mov al,'D'
			repne scasb
			jne notfound 
            
			dec edi
			mov al, 'C'
			stosb
 
			mov al, 'a'
			stosb
 
			mov al, 't'
			stosb
 
		loop proc2Start

		mov edi,offset string1
		mov ecx,lengthof string1
 
		proc2Search:
			mov eax,[edi]
			call writechar
			add edi,type string1
			loop proc2Search
		    call crlf 
			call mainmenu
 
		notfound:
		   	mov edx, offset string1
			call writeString
			call crlf
			call crlf

	call mainMenu					

proc2 endp

proc3 proc

	cld
	mov edi, offset string1
	mov ecx, lengthof string1

	proc3Start:
		mov al, 'T'
		repne scasb
		jne notfound

		dec edi
		mov al,' '
		stosb
		mov al, ' '
		stosb
		mov al, 'A'
		stosb

		mov edi, offset string1
		mov ecx, lengthof string1

	proc3Print:
		mov eax, [edi]
		add edi, type string1
		loop proc3Print
		call crlf

	notfound:
		mov edx, offset string1
		call writeString
		call crlf
		call crlf

		call mainMenu

proc3 endp

proc4 proc					

	cld
	mov edi,offset   string1
	mov ecx,lengthof string1

	proc4Start:
	mov al,'F'							
	repne scasb
	jne notfound						
			

	dec edi

	mov al,'F'
	stosb
	mov al,'o'
	stosb
	mov al,'x'
	stosb
	mov al,'e'
	stosb
	mov al,'s'
	stosb

			
	mov edi,offset string1
	mov ecx,lengthof string1

	proc4Task:
		mov eax,[edi]
		call writechar					
		add edi,type string1
		loop proc4Task
		call crlf 
		jmp proc4Stop

	notfound:
		lea edx,string1
		call writeString				
		call crlf 

	proc4Stop:	
	call mainMenu							
	ret	
			
 
proc4 endp 

proc5 proc

	mov edx, offset string1
	call writeString
	mov edx, offset reverse
	call writeString

	mov edi, offset string1
	mov ecx, lengthof string1

	proc5Task1:							
		mov eax, [edi]
		push eax
		inc edi
		loop proc5Task1

	cld
	mov edi, offset string1
	mov esi, offset string3
	mov ecx, lengthof string1

	proc5Task2:
		pop eax
		mov [esi], eax
		call writeChar
		loop proc5Task2
		mov edx, offset string3

		call crlf
		call crlf
			
	call mainMenu					

proc5 endp

proc6 proc

	mov edi, offset string1
	mov ecx, lengthof string1
	.while (ecx < edx)
		mov eax, [edi]

	.if(al=='a')
		add count, 1
		mov al,'b'
		mov [edi], al

	.elseif(al=='A')
		add count, 1
		mov al, 'B'
		mov [edi], al

	.elseif(al=='e')
		add count, 1
		mov al, 'f'
		mov [edi], al

	.elseif(al=='E')
		add count, 1
		mov al, 'F'
		mov [edi], al

	.elseif(al=='i')
		add count, 1
		mov al, 'j'
		mov [edi], al

	.elseif(al=='I')
		add count, 1
		mov al, 'J'
		mov [edi], al

	.elseif(al=='o')
		add count, 1
		mov al, 'p'
		mov [edi], al

	.elseif(al=='O')
		add count, 1
		mov al, 'P'
		mov [edi], al

	.elseif(al=='u')
		add count, 1
		mov al, 'v'
		mov [edi], al

	.elseif(al=='U')
		add count, 1
		mov al, 'V'
		mov [edi], al

	.elseif(al=='y')
		add count, 1
		mov al, 'Z'
		mov [edi], al

	.elseif(al=='Y')
		add count, 1
		mov al, 'Z'
		mov [edi], al

	.endif
		inc edi
		inc ecx
.endw
	
	;vowel/consonent counting
	mov edx, offset vowels
	call writestring
	mov eax, count
	call writeDec
	call crlf
	call crlf
	mov edx, offset consonents
	mov eax, lengthof string1
	sub eax, count
	call writeDec
	call crlf
	call crlf
	mov edi, offset string1
	mov ecx, lengthof string1

	mov edx, offset string1
	call writeString
		
	call mainMenu					

proc6 endp

exit					

end main
