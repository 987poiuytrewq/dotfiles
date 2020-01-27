let g:os = substitute(system('uname'), '\n', '', '')

if g:os == 'Linux'
  let g:python_host_prog='/usr/bin/python'
  let g:python3_host_prog='/usr/bin/python3'
endif
if g:os == 'Darwin'
  let g:python_host_prog='/usr/local/opt/python@2/bin/python2'
  let g:python3_host_prog='/usr/local/bin/python3'
endif
