; Timmy Glynn
; Program 3

include Irvine32.inc

.data
	beginProgram db "Enter '1' to begin", 0ah, 0dh, 0
	break db "......................................................", 0ah, 0dh, 0	;makes the table look clean 
	
	;list the steps so the user understands what tasks are being performed and in what order
	step1 db "Step 1: Read 10 integers and store them in an array ", 0ah, 0dh, 0
	step2 db "Step 2: Reverse the array and shift the elements once to the left ", 0ah, 0dh, 0
	step3 db "Step 3: Insert 42 at random position ", 0ah, 0dh, 0
	step4 db "Step 4: Delete the 5th element ", 0ah, 0dh, 0
	step5 db "Step 5: Calculate the sum ", 0ah, 0dh, 0
	step6 db "Step 6: Sort the array", 0ah, 0dh, 0
	step7 db "Step 7: Search for a key ", 0ah, 0dh, 0

	;enter the 10 integers for the array
	enterNums db "Enter 10 elements", 0ah, 0dh, 0

	;explain what each array is before printing the arrays
	PrintArray1 db "The 10 integer array is: ", 0ah, 0dh, 0
	PrintArray2 db "The reversed and shifted array is: ", 0ah, 0dh, 0
	PrintArray3 db "The array with 42 inserted randomly is: ", 0ah, 0dh, 0
	PrintArray4 db "The array with 5th element deleted is: ", 0ah, 0dh, 0
	PrintArray5 db "The 2D array is: ", 0ah, 0dh, 0
	PrintArray6 db "The sorted array is: ", 0ah, 0dh, 0

	;integer declarations
	int1 dword ?
	int2 dword ?
	int3 dword ?
	int4 dword ?
	int5 dword ?
	int6 dword ?
	int7 dword ?
	int8 dword ?
	int9 dword ?
	int10 dword ?
	randval dword ?

	;data for the sums in the 2D array proc (task5)
	sum1 dword ?
	sum2 dword ?
	sum3 dword ?
	sum4 dword ?
	sum5 dword ?
	rowSum db " The sum of this row is: ", 0

	;data for the key search proc (task7)
	first dword 0
	last dword 4
	mid dword ?
	key dword ?
	keyEnter db "Enter the key ", 0ah, 0dh, 0
	keyFound db "the key is found at position: ", 0
	keyNotFound db "the key wasnt found ", 0ah, 0dh, 0

	;counters for each task - unnecessary but it helped me understand better
	maincount dword 1
	task1count dword 10
	task2count dword 10
	task3count dword 10
	task4count dword 1
	task5count dword 1
	task6count dword 4

	;other data useful for array manipulation
	flag dword 0
	space db " ", 0
	num dword 0

	;arrays
	array1 Dword 10 DUP (?)
	array2 Dword 10 DUP (?)
	array3 Dword 10 DUP (?)
	array4 Dword 5 DUP (?)

	;restart string
	askRestart db "Enter '2' if you want to restart ", 0ah, 0dh, 0

.code 
main proc

	mov edx, offset break
	call writeString
	
	mov edx, offset step1
	call writeString
	
	mov edx, offset step2
	call writeString
	
	mov edx, offset step3
	call writeString
	
	mov edx, offset step4
	call writeString
	
	mov edx, offset step5
	call writeString
	
	mov edx, offset step6
	call writeString
	
	mov edx, offset step7
	call writeString
	
	mov edx, offset break
	call writeString
	
	mov edx, offset beginProgram
	call writeString

	call readChar
	cmp al, '1'				;start the program by entering 1
	je main1
	jmp stop

	main1:
		call task1	;call first step
		call crlf
	jmp stop

	stop:
		mov edx, offset askRestart
		call writeString
		call readChar
		cmp al, '2'
		mov eax, 1
		mov maincount, eax

		je main				;repeat the program if user enters 2

exit
main endp

task1 proc

	mov edx, offset enterNums
	call writeString
	mov ecx, task1count
	mov esi, offset array1		;reads numbers and stores in array1

	task1Start1:
		call readDec
		mov [esi], eax
		add esi, type array1
	loop task1Start1

		mov esi, offset array1
		mov ecx, task1count
		mov edx, offset PrintArray1 
		call writeString 

	task1Start2:
		mov eax, [esi]
		call writeDec
		mov edx, offset space
		call writeString
		add esi, type array1
	Loop task1Start2

call crlf
call task2				;go to task2

