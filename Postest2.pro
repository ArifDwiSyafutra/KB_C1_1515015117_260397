/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH03E03.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

nowarnings	% Special compiler directive; ignore for the moment

domains
  nama,no,kodemeja = symbol
  umur = byte    
  hasil, harga, diskon,total = long
predicates
  run - nondeterm()
  nondeterm id(nama,kodemeja)
  nondeterm kasir(no,harga)
  kasir(no) - nondeterm (i)
  procedure hitung(harga,hasil)
  procedure diskon(harga,diskon)
  procedure total(hasil,diskon)
 
clauses

  run:- 
  	write("******************** POSTEST 2 **************************"),nl,
  	write("*************** ARIF DWI SYAFUTRA **********************"),nl,
  	write("*************** RUMAH MAKAN MEGA JAYA **********************"),nl,
  	
  	readchar(A), A='1'.
  	id("Arif","Meja1").
	id("Dwi","Meja2").
  	kasir("ayam_gepuk",13000).
  	kasir("ayam_kalasan",11000).
  	kasir(No):-
  		No="Kassa 1".
  	hitung(Harga,Hasil):-
     		Hasil=Harga+1000.
     	diskon(Harga,Diskon):-
     		Diskon=Harga*0.10.
     	total(Harga,Total):-
     		Total=(Harga+1000)-(Harga*0.10).
goal
  run,
  id(Nama,"Meja1"),
  kasir(Menu,11000),
  hitung(11000,Harga),
  diskon(11000,Diskon),
  total(11000,Total);
  kasir("Kassa 1").



  
