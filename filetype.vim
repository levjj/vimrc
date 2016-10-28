augroup java_autocmd
	autocmd FileType java set expandtab
  autocmd FileType java	set smarttab
	autocmd FileType java set shiftwidth=4
	autocmd FileType java set tabstop=4
augroup END

augroup javascript_autocmd
	autocmd FileType javascript set expandtab
	autocmd FileType javascript set smarttab
	autocmd FileType javascript set shiftwidth=4
	autocmd FileType javascript set tabstop=4
augroup END

au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
augroup END

au! BufRead,BufNewFile *.coffee set filetype=coffee
augroup coffee_autocmd
  autocmd FileType coffee set shiftwidth=2
	autocmd FileType coffee set expandtab
augroup END

au! BufRead,BufNewFile *.smt set filetype=scheme

au! BufRead,BufNewFile *.md set filetype=markdown

au! BufRead,BufNewFile *.hbs set filetype=mustache

au! BufRead,BufNewFile Dockerfile set filetype=Dockerfile

au! BufRead,BufNewFile *.ts set filetype=typescript
augroup typescript_autocmd
  autocmd FileType typescript set shiftwidth=2
	autocmd FileType typescript set expandtab
augroup END

au! BufRead,BufNewFile *.dfy set filetype=dafny

au! BufRead,BufNewFile *.nun set filetype=nunchaku
