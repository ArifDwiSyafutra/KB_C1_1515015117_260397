predicates
	male(symbol,symbol,long,long,symbol) - nondeterm (o,o,i,o,o)
	female(symbol,symbol,long,long,symbol) - nondeterm (o,o,i,o,o)
	characteristic (symbol,symbol,long,long,symbol) - nondeterm (o,o,i,o,o)
clauses
	male(fahrul,ikal,180,30,gemuk).
	male(fajri,lurus,170,20,kurus).
	male(doni,keriting,165,40,sedang).
	
	female(firda,ikal,170,30,gemuk).
	female(nurul,lurus,160,20,kurus).
	female(husna,keriting,155,40,sedang).
	
	characteristic(Nama,Rambut,Tinggi,Umur,BentukBadan):-
		male(Nama,Rambut,Tinggi,Umur,BentukBadan);
		female(Nama,Rambut,Tinggi,Umur,BentukBadan).
goal
  male(Nama,Rambut,180,Umur,BentukBadan);
   female(Nama,Rambut,160,Umur,BentukBadan).
   
  