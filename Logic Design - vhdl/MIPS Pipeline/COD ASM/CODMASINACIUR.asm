"C:\Program Files\Java\jdk-15.0.2\bin\java.exe" "-javaagent:D:\aplicatii\IntelliJ IDEA Community Edition 2020.3.2\lib\idea_rt.jar=61230:D:\aplicatii\IntelliJ IDEA Community Edition 2020.3.2\bin" -Dfile.encoding=UTF-8 -classpath D:\Proiecte\Java\Compilator\out\production\Compilator com.company.Main
addi $1 $0 24   ==> 001_000_001_0011000                      -> 0 --  (0)
addi $2 $0 35   ==> 001_000_010_0100011                      -> 1 --  (1)
addi $7 $0 1   ==> 001_000_111_0000001                      -> 2 --  (2)
NOOPP 2  ==> 001_000_000_0000000                      -> 3 --  (3)
         ==> 001_000_000_0000000                      -> 4 --  (4)
sw $1 $7   ==> 011_111_001_0000000                      -> 5 --  (5)
addi $7 $0 2  ==> 001_000_111_0000010                      -> 6 --  (6)
NOOPP 2  ==> 001_000_000_0000000                      -> 7 --  (7)
         ==> 001_000_000_0000000                      -> 8 --  (8)
sw $2 $7  ==> 011_111_010_0000000                      -> 9 --  (9)
addi $7 $0 3   ==> 001_000_111_0000011                      -> 10 --  (A)
NOOPP 2  ==> 001_000_000_0000000                      -> 11 --  (B)
         ==> 001_000_000_0000000                      -> 12 --  (C)
sw $0 $7   ==> 011_111_000_0000000                      -> 13 --  (D)
addi $7 $0 4  ==> 001_000_111_0000100                      -> 14 --  (E)
NOOPP 2  ==> 001_000_000_0000000                      -> 15 --  (F)
         ==> 001_000_000_0000000                      -> 16 --  (10)
sw $0 $7  ==> 011_111_000_0000000                      -> 17 --  (11)
addi $1 $0 105   ==> 001_000_001_1101001                      -> 18 --  (12)
addi $7 $0 1  ==> 001_000_111_0000001                      -> 19 --  (13)
addi $5 $0 6   ==> 001_000_101_0000110                      -> 20 --  (14)
subi $1 $1 1   ==> 101_001_001_0000001                      -> 21 --  (15)
NOOPP 2  ==> 001_000_000_0000000                      -> 22 --  (16)
         ==> 001_000_000_0000000                      -> 23 --  (17)
sw $7 $1   ==> 011_001_111_0000000                      -> 24 --  (18)
BSEZ $5 $1 -5   ==> 110_101_001_1111011                      -> 25 --  (19)
NOOPP 3  ==> 001_000_000_0000000                      -> 26 --  (1A)
         ==> 001_000_000_0000000                      -> 27 --  (1B)
         ==> 001_000_000_0000000                      -> 28 --  (1C)
addi $1 $0 2  ==> 001_000_001_0000010                      -> 29 --  (1D)
addi $4 $0 100  ==> 001_000_100_1100100                      -> 30 --  (1E)
NOOPP 1  ==> 001_000_000_0000000                      -> 31 --  (1F)
addi $7 $1 3   ==> 001_001_111_0000011                      -> 32 --  (20)
NOOPP 2  ==> 001_000_000_0000000                      -> 33 --  (21)
         ==> 001_000_000_0000000                      -> 34 --  (22)
lw $3 $7   ==> 010_111_011_0000000                      -> 35 --  (23)
NOOPP 2  ==> 001_000_000_0000000                      -> 36 --  (24)
         ==> 001_000_000_0000000                      -> 37 --  (25)
BEQ $3 $0 14   ==> 100_011_000_0001110                      -> 38 --  (26)
NOOPP 3  ==> 001_000_000_0000000                      -> 39 --  (27)
         ==> 001_000_000_0000000                      -> 40 --  (28)
         ==> 001_000_000_0000000                      -> 41 --  (29)
