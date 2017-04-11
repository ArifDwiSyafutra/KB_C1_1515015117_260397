/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH06E08.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

predicates
  factorial(unsigned,real) - procedure (i,o) %deklarasi predikat factorial dengan dua argumen unsigned dan real
  factorial(unsigned,real,unsigned,real) - procedure (i,o,i,i) %deklarasi kembali predikat factorial dengan empat argumen yang sebelumnya sudah diikuti dengan dua argumen.

/* Numbers likely to become large are declared as reals. */

clauses
  factorial(N,FactN):- /*klausa factorial bagian ini merupakan klausa yang pertama kali dicocokan dengan GOAL. factorial pada klausa initerdpat dua argumen N
  yang telah terikat dengan nilai 3 dan  FactN nilai sebeneranya belum diketahui*/
	
	factorial(N,FactN,1,1.0). /* Merupakan subgoal dari factorial (N,FactN). di dalam factorial ini terapat 4 argumen (3,FactN,1,1.0) */

  factorial(N,FactN,N,FactN):-!. /* di dalam factorial ini sama juga terdapat 4 argumen(N,FactN,N,FactN) kemudian diikuti dengan jika maka dan tanda(!)cut. 
  				    yang artinyan jika nilai N yang pertama sama dengan nilai argumen N yang ke 3 dan nilai FactN sama dengan nlai FactN yang ke 4 maka lacak balik akan berhenti*/
  
  factorial(N,FactN,I,P):-/*factorial ini memiliki 4 argumen yaitu (N,FactN,I,P) yang nilanya(3,FactN,1,1.0) karena nilai FactN belum diketahui*/
	NewI = I+1,%nilai dari NewI berasal dari I+1
	NewP = P*NewI,%nilai dari NewP berasal dari P+NewI
	factorial(N, FactN, NewI, NewP).%factorial yang menampung hasil dari 4 nilai di atas

goal
  factorial(3,X).
/* GOAL yang akan dicari , dimana pada goal factorial telah ditentukan argumennya yang pertama dengan nilai 3 dan pada argumen kedua hanya berisi variabel X
Nilai X ini yang akan dicari karena merupakan hasil factorial pada nilai dari argumen pertama.
Pertama VIP akan mencari fakta dari nilai pertama ini dari rule yang cocok dengan GOAL maka ditemukan (N,FactN).
kemudian mencari pada klausa untuk mengunifikasi argumennya.
dan karena X sendiri adalah variabel bebas, maka  dapat diunifikasikan ke variabel manapun,
FactN juga merupakan variabel bebas dari fakta rule factorial,
maka akan terjadi unifikasi antara X dan factorial, sehingga X=FactN. sementara variabel N sendiri telah terikat dengan nilai 3.
*/