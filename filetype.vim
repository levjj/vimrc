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
  autocmd FileType json set foldmethod=syntax
augroup END

au! BufRead,BufNewFile *.coffee set filetype=coffee
augroup coffee_autocmd
  autocmd FileType coffee set shiftwidth=2
	autocmd FileType coffee set expandtab
augroup END