add $2 $1 $0   ==> 000_001_000_010_0_000                      -> 42 --  (2A)
NOOPP 2  ==> 001_000_000_0000000                      -> 43 --  (2B)
         ==> 001_000_000_0000000                      -> 44 --  (2C)
add $2 $2 $1   ==> 000_010_001_010_0_000                      -> 45 --  (2D)
NOOPP 2  ==> 001_000_000_0000000                      -> 46 --  (2E)
         ==> 001_000_000_0000000                      -> 47 --  (2F)
addi $7 $2 3   ==> 001_010_111_0000011                      -> 48 --  (30)
NOOPP 2  ==> 001_000_000_0000000                      -> 49 --  (31)
         ==> 001_000_000_0000000                      -> 50 --  (32)
sw $0 $7   ==> 011_111_000_0000000                      -> 51 --  (33)
bsez $2 $4 -8   ==> 110_010_100_1111000                      -> 52 --  (34)
NOOPP 3   ==> 001_000_000_0000000                      -> 53 --  (35)
         ==> 001_000_000_0000000                      -> 54 --  (36)
         ==> 001_000_000_0000000                      -> 55 --  (37)
addi $1 $1 1   ==> 001_001_001_0000001                      -> 56 --  (38)
NOOPP 2  ==> 001_000_000_0000000                      -> 57 --  (39)
         ==> 001_000_000_0000000                      -> 58 --  (3A)
bsez $1 $4 -28   ==> 110_001_100_1100100                      -> 59 --  (3B)
NOOPP 3  ==> 001_000_000_0000000                      -> 60 --  (3C)
         ==> 001_000_000_0000000                      -> 61 --  (3D)
         ==> 001_000_000_0000000                      -> 62 --  (3E)
addi $7 $0 1  ==> 001_000_111_0000001                      -> 63 --  (3F)
NOOPP 2  ==> 001_000_000_0000000                      -> 64 --  (40)
         ==> 001_000_000_0000000                      -> 65 --  (41)
lw $1 $7   ==> 010_111_001_0000000                      -> 66 --  (42)
addi $7 $0 2  ==> 001_000_111_0000010                      -> 67 --  (43)
NOOPP 2  ==> 001_000_000_0000000                      -> 68 --  (44)
         ==> 001_000_000_0000000                      -> 69 --  (45)
lw $4 $7  ==> 010_111_100_0000000                      -> 70 --  (46)
xor $5 $5 $5   ==> 000_101_101_101_0_110                      -> 71 --  (47)
addi $7 $1 3   ==> 001_001_111_0000011                      -> 72 --  (48)
NOOPP 2  ==> 001_000_000_0000000                      -> 73 --  (49)
         ==> 001_000_000_0000000                      -> 74 --  (4A)
lw $3 $7  ==> 010_111_011_0000000                      -> 75 --  (4B)
NOOPP 2  ==> 001_000_000_0000000                      -> 76 --  (4C)
         ==> 001_000_000_0000000                      -> 77 --  (4D)
BEQ $3 $0 4   ==> 100_011_000_0000100                      -> 78 --  (4E)
NOOPP 3  ==> 001_000_000_0000000                      -> 79 --  (4F)
         ==> 001_000_000_0000000                      -> 80 --  (50)
         ==> 001_000_000_0000000                      -> 81 --  (51)
addi $5 $5 1   ==> 001_101_101_0000001                      -> 82 --  (52)
addi $1 $1 1  ==> 001_001_001_0000001                      -> 83 --  (53)
NOOPP 2  ==> 001_000_000_0000000                      -> 84 --  (54)
         ==> 001_000_000_0000000                      -> 85 --  (55)
bsez $1 $4 -15   ==> 110_001_100_1110001                      -> 86 --  (56)
NOOPP 3  ==> 001_000_000_0000000                      -> 87 --  (57)
         ==> 001_000_000_0000000                      -> 88 --  (58)
         ==> 001_000_000_0000000                      -> 89 --  (59)
addi $5 $5 0   ==> 001_101_101_0000000                      -> 90 --  (5A)
j 90   ==> 111_0000001011010                      -> 91 --  (5B)
NOOPP 1  ==> 001_000_000_0000000                      -> 92 --  (5C)

