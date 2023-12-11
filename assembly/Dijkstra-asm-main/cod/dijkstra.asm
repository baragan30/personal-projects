

.data
tati dd 0
nr_noduri dd 0
distanta dd 99999999
raspuns dd 0
raspuns1 dd 0
distante dd 0
nod_cur dd 0
coada dd 0
ruta dd 0
format_ruta db "Ruta %d :",0
format_raspuns db "Drumul de cost minim este :",0


.code
ma_dijkstrai proc;se pune pe stiva numarul de noduri,pointerul la numele nodurilor si in EAX nodul cautat
	push EBP
	mov EBP ,ESP
	mov EAX,[EBP+8]
	
	mov EDX,raspuns1
	mov ESI,coada
	mov [EDX+4*ESI],EAX
	inc coada
	mov nod_cur,EAX
	cmp EAX,nodf
	jne continuam_dijkstra
		inc ruta 
		push ruta
		push offset format_ruta
		call printf
		add ESP,8
		
		mov EDI ,0
		mov ESI,numenoduri
		mov EBX,raspuns1
		afisare1:
			mov EAX,numenoduri
			add EAX, [EBX+EDI*4]
			push [EAX]
			push offset format_char
			call printf
			add ESP,8
			inc EDI
		cmp EDI,coada
		jne afisare1
		
		
		mov EAX,nod_cur
		mov EBX,distante
		mov EBX,[EBX+4*EAX]
		push EBX
		push offset format_integer
		call printf
		add ESP,8
		
		push offset format_enter
		call printf
		add ESP,4                      ;;afisam rezultatul partial
		
		cmp EBX,distanta
		jge final_ma_dijckstrai
		
		mov distanta,EBX
		mov ECX,coada
		mov nr_noduri,ECX
		mov EBX,raspuns1
		mov ESI,raspuns
		
		parcurgere39:
			dec ECX
			mov EAX,[EBX+ECX*4]
			mov [ESI+ECX*4],EAX
			cmp ECX ,0
		jne parcurgere39
		
		jmp final_ma_dijckstrai
	continuam_dijkstra:
	
	mov EAX,nod_cur              ;se verifica daca nodul curent are vecini
	mov EBX,muchii
	mov EBX,[EBX+EAX*4]
	cmp EBX,dword ptr 0
	je final_ma_dijckstrai
		
	verificam_vecin:
	
	
	mov EAX,[EBX+4]              ;punem in EAX vecinul nodului curent
	mov ESI,tati
	cmp [ESI+EAX*4],dword ptr -2         ;verificam daca vecinul a fost parcurs
	jne vecin_parcurs        ;daca nu a fost parcurs
	
		mov ECX,nod_cur                ;punem tatal vecinului
		mov [ESI+EAX*4],ECX
		
		mov ESI,distante
		mov EDX,[ESI+ECX*4]            ;punem distanta pana la tata
		add EDX,[EBX+8]                 ;adaugam distanta pana la fiu
		mov [ESI+EAX*4],EDX
		
		push nod_cur
		push EBX
		push EAX
		call ma_dijkstrai
		pop EBX
		pop nod_cur
			
			
		vecin_parcurs:
		
		
		cmp [EBX],dword ptr 0
		je final_ma_dijckstrai
		mov EBX,[EBX]
		jmp verificam_vecin
		
	final_ma_dijckstrai:
	
	dec coada
	mov EAX,nod_cur         ;atribuim nodului de start tatal -2
	mov ESI,tati
	mov [ESI+EAX*4],dword ptr -2
	
	mov ESI,distante               ;reinitializam distanta
	mov [ESI+EAX*4],dword ptr 0
	
	
	pop EBP
	ret 4;
ma_dijkstrai endp

dijkstra macro n,m,nods,nodf,numenoduri,muchii
	local fa_minus2,fa_zero,fa_zero1,ma_dijkstrai1,continuam_dijkstra,vecin_parcurs,final_ma_dijckstrai,verificam_vecin
	mov EAX,n                     ;alocam memorie pentru pointerii la tati
	mov EBX,dword ptr 4
	mul EBX
	push EAX
	call malloc
	add ESP,4
	mov tati,EAX
	
	mov ECX,0                           ;initializarea pointerilor
	fa_minus2:
		mov [EAX+ECX*4],dword ptr -2
		inc ECX
	cmp ECX,n
	jl fa_minus2
	
	mov EAX,n                     ;alocam memorie pentru pointerii la tati
	mov EBX,dword ptr 4
	mul EBX
	push EAX
	call malloc
	add ESP,4
	mov raspuns,EAX
	
	mov ECX,0                           ;initializarea pointerilor
	fa_zero:
		mov [EAX+ECX*4],dword ptr 0
		inc ECX
	cmp ECX,n
	jl fa_zero
	
	mov EAX,n                     ;alocam memorie pentru pointerii la tati
	mov EBX,dword ptr 4
	mul EBX
	push EAX
	call malloc
	add ESP,4
	mov raspuns1,EAX
	
	mov ECX,0                           ;initializarea pointerilor
	fa_zero2:
		mov [EAX+ECX*4],dword ptr 0
		inc ECX
	cmp ECX,n
	jl fa_zero2
	
	
	mov EAX,n                     ;alocam memorie pentru pointerii la tati
	mov EBX,dword ptr 4
	mul EBX
	push EAX
	call malloc
	add ESP,4
	mov distante,EAX
	
	mov ECX,0                           ;initializarea pointerilor
	fa_zero1:
		mov [EAX+ECX*4],dword ptr 0
		inc ECX
	cmp ECX,n
	jl fa_zero1
	
	
	
	
	mov EAX,nods          ;atribuim nodului de start tatal -1
	mov ESI,tati
	mov [ESI+EAX*4],dword ptr -1
	push nods
	call ma_dijkstrai
	
	
		push offset format_raspuns
		call printf
		add ESP,4
		
		mov EDI ,0
		mov EBX,raspuns
		afisare_ultimatum:
			mov EAX,numenoduri
			add EAX, [EBX+EDI*4]
			push [EAX]
			push offset format_char
			call printf
			add ESP,8
			inc EDI
		cmp EDI,nr_noduri
		jne afisare_ultimatum
		
		push distanta
		push offset format_integer
		call printf
		add ESP,8
	

	
	
	
	
	
	


	
	
endm