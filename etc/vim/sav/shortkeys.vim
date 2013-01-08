" Changement des touches de navigations dans les onglets
map <C-LEFT> <Esc>:tabprevious<CR>
map <C-RIGHT> <Esc>:tabnext<CR>
map <S-LEFT> <Esc>:call MoveTab('left')<CR>
map <S-RIGHT> <Esc>:call MoveTab('right')<CR>

" Affichage de l'aide
map <F1> <Esc>:call HelpMemory()<CR>
imap <F1> <Esc>:call HelpMemory()<CR>i

" Définition des touches de navigation dans l'aide VIM
" Activer un lien en appuyant sur return
nmap <Return> <C-]>
" Revenir à la page précédente avec backspace
nmap <BS> <C-T>

" Navigation avec les flèches haut et bas sur les longues ligne
" en utilisant la touche Alt
map <A-DOWN> gj
map <A-UP> gk
imap <A-DOWN> <ESC>gji
imap <A-UP> <ESC>gki

" Saut vers les zones à complèter lors de l'utilisation de templates
map <A-Return> /<+.\{-1,}+><CR>c/+>/e<CR>
imap <A-Return> <Esc>/<+.\{-1,}+><CR>c/+>/e<CR>

" Amélioration de la recherche avant et arrière avec surlignement du pattern
map * <Esc>:exe '2match Search /' . expand('<cWORD>') . '/'<CR><Esc>:exe '/' . expand('<cWORD>') . '/'<CR>
map ù <Esc>:exe '2match Search /' . expand('<cWORD>') . '/'<CR><Esc>:exe '?' . expand('<cWORD>') . '?'<CR>

"Ouverture interactive de fichiers dans un nouvel onglet
map gf :tabe <cfile><CR>

" Placement d'une marque sur la ligne courante
map <F7> <Esc>:call MarkSign()<CR>
" Retrait du signet de la ligne en cours
map <A-F7> <Esc>:exe ':sign unplace'<CR>
" Saut à la ligne marquée
map <S-F7> <Esc>:call JumpToSign()<CR>

" Appel de la fonction de nettoyage d'un fichier (enlève les ^M parasites et
" les tabulations)
map <F6> <Esc>:call CleanCode()<CR>
imap <F6> <Esc>:call CleanCode()<CR>i

" Appel de la fonction d'activation/désactivation de la gestion de la souris
map <F5> <Esc>:call ToggleMouseActivation()<CR>

" Activation de l'auto-complétion multiple sur la touche Shift + tabulation
inoremap <S-Tab> <C-R>=MultipleAutoCompletion()<CR>

" Activation/Désactivation de la fenètre d'exploration des fichiers
map <F9> <Esc>:NERDTreeToggle<CR>

" Affichage/Masquage de la fenetre TagList
map <F8> <Esc>:TlistToggle<CR>

" Accès aux commentaires
 map <C-DOWN> <Esc>]/
 map <C-UP> <Esc>[/

 " Sortie de tous les buffers
 imap <S-Q> <Esc>:confirm qa<CR>
 map <S-Q> <Esc>:confirm qa<CR>

 " Ouvverture/fermeture des blocs
 " Alternance ouverture/fermeture
 nnoremap <space> za

 " Ferme tous les blocs
 nnoremap <C-c> zm

 " Ouvre tous les blocs
 nnoremap <S-c> zr

 " Gestion des sessions
 map <F11> <Esc>:call SaveSession()<CR>
 map <F12> <Esc>:call Loadsession()<CR>

" Déplacement dans des résultats d'une recherche à l'aide de Ctrl-PgUp et Ctrl-PgDown
map <C-PAGEUP> <Esc>:cprevious<CR><Esc>:exe '2match Search /' . expand('<cWORD>') . '/'<CR>
map <C-PAGEDOWN> <Esc>:cnext<CR><Esc>:exe '2match Search /' . expand('<cWORD>') . '/'<CR>