ret
task1 endp

task2 proc
	
	call crlf
	mov esi, offset array1
	mov ecx, task2count

	task2Start1:
		mov eax, [esi]
		push eax
		add esi, type array1
	loop task2Start1

		mov ecx, task2count
		mov esi, offset array2

	task2Start2:
		pop eax
		mov [esi], eax
		add esi, type array2
	loop task2Start2

	mov ecx, task2count
	mov esi, offset array2	;declare array2

	mov eax, [esi]			
	shl eax, 1				;shift each integer to the left one time
	mov int1, eax
	add esi, type array2	;move it into array2 .....

	mov eax, [esi]
	shl eax, 1
	mov int2, eax
	add esi, type array2

	mov eax, [esi]
	shl eax, 1
	mov int3, eax
	add esi, type array2

	mov eax, [esi]
	shl eax, 1
	mov int4, eax
	add esi, type array2

	mov eax, [esi]
	shl eax, 1
	mov int5, eax
	add esi, type array2

	mov eax, [esi]
	shl eax, 1
	mov int6, eax
	add esi, type array2

	mov eax, [esi]
	shl eax, 1
	mov int7, eax
	add esi, type array2

	mov eax, [esi]
	shl eax, 1
	mov int8, eax
	add esi, type array2

	mov eax, [esi]
	shl eax, 1
	mov int9, eax
	add esi, type array2

	mov eax, [esi]
	shl eax, 1
	mov int10, eax
	add esi, type array2			;... finish shifting

	mov esi, offset array3			;declare array3

	mov eax, int1					;insert each integer into array3...
	mov [esi], eax
	add esi, type array3

	mov eax, int2
	mov [esi], eax
	add esi, type array3

	mov eax, int3
	mov [esi], eax
	add esi, type array3

	mov eax, int4
	mov [esi], eax
	add esi, type array3

	mov eax, int5
	mov [esi], eax
	add esi, type array3

	mov eax, int6
	mov [esi], eax
	add esi, type array3

	mov eax, int7
	mov [esi], eax
	add esi, type array3

	mov eax, int8
	mov [esi], eax
	add esi, type array3

	mov eax, int9
	mov [esi], eax
	add esi, type array3

	mov eax, int10
	mov [esi], eax				;... finish inserting

	mov esi, offset array3
	mov ecx, task2count
	mov edx, offset PrintArray2
	call writeString

	task2Start3:
		mov eax, [esi]
		call writeDec
		mov edx, offset space
		call writeString
		add esi, type array3
	loop task2Start3

call crlf
call task3			;go to task3

ret
task2 endp

task3 proc		;THIS WAS WORKING FINE, IDK WHY IT DOESNT NOW...??????

	call randProc	;calls randomizing procedure for random place in array

	mov ecx, task3count
	mov esi, offset array1

	task3Start1: 
		mov eax, randval		;randval from randProc
		cmp eax, task3count 	;if counter=randval then it will insert 42 into that pos
		je set
		inc task3count
		add esi, type array1
	loop task3Start1

	begin:
		mov esi, offset array1
		mov ecx, task3count
		mov edx, offset PrintArray3
		call writeString

	task3Start2:
		mov eax, [esi]
		mov edx, offset space
		call writeString
		call writeDec
		add esi, type array1
	loop task3Start2
	jmp task3Stop1

	set:
		mov eax, 42			;insert 42 into the array at randval!
		mov [esi], eax
		jmp begin

	task3Stop1:
		call crlf
		call task4

ret 
task3 endp

randProc proc			;random proc (taken from class notes)
	call Randomize

	mov eax, 10			
	call RandomRange
	inc eax
	mov randval, eax

	call crlf

ret 
randProc endp

task4 proc

	call crlf
	mov task4count, 1
	mov ecx, 4
	mov esi, offset array2
	mov edx, offset PrintArray4
	call writeString

	task4Start1:
		mov eax, [esi]
		mov edx, offset space
		call writeString
		call writeDec
		add esi, type array2
	loop task4Start1

	add esi, type array2

	mov ecx, 5

	task4Start2:
		mov eax, [esi]
		mov edx, offset space
		call writeString
		call writeDec
		add esi, type array2
	loop task4Start2

call crlf
call task5		;go to task5

ret
task4 endp

