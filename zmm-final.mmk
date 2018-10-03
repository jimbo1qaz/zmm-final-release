#amk 2

; %define falloff 5
; %define ratio 7/8

; %define falloff 7
; %define ratio 1

%define falloff 6
%define ratio 1
%define strings 1
%define low 1


#spc
{
    #title  "Final Hours"
    #game   "Zelda - Majora's Mask"
    #author ""
    #comment "shoutouts to ppl with depression"
}

#path "idol1 final hours"

#samples
{
    "strings.brr"
    "icelands.brr"
    "guitar.brr"
    "clack.brr"
    "bell.brr"
    "../EMPTY.brr"
}

"LOUD=%gain direct $7f"
#instruments
{
    %tune "strings.brr"     %adsr -1,0,%falloff,0
    ; %tune "strings.brr"     %adsr 4,-1,full,1
    %tune "strings.brr"     %adsr -1,-1,full,1
        ; low
    %tune "icelands.brr"    %gain up $08
    %tune "guitar.brr"      %adsr -1,-1,full,0
    %tune "clack.brr"       %adsr -1,-1,full,0
    %tune "bell.brr"        %adsr -1,-1,full,$b
    "../EMPTY.brr"      %adsr 4 -1 full 7 $00 $00

;   "strings.brr"   $8F $E0 $00 $02 $1b
;   "icelands.brr"  $8F $E0 $00 $01 $7d
;   "guitar.brr"    $8F $E0 $00 $02 $fd
;   "clack.brr"     $EF $E0 $00 $07 $a5
;   "bell.brr"      $8F $E0 $00 $02 $8d
}

"STRINGS=@30 y09"
"LOW=@31 y11"
"ICE=@32 y10"   ; %gain up $08
"GUITAR=@33 y13"
"CLACK=@34 y10"
"BELL=@35 y8"

"RING=BELL v150 o4 c"
"LOL2=r2 RING1 r2"

; The Direct/Custom Gain modes are overriding Attack/Decay/Sustain modes (when
; Keyed-ON), Release (when Keyed-OFF) keeps working as usually.

; "VIBOFF=$DF $E5 $00 $00 $00"

(!1)[$f4$09]    ; !1, -1 keyon
(!2)[%gain exp $0c ] ; !2, 3 keyoff
(!3)[%gain exp $10 ] ; !2, 3 keyoff

"clear=0"
"kon=-1"
"after=1"
"before=2"
"koff=3"
"now=4"

"NO_DECAY=(!1, clear)(!1, kon)"       ; clear keyoff, restore on keyon

"LONG_DECAY=(!1, kon)(!2, koff)"    ; restore on keyon, decay on keyoff
"LONG_RELEASE=(!2, now)"

"DECAY=(!1, kon)(!3, koff)"         ; restore on keyon, decay on keyoff
"RELEASE=(!3, now)"

"BEGIN=r8"
#0
; t100
t28 w255
;  chan  L   R         t  fb  fir
$EF $00 $30 $d0   $F1 $04 $C0 $01   ; echo
; $F4 $02     ; light staccato
l1

"ECHO=$F4$03"

; [r1]100

%vmod %ratio
#0 BEGIN ECHO LONG_DECAY ICE
o4 l1
;0
v78 %vbend,4,248    d^ r^
;4
/ v170 %vbend,2,78 d2     %vbend,4,248 ^1^2
r^
;8
v172 %vbend,2,80 d2     %vbend,4,250 ^1^2
r^
;12
v84 %vbend,2,166 d^
r^
;16
v166    d^
r^
;20 ≈ 4
v78%vb,4,248 d^
r^
;24 ≈ 8
v172 %vbend,2,80 d2     %vbend,4,250 ^1^2
r^
;28
v86 %vb,4,254 d^
r^
; 32
d^
r^

#1 BEGIN ECHO LONG_DECAY ICE
o4 l1
;0
r^
v210    c1. %vbend,2,148 ^2
;4
/ LONG_RELEASE r^
v210    c1. %vbend,2,150 ^2
;8
r^
v212    c1 %vbend,4,80 ^
;12
r^
v142    c^
;16
r^
v142    d1^2 %vb,2,74 ^2
;20 ≈ 4
r^
v210    c1. %vbend,2,150 ^2
;24 ≈ 8
r^
v212    c1 %vbend,4,80 ^
;28
r^
v216 c^
; 32
r^
v216 c. %vb,2,154 ^2 ^





; (v\d+)([\s]*)([o<>]*r[r\d^.]*)
; (v\d+)((?:\s|;.*$)*)([o<>]*r[r\d^.]*)
; $3$2$1

; (v\d+)([\s]*)(v\d+)
; $2$3


%vmod %strings
#2 BEGIN ECHO  DECAY STRINGS
r1^^^
;4
/ STRINGS o3 v42 %vb,4,136 a+ r v148
    a+2. >r2.v160 v136<a2
