\ ujson.f
\ © 2016 David J Goehrig

empty

ICODE 8+ ( n -- n+8 )
	8 # EBX ADD
	RET 
END-CODE

: s8 ( a -- s8 ) c@  dup $80 and if $7f and $ffffff80 or then ;
: u8 ( a -- u8 ) c@ ;
: s16 ( a -- s16 ) h@ ;
: u16 ( a -- u16 ) w@ ;
: s32 ( a -- s32 ) @ ;
: u32 ( a -- u32 ) @ ;		\ need to use unsigned representation
: s64 ( a -- s s ) 2@ ;
: u64 ( a -- u u ) 2@ ;		\ need to use unsigned representation
: bool ( a -- b ) c@ [char] t =  ; 
: null ( a -- 0 ) c@ [char] n = invert ;
: s ( a -- a l ) dup w@ ; 
: a ( a -- a l ) dup w@ ;
: o ( a -- a l ) dup w@ ;

: s8+ ( a -- a+1 s8 ) dup 1+ swap s8 ;
: u8+ ( a -- a+1 u8 ) dup 1+ swap u8 ;
: s16+ ( a -- a+1 s16 ) dup 2+ swap s16 ;
: u16+ ( a -- a+1 s16 ) dup 2+ swap u16 ;
: s32+ ( a -- a+1 s32 ) dup 4+ swap s32 ;
: u32+ ( a -- a+1 u32 ) dup 4+ swap u32 ;
: s64+ ( a -- a+1 s s ) dup 8+ swap s64 ;
: u64+ ( a -- a+1 u u ) dup 8+ swap u64 ;
: bool+ ( a -- a+l b ) dup c@ over 1+ swap ;
: null+ ( a -- a+l 0 ) 0 ;
: s+ ( a -- a+l a l ) dup w@ 2dup + -rot ;
: a+ ( a -- a+l a l ) dup w@ 2dup + -rot ; 
: o+ ( a -- a+l a l ) dup w@ 2dup + -rot ; 

: tag+ if 1+ true else 0 then ;

: s8? ( a -- a flag ) dup c@ [char] c = tag+ ;
: u8?  ( a -- a flag ) dup c@ [char] C = tag+ ;
: s16? ( a -- a flag ) dup c@ [char] w = tag+ ;
: u16? ( a -- a flag ) dup c@ [char] W = tag+ ;
: s32? ( a -- a flag ) dup c@ [char] i = tag+ ;
: u32? ( a -- a flag ) dup c@ [char] I = tag+ ;
: s64? ( a -- a flag ) dup c@ [char] q = tag+ ;
: u64? ( a -- a flag ) dup c@ [char] Q = tag+ ;
: n? ( a -- a flag ) dup c@ [char] n = tag+ ;
: b? ( a -- a flag ) dup c@ dup [char] t = swap [char] f = or tag+ ;
: t? ( a -- a flag ) dup c@ [char] t = tag+ ;
: f? ( a -- a flag ) dup c@ [char] f = tag+ ;
: s? ( a -- a flag ) dup c@ [char] s = tag+ ;
: a? ( a -- a flag ) dup c@ [char] a = tag+ ;
: o? ( a -- a flag ) dup c@ [char] o = tag+ ;


