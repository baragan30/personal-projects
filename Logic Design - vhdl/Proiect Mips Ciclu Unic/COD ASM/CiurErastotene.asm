//Programul calculeaza numarul de numere prime din intervalul [a;b] cu ajutorul ciurului lui Erstotene
//Programul functioneaza oricare ar fi a si b < 100 dar poate fi ajustat usor sa duca mult mai mult
xor $0 $0 $0

addi $1 $0 24  //a
addi $2 $0 35   //b

addi $7 $0 1 //incarcam adresa de memorie
sw $1 $7          // pe pozitiile 1 si 2 am pus intervalul
addi $7 $0 2
sw $2 $7


addi $7 $0 3     //initializam v[0] si v[1] cu 0    unde v = 3 (POINTER)
sw $0 $7       //STOCAM 0 LA POTIZIA *$7
addi $7 $0 4
sw $0 $7

addi $7 $0 1        // 1 vom pune pentru a marca ca numarul e posibil prim
addi $1 $0 105
addi $5 $0 6    ///acum avem 4 pe reg5 si 103 pe reg1 si 1 pe $7


subi $1 $1 1          //bucla1:    //for ($1 = 104 ;$1 <= 5 ;$1--)
	sw $7 $1          // initializam tot de la v[2] la v[100] cu 1 (nu uita ca v = 3)
BSEZ $5 $1 -3     // => bucla1

//$1,2 indecsi
//$3 - scrieri citiri memorie
//$7 - folosit pentru adresa memoriei
//$4 - stocheaza marimea vectorului
//$6 - variabila ajutatoare

addi $1 $0 2
addi $4 $0 100

addi $7 $1 3     //loop1:   for ($1 = 2 ; $1 <= 100 ;$1 ++)  $7 = $1 + v
	lw $3 $7       //se citeste v[$1]
	BEQ $3 $0 5    //if (v[$1] == 0) sarim peste loop2

	add $2 $1 $0
	add $2 $2 $1    //loop2: for ($2 = $1 ;$2 <=100; $2 += $1 )
		addi $7 $2 3    //$7 = &v[$2]
		sw $0 $7        //v[$2] = 0
	bsez $2 $4 -4      // =>loop2

addi $1 $1 1    //$1 ++
bsez $1 $4 -10           //=>loop1


addi $7 $0 1
lw $1 $7       // initializam i cu a din [a b]
addi $7 $0 2
lw $4 $7
xor $5 $5 $5   //$5 = 0   //$5 va fi contorul

addi $7 $1 3     	//loop3:    for ($1 = a ; $1<=b; $1++)
	lw $3 $7
	BEQ $3 $0 1   	 //if ($3 == 0) sarim peste adunare
		addi $5 $5 1              //numaram
						//final if
addi $1 $1 1
bsez $1 $4 -6           //=>loop3


addi $5 $5 0    // afisam $5 la infinit ,programul va sari aici
j 40        //Febra placuta la degete de la apasat pe buton la placuta
