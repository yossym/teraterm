" Vim syntax file
" Language: TeraTerm Macro Language(ttl)
" version 4.103
" 2019-8-10

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

" 大文字小文字を区別しない
syn case  ignore

" 制御コマンド
syn keyword ttlStatement call end execcmnd exit goto include mpause pause return
syn keyword ttlRepeat for next while endwhile
syn keyword ttlRepeat do loop break continue until enduntil
syn keyword ttlConditional if then elseif else endif
syn keyword ttlOperator and not or xor

" system variables
syn keyword ttlArgument param1 param2 param3 param4 param5 param6 param7 param8
syn keyword ttlArgument param9 paramcnt
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
syn keyword ttlImplicit bplusrecv bplussend callmenu changedir clearscreen
syn keyword ttlImplicit closett connect cygconnect disconnect dispstr enablekeyb
syn keyword ttlImplicit flushrecv gethostname getmodemstatus gettitle kmtfinish
syn keyword ttlImplicit kmtget kmtrecv kmtsend loadkeymap logautoclosemode
syn keyword ttlImplicit logclose loginfo logopen logpause logrotate logstart
syn keyword ttlImplicit logwrite quickvanrecv quickvansend recvln restoresetup
syn keyword ttlImplicit scprecv scpsend send sendbreak sendbroadcast sendfile
syn keyword ttlImplicit sendkcode sendln sendlnbroadcast sendlnmulticast
syn keyword ttlImplicit sendmulticast setbaud setdebug setdtr setecho
syn keyword ttlImplicit setflowctrl setmulticastname setrts setspeed setsync
syn keyword ttlImplicit settitle showtt testlink unlink wait wait4all waitevent
syn keyword ttlImplicit waitln waitn waitrecv waitregex xmodemrecv xmodemsend
syn keyword ttlImplicit ymodemrecv ymodemsend zmodemrecv zmodemsend

"文字列操作コマンド
syn keyword ttlImplicit code2str expandenv int2str regexoption sprintf sprintf2
syn keyword ttlImplicit str2code str2int strcompare strconcat strcopy strinsert
syn keyword ttlImplicit strjoin strlen strmatch strremove strreplace strscan
syn keyword ttlImplicit strspecial strsplit strtrim tolower toupper

" ファイル操作コマンド
syn keyword ttlImplicit basename dirname fileclose fileconcat filecopy
syn keyword ttlImplicit filecreate filedelete filelock filemarkptr fileopen
syn keyword ttlImplicit fileread filereadln filerename filesearch fileseek
syn keyword ttlImplicit fileseekback filestat filestrseek filestrseek2
syn keyword ttlImplicit filetruncate fileunlock filewrite filewriteln findclose
syn keyword ttlImplicit findfirst findnext foldercreate folderdelete
syn keyword ttlImplicit foldersearch getdir getfileattr makepath setdir
syn keyword ttlImplicit setfileattr

" パスワードコマンド
syn keyword ttlImplicit delpassword getpassword ispassword passwordbox
syn keyword ttlImplicit setpassword

" その他のコマンド
syn keyword ttlImplicit beep bringupbox checksum16 checksum16file checksum32
syn keyword ttlImplicit checksum32file checksum8 checksum8file clipb2var
syn keyword ttlImplicit closesbox crc16 crc16file crc32 crc32file dirnamebox
syn keyword ttlImplicit exec filenamebox getdate getenv getipv4addr getipv6addr
syn keyword ttlImplicit getspecialfolder gettime getttdir getver ifdefined
syn keyword ttlImplicit inputbox intdim listbox messagebox random rotateleft
syn keyword ttlImplicit rotateright setdate setdlgpos setenv setexitcode
syn keyword ttlImplicit settime show statusbox strdim uptime var2clipb yesnobox

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