;8
r1v164 a2.>r4
v184 d2. r4v168 v184d1
;12
r2.v136 v164d4 r1v178
g1 r1v148
;16
v152a2. r4v138 v170a+2. r4v188
v164g1 r2....r32v128
;20=4
v136<a+1
    r v148  ; I'd totally use looping, but that breaks note end GAIN callbacks.
        a+2. >r2.v160 v136<a2
    ;8
    r1v164 a2.>r4
    v184 d2. r4v168 v184d1
;28
r^
LOL2
;32
rLOL2r

#3 BEGIN ECHO  DECAY STRINGS
r1^^^
;4
/ STRINGS o3 v42 %vb,4,136 r v148 a
    r2. v160>c2. <r2v136
;8
v164a+1 r2.>c4
r2. v184 v168c4 r1v184
;12
v136d+2. r4v164 v178e1
r1 v148f+1
;16
r2.v152 v138g4 r2.v170 v188a4
r1v164 v128f+2....r32
;20=4
<^v136
    v148 a
        r2. v160>c2. <r2v136
    ;
    v164a+1 r2.>c4
    r2. v184 v168c4 r1v184
;28
v140o3a+1 %vb,2,110 ^2  %vb,2,0 ^2
r^
;32
v42 %vb,4,140 a+1 %vb,4,0 ^
r^

%vmod %strings
#4 BEGIN ECHO DECAY
 STRINGS
r1^^^
;4
/ STRINGS q7f o3 v46 %vb,4,148 g      r v130
    v160g r2v132 v114g-2
;8
r1v152 v86f1
    %vmod %ratio
    ; ([a-g]\+?)([a-g]\+?)([a-g]\+?)([a-g]\+?)([a-g]\+?)([a-g]\+?)
    ; r$2r$4r$6
    ; $1r$3r$5r
    (100)[l24 GUITAR o4 v72 %vb,0.8,80 $F4 $02 o4 DECAY       ; light staccato
        grgra+r %vb,1,62 argra+r %vb,2,14 argra+r argra+r
        $F4 $02
    STRINGS l1]
    %vmod %strings o3       ; this makes a good case for either segmentation or stack-pop
    r2v160 v178f+2
;12
(110)[CLACK q5f o4
    v88 %vb,4,28
    %yb,2,6 [[c24 r24]]6
    %yb,2,0 [[c24 r24]]6
STRINGS q7f]
    o3
v178g+2. r4v152
>v152c1^1
;16
(110)
o4 v138d1^1 r2....r32v102
;20
v148<g1     r v130
    v160g r2v132 v114g-2
r1v152 v86f1 r1.v160 v178 NO_DECAY f+2  ; NO_DECAY is dirty hack to workaround AMK race condition
;28
(100)(110)
$FA $02 $FE (100) $FA $02 $00 (110)
(100)(110)
$FA $02 $FE (100) $FA $02 $00 (110)

#5 BEGIN ECHO DECAY STRINGS
r1^^^
;4
/ o3 v46 %vb,4,148 r      v130 f
    rv160 v132g2 r2v114
;8
v152g1 r1v86 v160g1. r2v178
;12
v178g2.r4   r2.v178 v152a4
    (100)
    o4 r
;16
v136d1 r1^1v138 v102c2....r32
;20
    (100)
v130 o3f
    (110) o3v160 v132g2 r2v114
v152g1 r1v86 v160g1. r2v178
;28
v152g1 %vb,2,120 ^2 %vb,2,0 ^2
r1r1
;32
v46 %vb,4,152 g1 %vb,4,0 ^
r1^


%vmod %low
#6 DECAY
BEGIN
r1^^^
;4
/ LOW v50 %vb,4,160
o2g         v160f d+ v176 d
;8
v164g v144f v166d+ d
;12
v162o3c c+ d^
;16
v152d+^ v168d^ r16
;20
v156 o2g2...    v160f d+ v176 d
v164g v144f v166d+ d
;28
v156 o2g v160 %vb,2,126 ^2  %vb,2,26 ^2
r^
;32
v50 %vb,4,160 g  %vb,2,126 ^2  %vb,2,26 ^2
r^

%vmod %ratio
#7 ECHO DECAY
RING1 BEGIN
r1 r8 RING1 r2..

/ q7f
;4
r4 RING1 r2.
; 6
r1 LOL2 r1

;10
(101)[l24 GUITAR o4 v72 %vb,0.8,80
        rararg %vb,1,62 ra+rarg %vb,2,14 ra+rarg ra+rarg
    l1 ]
r1
;12
(111)[CLACK q5f o4
    v88 %vb,4,28
    r24 %yb,2,14 [[c24 r24]]6
    %yb,11/6,20 [[c24 r24]]5 c24
q7f]

RING1
;14
(101) r1 (111) LOL2 r1
;20
(101) RING1 (111) r1
; 24
r RING1 r1^
;28
(101) (111)
$FA $02 $FE (101) $FA $02 $00
(111)
;32
(101)(111)
$FA $02 $FE (101) $FA $02 $00 (111)