task5 proc				;mostly taken from class notes from 2D array program

	call crlf
	mov edx, offset PrintArray5
	call writeString
	mov esi, offset array2
	mov ecx, 5			;outer loop

	task5L1:
		push ecx		;push it into the stack
		mov ecx, 2		;inner loop
	task5L2:
		mov eax, [esi]	
		call writeDec	
		add num, eax	
		mov eax, " "
		call writeChar

	add esi, type array2

	loop task5L2

	mov eax, task5count
	cmp eax, 1
	je check1
	cmp eax, 2
	je check2
	cmp eax, 3
	je check3
	cmp eax, 4
	je check4 
	cmp eax, 5
	je check5
	jmp continue
	continue :
	inc task5count
	pop ecx 
	loop task5L1
	jmp finish

	check1 :						;calculate the sums
		mov eax, num
		mov edx, offset rowSum
		call writeString
		call writeDec
		call crlf
		mov sum1, eax
		mov num, 0
		jmp continue

	check2:
		mov eax, num
		mov edx, offset rowSum
		call writeString
		call writeDec
		call crlf 
		mov sum2, eax
		mov num, 0
		jmp continue

	check3:
		mov eax, num
		mov edx, offset rowSum
		call writeString
		call writeDec
		call crlf 
		mov sum3, eax
		mov num, 0
		jmp continue

	check4:
		mov eax, num
		mov edx, offset rowSum
		call writeString
		call writeDec
		call crlf 
		mov sum4, eax
		mov num, 0
		jmp continue

	check5:
		mov eax, num
		mov edx, offset rowSum
		call writeString
		call writeDec
		call crlf 
		mov sum5, eax
		mov num, 0
		jmp continue

	finish:
		mov esi, offset array4

	mov eax, sum1			;move the sums into an array (array4)
	mov [esi], eax
	add esi, type array4	;increment the index by its type (for each sum)

	mov eax, sum2
	mov [esi], eax
	add esi, type array4

	mov eax, sum3
	mov [esi], eax
	add esi, type array4

	mov eax, sum4
	mov [esi], eax
	add esi, type array4

	mov eax, sum5
	mov [esi], eax


call crlf
call task6

ret 
task5 endp

task6 proc				;from bsort program in class

	while1:				;while loop - set pointer to top of stack
		mov esi, offset array4
		cmp flag, 0
		jne done
		mov flag, 1		;if flag is != 0, while loop stops

		mov ecx, task6count	;for loop - ecx is loop counter, this tells how many times to loop

	task6Start1:
		mov al, [esi]	;the value that esi is pointing to goes into al
		cmp al, [esi + 1]	;compare whatever is in esi to whatever is next (cant cmp [esi], [esi+1] mem to mem)
		jb doxchg
		jmp go

	doxchg:
		xchg al, [esi + 1]	;exchange numbers if they are not 
		mov [esi], al

		mov flag, 0	;if there is exchange, the value of flag will be 0 and loop will be executed

	go:			;no exchange
		add esi, type array4	;add esi 1 - increment index
		
		
	loop task6Start1
	dec task6count		;decrement counter so we dont keep looping 
	jmp while1

	done:
		mov edx, offset PrintArray6
		call writeString
		mov ecx, 5
		mov esi, offset array4
	task6L1:
		mov eax, 0
		mov al, [esi]
		call writeDec
		mov eax, " "	;space in between numbers
		call writeChar
		add esi, type array4
	loop task6L1

	task6Stop1:
		call task7

ret 
task6 endp

task7 proc

	mov edx,  offset keyEnter
	call writeString
	call readDec
	mov key, eax		;enter the key

	mov first, 0
	mov last, 4

	task7Start1:
		mov eax, first
		cmp eax, last
		jg notfound		;if first > last, key is not found

		add eax, last	;first + last
		shr eax, 1		;divide eax by 2, (first + last)/2
		mov mid, eax

		mov esi, mid
		shl esi, 2		;scale mid value
		mov eax, esi

		mov ecx, key
		cmp ecx, array4[esi]
		je found
		jl changefirst
		jg changelast

	changelast:
		mov edx, mid	;last = mid-1
		mov last, edx
		dec last
		jmp task7Start1

	changefirst:
		mov edx, mid	;first = mid+1
		mov first, edx
		inc first
		jmp task7Start1

	found:
		mov edx, offset keyFound
		call writeString
		mov eax, mid		;if the key is found, it is in mid
		call writeDec
		jmp stop

	notfound:
		mov edx, offset keyNotFound
		call writeString

	stop:
		ret

task7 endp

end main
