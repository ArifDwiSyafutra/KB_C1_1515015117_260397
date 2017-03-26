domains
nama = symbol
matakuliah = symbol
nilai = symbol

predicates

nondeterm tingkat(nama,matakuliah,nilai)


clauses
tingkat(irfan,"KB",a).
tingkat(komeng,"KB",d).
tingkat(dati,"KB",c).
tingkat(fatima,"KB",b).
tingkat(maspion,"KB",c).
tingkat(ricky,"PDE",e).
tingkat(embang,"PDE",a).
tingkat(salmin,"PDE",d).
tingkat(vina,"PDE",b).
tingkat(sondang,"PDE",c).
tingkat(pamuji,"SO",d).
tingkat(luki,"SO",e).
tingkat(sadek,"SO",b).
tingkat(yusida,"SO",a).
tingkat(eka,"SO",a).

goal
	tingkat(NamaMahasiswa,"KB",_);
	tingkat(Nama,_,Lulus), Lulus <"c";
	tingkat(Nama,_,TidakLulus), TidakLulus >"c";
	tingkat(Nama_Mahasiswa,_,_);
	tingkat(_,Matakuliah,_).
	
		
