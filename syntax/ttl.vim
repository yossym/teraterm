" Vim syntax file
" Language: TeraTerm Macro Language(ttl)
" version 4.103
" Last Change:2022-12-04.

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" 大文字小文字を区別しない
syn case  ignore

" 制御コマンド
syn keyword ttlStatement call end execcmnd exit goto include mpause
syn keyword ttlStatement pause creturn
syn keyword ttlRepeat for next while endwhile
syn keyword ttlRepeat do loop break continue until enduntil
syn keyword ttlConditional if then elseif else endif
syn keyword ttlOperator and not or xor

" system variables
syn keyword ttlArgument param1 param2 param3 param4 param5 
syn keyword ttlArgument param6 param7 param8 param9 paramcnt
syn keyword ttlArgument groupmatchstr1 groupmatchstr2 groupmatchstr3
syn keyword ttlArgument groupmatchstr4 groupmatchstr5
syn keyword ttlArgument groupmatchstr6 groupmatchstr7 groupmatchstr8
syn keyword ttlArgument groupmatchstr9 matchstr
syn keyword ttlArgument result timeout mtimeout inputstr
syn keyword ttlArgument params



syn match ttlOperator "\s[-+\*/%]\s"
syn match ttlOperator "="
syn match ttlOperator "\s\(<\|>\)\s"

syn match ttlString "\"[^"]*\""
syn match ttlString "\'[^']*\'"
syn match ttlString "#1[0-1][0-9]\|#1[2][0-7]\|#[1-9][0-9]\|#[1-9]"
syn match ttlString "#$[0-7]\x"

syn match ttlLabel "^\s*:\s*\h\w*\>"
syn match ttlLabel "\<\(goto\|call\)\s\+:\h\w*\>"
syn match ttlLabel "\<goto\s\+\h\w*\>"
syn match ttlLabel ":\h\w*\>"

syn match ttlComment ";.*$"
syn region ttlComment start="/\*" end="\*/"

" 通信コマンド
syn keyword ttlImplicit bplusrecv bplussend callmenu changedir
syn keyword ttlImplicit clearscreen closett connect cygconnect
syn keyword ttlImplicit disconnect dispstr enablekeyb flushrecv
syn keyword ttlImplicit gethostname getmodemstatus gettitle kmtfinish
syn keyword ttlImplicit kmtget kmtrecv kmtsend loadkeymap
syn keyword ttlImplicit logautoclosemode logclose loginfo logopen
syn keyword ttlImplicit logpause logrotate logstart logwrite
syn keyword ttlImplicit quickvanrecv quickvansend recvln restoresetup
syn keyword ttlImplicit scprecv scpsend send sendbreak sendbroadcast
syn keyword ttlImplicit sendfile sendkcode sendln sendlnbroadcast
syn keyword ttlImplicit sendlnmulticast sendmulticast setbaud setdebug
syn keyword ttlImplicit setdtr setecho setflowctrl setmulticastname
syn keyword ttlImplicit setrts setspeed setsync settitle showtt
syn keyword ttlImplicit testlink unlink wait wait4all waitevent waitln
syn keyword ttlImplicit waitn waitrecv waitregex xmodemrecv xmodemsend
syn keyword ttlImplicit ymodemrecv ymodemsend zmodemrecv zmodemsend

"文字列操作コマンド
syn keyword ttlImplicit code2str expandenv int2str regexoption sprintf
syn keyword ttlImplicit sprintf2 str2code str2int strcompare strconcat
syn keyword ttlImplicit strcopy strinsert strjoin strlen strmatch
syn keyword ttlImplicit strremove strreplace strscan strspecial
syn keyword ttlImplicit strsplit strtrim tolower toupper

" ファイル操作コマンド
syn keyword ttlImplicit basename dirname fileclose fileconcat filecopy
syn keyword ttlImplicit filecreate filedelete filelock filemarkptr
syn keyword ttlImplicit fileopen fileread filereadln filerename
syn keyword ttlImplicit filesearch fileseek fileseekback filestat
syn keyword ttlImplicit filestrseek filestrseek2 filetruncate
syn keyword ttlImplicit fileunlock filewrite filewriteln findclose
syn keyword ttlImplicit findfirst findnext foldercreate folderdelete
syn keyword ttlImplicit foldersearch getdir getfileattr makepath
syn keyword ttlImplicit setdir setfileattr

" パスワードコマンド
syn keyword ttlImplicit delpassword getpassword ispassword passwordbox
syn keyword ttlImplicit setpassword

" その他のコマンド
syn keyword ttlImplicit beep bringupbox checksum16 checksum16file
syn keyword ttlImplicit checksum32 checksum32file checksum8
syn keyword ttlImplicit checksum8file clipb2var closesbox crc16
syn keyword ttlImplicit crc16file crc32 crc32file dirnamebox exec
syn keyword ttlImplicit filenamebox getdate getenv getipv4addr
syn keyword ttlImplicit getipv6addr getspecialfolder gettime getttdir
syn keyword ttlImplicit getver ifdefined inputbox intdim listbox
syn keyword ttlImplicit messagebox random rotateleft rotateright
syn keyword ttlImplicit setdate setdlgpos setenv setexitcode settime
syn keyword ttlImplicit show statusbox strdim uptime var2clipb yesnobox

if version >= 508 || !exists("did_ttl_syntax_inits")
    if version < 508
        let did_ttl_syntax_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

    HiLink ttlStatement Statement
    HiLink ttlLabel Label
    HiLink ttlConditional Conditional
    HiLink ttlRepeat Repeat

    HiLink ttlOperator Operator

    HiLink ttlArgument Identifier

    HiLink ttlString String

    HiLink ttlComment Comment
    HiLink ttlImplicit Function

    delcommand HiLink
endif

let b:current_syntax = "ttl"


