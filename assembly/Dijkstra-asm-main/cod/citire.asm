.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf:proc
extern fscanf :proc
extern fopen :proc
extern malloc :proc
.data
	c1 db 0
	c2 db 0
	num1 dd 0
	num2 dd 0
	d  dd 0
	pointer dd 0
	caracter db 0
	auxiliar_string db 100 dup(0)
	muchie dd 0
	
	
	citire2 db "%c %c %d%c",0
	citirefile db "r",0
	pointerfisier dd 0



.code

identifica proc;se pune pe stiva numarul de noduri,pointerul la numele nodurilor si in EAX nodul cautat
	push EBP
	mov EBP ,ESP
	push EBX
	push ECX
	push ESI
	push EDX
	
	mov ESI,[EBP+8]
	mov EBX,[EBP+12]
	mov ECX,0
	
	again:
		mov DL,[ESi+ECX]
		cmp DL,AL
			jne continua
			mov EAX,ECX
			jmp finish
		continua:
	inc ECX
	cmp ECX,EBX
	jl again
	
	mov EAX,-1
	
	finish:
	pop EDX
	pop ESI
	pop ECX
	pop EBX
	pop EBP
	ret 8;
identifica endp

citeste macro n1,nods,nodf,m,numenoduri1,muchii
local next,bun,fa_zero,loop1,again,finish,continua

	push offset citirefile          ;deschidere fisier
	push offset namefile
	call fopen
	add ESP ,8
	mov pointerfisier ,EAX
	
	push offset auxiliar_string;;         ;eliminare text
	push offset format_string
	push pointerfisier
	call fscanf
	add ESP,12
	
	push offset n1;                        ;citire numar noduri
	push offset format_integer
	push pointerfisier
	call fscanf
	add ESP,12
	
	push n1                               ;alocare meorie pentru nume noduri 
	call malloc
	add ESP,4
	mov numenoduri1,EAX
	
	push offset auxiliar_string;        ;eliminare text 
	push offset format_string
	push pointerfisier
	call fscanf
	add ESP,12
	push offset auxiliar_string;        
	push offset format_string
	push pointerfisier
	call fscanf
	add ESP,8
	
	mov EBX ,0           ;for(ebx=0;ebx<n1;ebx++)
	next:
		
		push offset caracter;                        ;citire caracter
		push offset format_char
		push pointerfisier
		call fscanf
		add ESP,12
		mov AL ,caracter
		
		cmp AL ,'A'             ;if(AL = litera)
		jb next
		cmp AL ,'z'
		ja next                  
		cmp AL ,'Z'
		jbe bun 
		cmp AL ,'a'
		jb  next
		bun:                  ;then
		
		mov EDX ,numenoduri1
		mov [EDX+EBX],AL
		inc EBX					;end if 
	cmp EBX ,n1
	jne next            ;end for 
	
	push offset auxiliar_string;;         ;eliminare text
	push offset format_string
	push pointerfisier
	call fscanf
	add ESP,12
	push offset auxiliar_string;;         ;eliminare text
	push offset format_string
	push pointerfisier
	call fscanf
	add ESP,12
	push offset auxiliar_string;;         ;eliminare text
	push offset format_string
	push pointerfisier
	call fscanf
	add ESP,12
	
	push offset c1;                        ;citire nod de start
	push offset format_char
	push pointerfisier
	call fscanf
	add ESP,12
	
	mov AL,c1               ;se stabileste un numar nodului de start      
	push n1
	push numenoduri1
	call identifica
	mov nods,EAX
	
	push offset auxiliar_string;;         ;eliminare text
	push offset format_string
	push pointerfisier
	call fscanf
	add ESP,12
	push offset auxiliar_string;;         ;eliminare text
	push offset format_string
	push pointerfisier
	call fscanf
	add ESP,12
	push offset auxiliar_string;;         ;eliminare text
	push offset format_string
	push pointerfisier
	call fscanf
	add ESP,12
	
	push offset c1;                        ;citire nod de start
	push offset format_char
	push pointerfisier
	call fscanf
	add ESP,12
	
	mov AL,c1               ;se stabileste un numar nodului de start      
	push n1
	push numenoduri1
	call identifica
	mov nodf,EAX
	
	
	
	push offset auxiliar_string;         ;eliminare text
	push offset format_string
	push pointerfisier
	call fscanf
	add ESP,12
	push offset auxiliar_string;         
	push offset format_string
	push pointerfisier
	call fscanf
	add ESP,12
	
	push offset m;                        ;citire numar muchii
	push offset format_integer
	push pointerfisier
	call fscanf
	add ESP,12
	
	push offset auxiliar_string;         ;eliminare text
	push offset format_string
	push pointerfisier
	call fscanf
	add ESP,12
	
	mov EAX,n1                 ;alocam memorie pentru pointerii la muchie 
	mov EBX,dword ptr 4
	mul EBX
	push EAX
	call malloc
	add ESP,4
	mov muchii,EAX
	
	mov ECX,0                           ;initializarea pointerilor
	fa_zero:
		mov [EAX+ECX*4],dword ptr 0
		inc ECX
	cmp ECX,n1
	jl fa_zero
	
	
	
	
	
	
	MOV ecx,0
	loop1:
	push ECX
		
		push offset caracter       ;se citeste nodul 1 ,nodul doi si distanta
		push offset d
		push offset c2
		push offset c1
		push offset citire2
		push pointerfisier
		call fscanf
		add ESP,24
		
		mov AL,c1               ;se stabileste un numar nodului 1      
		push n1
		push numenoduri1
		call identifica
		mov num1,EAX
		
		mov AL,c2               ;;se stabileste un numar nodului 2
		push n1
		push numenoduri1
		call identifica
		mov num2,EAX;
		
		mov EAX,num1
		mov EBX,4
		mul EBX
		add EAX,muchii
		mov muchie,EAX
		push_list num2,d,muchie	
		
		; mov EAX,num2
		; mov EBX,4
		; mul EBX
		; add EAX,muchii
		; mov muchie,EAX
		; push_list num1,d,muchie	
		
	pop ECX
	inc ECX
	cmp ECX,m
	jl loop1
	
	; mov EAX,muchii
	
	; mov EAX,[EAX]
	; mov EAX,[EAX]
	; mov EAX,[EAX+4]
	; push EAX
	; push offset format_integer
	; call printf
	; add ESP,8
	
endm