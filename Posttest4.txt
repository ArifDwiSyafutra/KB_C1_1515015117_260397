DOMAINS
 nama,jender,pekerjaan,benda,alasan,zat = symbol
 umur=integer

PREDICATES 
 nondeterm orang(nama, umur, jender, pekerjaan)
 nondeterm selingkuh(nama, nama)
 terbunuh_dengan(nama, benda)
 terbunuh(nama)
 nondeterm pembunuh(nama)
 motif(alasan)
 ternodai(nama, zat)
 milik(nama, benda)
 nondeterm cara_kerja_mirip(benda, benda)
 nondeterm kemungkinan_milik(nama, benda)
 nondeterm dicurigai(nama)

/* * * Fakta-fakta tentang pembunuhan * * */ 

CLAUSES
 orang(budi,55,m,tukang_kayu).
 orang(aldi,25,m,pemain_sepak_bola).%aldi seseorang berumur 25 thn pemain sepak bola.
 orang(aldi,25,m,tukang_jagal).
 orang(joni,25,m,pencopet).%jonialdi seseorang berumur 25 thn pemain dan pencopet

 selingkuh(ina,joni).
 selingkuh(ina,budi).
 selingkuh(siti,joni).%siti selingkuh joni.

 terbunuh_dengan(siti,pentungan).%siti terbunuh dengan sebuah pentungan
 terbunuh(siti).

 motif(uang).
 motif(cemburu).
 motif(dendam).

 ternodai(budi, darah). %budi ternodai oleh darah.
 ternodai(siti, darah). %siti ternodai oleh darah.
 ternodai(aldi, lumpur). %aldi ternodai oleh lumpur
 ternodai(joni, coklat). %joni ternodai oleh coklat. (ngapain juga ada coklat pas pembunuan????)
 ternodai(ina, coklat).

 milik(budi,kaki_palsu). %budi memiliki kaki palsu.
 milik(joni,pistol). %joni memiliki pistol
 
 /* * * Basis Pengetahuan * * */ 
 
 cara_kerja_mirip(kaki_palsu, pentungan). 
 cara_kerja_mirip(balok, pentungan).
 cara_kerja_mirip(gunting, pisau).
 cara_kerja_mirip(sepatu_bola, pentungan).
 
 kemungkinan_milik(X,sepatu_bola):- %x bisa kemungkinan_milik sepatu bola, jika
 	orang(X,_,_,pemain_sepak_bola). %x adalah pemain sepak bola. 
  
 kemungkinan_milik(X,gunting):- %x bisa kemungkinan_milik gunting, jika
	 orang(X,_,_,pekerja_salon). % x adalah orang dan bekerja disalon
 
 kemungkinan_milik(X,Benda):-% x bisa kemungkinan_milik benda(kaki palsu, balok dan sepatu bola), jika
	 milik(X,Benda).%x milik benda(kaki palsu, balok dan sepatu bola). 
	 
 /* * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  dicurigai semua orang yang memiliki senjata yang *  * 
 kerjanya mirip dengan senjata penyebab siti terbunuh. *  
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

 dicurigai(X):- %x dicurigai jika,
	 terbunuh_dengan(siti,Senjata) ,%siti terbunuh dengan senjata. * lihat pada predikat terbunuh_dengan, agar dapat diketahui senjata apa yang digunakan oleh pembunuh
	 cara_kerja_mirip(Benda,Senjata) ,%benda yang cara kerjanya mirip senjata, dimana senjata adalah pentungan. *lihat predicate cara_kerja_mirip, agar dapat diketahui benda apa yang cara kerjanya mirip dengan pentungan.
	 				  %ternyata benda yang cara kerjanya mirip pentungan adalah kaki palsu, balok dan sepatu_bola.
	 kemungkinan_milik(X,Benda).%x kemungkinan miliki benda(kaki palsu, balok dan sepatu bola). *lihat predikat kemungkinan_milik. *****ternyata x(budi dan aldi) kemungkinan milik benda(pistol dan sepatu bola) karena dua-duanya bersifat membunuh****.
	

/* * * * * * * * * * * * * * * * * * * * * * * * * *  
* dicurigai laki-laki yang selingkuh dengan siti. *  
* * * * * * * * * * * * * * * * * * * * * * * * * */

 dicurigai(X):- 
	motif(cemburu),%cemburu merupakan motif utama dibalik terjadinya pembunuhan.
	orang(X,_,m,_),%x adalah orang dan bergender m(male).
	selingkuh(siti,X).%siti selingkuh x. *lihat pada predicate selingkuh.****ternyata x adalah joni****
	

/* * * * * * * * * * * * * * * * * * * * * * *  
* dicurigai perempuan yang selingkuh dengan *  
* laki-laki yang juga selingkuh dengan siti *  
* * * * * * * * * * * * * * * * * * * * * * */

 dicurigai(X):-
	motif(cemburu),%cemburu merupaka motif dibalik pembunuhan.
	orang(X,_,f,_),%x adalah orang dan bergender f(female). pada predicate orang, tidak ditemukan orang dengan gender female.
	selingkuh(X,Lakilaki),
	selingkuh(siti,Lakilaki).
	

/* * * * * * * * * * * * * * * * * * * * * * * * * * *  
* dicurigai pencopet yang mempunyai motif uang.     *  
* * * * * * * * * * * * * * * * * * * * * * * * * * */  
 
 dicurigai(X):-
	motif(uang),%uang merupaka motif dibalik pembunuhan.
	orang(X,_,_,pencopet).%x adalah orang dan merupakan pencopet. *lihat pada predicate orang. ****ternyata x adalah joni****

% pembuktian predicate pembunuh. 
 pembunuh(Pembunuh):- %pembunuh adalah pembunuh, jika					
	orang(Pembunuh,_,_,_), %pembunuh merupakan orang, maka visual prolog akan mencari predicate orang dan mengecek, siapa saja yang menjadi tersangka.tersangkanya bisa jadi di antara keempat orang itu
	terbunuh(Terbunuh), %terbunuh adalah yang terbunuh, maka visual prolog akan mencari predicate terbunuh dan mengecek, ternyata yang terbunuh adalah siti.
	Terbunuh <> Pembunuh, /* Bukan bunuh diri */
	dicurigai(Pembunuh),%dan pembunuh adalah orang yang dicurigai, maka visual prolog akan mencari predicate dicurigai. lihat pada bagian di curigai. ternyata yang dicurigai adalah budi, joni,aldi.
	ternodai(Pembunuh,Zat),%pembunuh(budi, aldi, joni) ternodai zat(darah,lumpur,coklat).
	ternodai(Terbunuh,Zat).%terbunuh(siti) ternodai zat(darah).
GOAL
 pembunuh(X). 
 %karna pada goal yang dicari pembunuh, maka visual prolog akan mencari predicate pembunuh juga.
 
 %pengujian telah selesai ternyata budi merupakan pembunuh dari siti.