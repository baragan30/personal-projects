//Programul calculeaza numarul de numere prime din intervalul [a;b] cu ajutorul ciurului lui Erstotene

xor $0 $0 $0 // I0

addi $1 $0 24  //a //I1
addi $2 $0 35   //b  //i2

addi $7 $0 1 //incarcam adresa de memorie  //i3
sw $1 $7          // pe pozitiile 1 si 2 am pus intervalul  i4
addi $7 $0 2        //i5
sw $2 $7          //i6


addi $7 $7 1     //initializam v[0] si v[1] cu 0    //i7
sw $0 $7           //i8
addi $7 $7 1        //i9
sw $0 $7            //i10

addi $7 $0 1        //i11
addi $1 $0 103    //i12
addi $5 $0 4    ///acum avem 4 pe reg0 si 103 pe reg1 si 1 pe $7    //i13

subi $1 $1 1     //bucla1:    //i14
	sw $7 $1                 //i15
BSEZ $5 $1 -3     // => bucla1     //i16

//$1,2 indecsi           
//$3 - scrieri citiri memorie
//$7 - folosit pentru adresa memoriei

addi $1 $0 2          //i17
addi $4 $0 100         //i18

addi $7 $1 3     //loop1:       //i19
	lw $3 $7                   //i20
	BEQ $3 $0 5    //if ($3 == 0) sarim peste loop2     //i21

	add $2 $1 $0 	
	add $2 $2 $1		//loop2:
		addi $7 $2 3 
		sw $0 $7
	bsez $2 $4 -4      // =>loop2
	
addi $1 $1 1
bsez $1 $4 -10           //=>loop1
	

addi $7 $0 1
lw $1 $7       // initializam i cu a din [a b] 
addi $7 $0 2
lw $4 $7 
xor $5 $5 $5

addi $7 $1 3     	//loop3:
	lw $3 $7
	BEQ $3 $0 1   	 //if ($3 == 0) sarim peste adunare
		addi $5 $5 1
						//final if
	
addi $1 $1 1
bsez $1 $4 -6           //=>loop3
