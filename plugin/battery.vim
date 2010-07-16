"=====================================================================================================
" Name: battery.vim
" Author: mfumi
" Email: m.fumi760@gmail.com
" Description: Display battery infomation
" Last Change: 16-07-2010 
" Version: 0.10

if exists('g:loaded_battery_vim')
	finish
endif
let g:loaded_battery_vim = 1

let s:save_cpo = &cpo
set cpo&vim


" ----------------------------------------------------------------------------------------------------

function! s:is_win()
  return has('win32') || has('win64')
endfunction

function! s:is_mac()
	return has('mac') || has('macunix') || system('uname') =~? '^darwin'
endfunction

function! s:set_default(variable_name, default)
    if !exists(a:variable_name)
        let {a:variable_name} = a:default
    endif
endfunction


" ----------------------------------------------------------------------------------------------------

if s:is_win()
	"TODO
elseif s:is_mac()
	call s:set_default('g:battery_status_format','%l power, battery %b (%p% load, remaining time %t)')
else
	"TODO
endif

call s:set_default('g:battery_load_critical',10)
call s:set_default('g:battery_load_low',25)

command! -nargs=0 Battery call battery#battery(g:battery_status_format)

" ----------------------------------------------------------------------------------------------------

let &cpo = s:save_cpo
unlet s:save_cpo
