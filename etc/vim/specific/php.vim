" Détection des erreurs de syntaxe
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

" Active les replis sur les fonctions et sur les classes PHP
let php_folding=1

" Active la coloration syntaxique pour du SQL intégré dans des
" chaînes de caractères
let php_sql_query=1

" Active la coloration syntaxique pour du HTML intégré dans des
" chaînes de caractères
let php_htmlInStrings=1

" Désactive les tags courts PHP
let php_noShortTags=1

" Chargement de l'extension d'ecriture des commentaires PHPDoc
execute 'source' . $HOME . '/.vim/specific/php-doc.vim'

" Raccourcis clavier pour la création des en-têtes de documentation PHPDoc
map <C-p> <Esc>:call PhpDocSingle()<CR>
imap <C-p> <Esc>:call PhpDocSingle()<CR>i

" Affichage de l'aide PHP sur le mot se trouvant sous le curseur
map <F10> <Esc>:exe '!firefox http://fr2.php.net/manual/fr/function.' . substitute(expand('<cWORD>', '_', '-', '') . '.php'<CR><CR>
imap <F10> <Esc>:exe '!firefox http://fr2.php.net/manual/fr/function.' . substitute(expand('<cWORD>', '_', '-', '') . '.php'<CR><CR>

" Recherche dans le repertoire courant et tous les sous-repertoires du terme
" sous le curseur (fichiers .php, .inc, .ini)
map <F3> <Esc>:split<CR>:exe 'vimgrep /' . expand('<cWORD>') . '/**/*.php **/*.inc **/*.ini'<CR><Esc>:exe '3match Search /' . expand('<cWORD>') . '/'<CR>

" Vérification syntaxique
map <F2> <Esc>:make<CR>

