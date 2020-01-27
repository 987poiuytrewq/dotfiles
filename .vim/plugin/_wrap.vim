let has_breakindent = v:version > 704 || (v:version == 704 && has('patch338'))

if has_breakindent
    set breakindent
endif

set linebreak
set showbreak=└─

" don't break on sigils
set breakat-=:
set breakat-=@
set breakat-=$
set breakat-=&
