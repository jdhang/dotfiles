" Vim syntax file
" Language: ABB Rapid Command
" Maintainer: Patrick Knosowski <knosowski@graeff.de>
" Version: 1.3.1
" Last Change: 03. Oct 2016
" Credits: 
"
" Suggestions of improvement are very welcome. Please email me!
"

" Remove any old syntax stuff that was loaded (5.x) or quit when a syntax file
" was already loaded (6.x).
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

"Rapid does ignore case
syn case ignore

" Comment
" TODO Comment
syn match rapidTodoComment contained /\<todo\>\|\<fixme\>\|\<xxx\>/
highlight link rapidTodoComment Todo
" Debug comment
syn match rapidDebugComment contained /\<debug\>/
highlight link rapidDebugComment Debug
" Line comment
syn match rapidComment /\!.*$/ contains=rapidTodoComment,rapidDebugComment
highlight link rapidComment Comment
" ---

" Header
syn match rapidHeader /^%%%/
highlight link rapidHeader PreProc
" ---

" Constant values
" Boolean
syn keyword rapidBoolean TRUE FALSE Edge High Low
highlight link rapidBoolean Boolean
" Float (num)
syn match rapidFloat /\W\@1<=[+-]\?\d\+\.\?\d*\([eE][+-]\?\d\+\)\?/
highlight link rapidFloat Float
" character code in string
syn match rapidCharCode '\\\d\d' contained
highlight link rapidCharCode Special
" String. Note: Don't rename group rapidString. Indent depend on this
syn region rapidString start=/"/ end=/"/ contains=rapidCharCode
highlight link rapidString String
" ---

" Type
syn keyword rapidType aiotrigg bool btnres busstate buttondata byte
syn keyword rapidType clock confdata corrdescr datapos dionum dir dnum
syn keyword rapidType errdomain errnum errstr errtype event_type exec_level extjoint handler_type
syn keyword rapidType icondata identno intnum iodev iounit_state jointtarget
syn keyword rapidType listitem loaddata loadidnum loadsession mecunit motsetdata
" num, siehe unten
syn keyword rapidType opcalc opnum orient paridnum paridvalidnum pathrecid pos pose progdisp
syn keyword rapidType rawbytes restartdata rmqheader rmqmessage rmqslot robjoint robtarget
syn keyword rapidType shapedata signalai signalao signaldi signaldo signalgi signalgo socketdev socketstatus speeddata stoppoint stoppointdata string stringdig switch symnum syncident
syn keyword rapidType taskid tasks testsignal tooldata tpnum trapdata triggdata triggios triggiosdnum triggstrgo tunetype
syn keyword rapidType uishownum wobjdata wzstationary wztemporary zonedata
highlight link rapidType Type
" Storage class
syn keyword rapidStorageClass LOCAL TASK GLOBAL VAR PERS CONST ALIAS NOVIEW NOSTEPIN VIEWONLY READONLY SYSMODULE INOUT
highlight link rapidStorageClass StorageClass
" Not a typedef but I like to have those highlighted different then types,
" structures or strorage classes
syn keyword rapidTypeDef MODULE ENDMODULE PROC ERROR UNDO BACKWARD ENDPROC RECORD ENDRECORD TRAP ENDTRAP FUNC ENDFUNC
highlight link rapidTypeDef TypeDef
" ---

" Statement
" syn keyword rapidStatement
" highlight link rapidStatement Statement
" Conditional
syn keyword rapidConditional IF THEN ELSEIF ELSE ENDIF TEST CASE DEFAULT ENDTEST
highlight link rapidConditional Conditional " Not a typedef but I like to have those highlighted different then types,
" Repeat
syn keyword rapidRepeat FOR FROM TO STEP ENDFOR WHILE ENDWHILE DO
highlight link rapidRepeat Repeat
" Label
syn keyword rapidLabel GOTO
syn match rapidLabel /\c\v^\s*\a\w*\:\ze([^=]|$)/
highlight link rapidLabel Label
" Keyword
syn keyword rapidKeyword AccSet ActEventBuffer ActUnit Add AliasIO BitClear BitSet BookErrNo
syn keyword rapidKeyword CallByVar CancelLoad CheckProgRef CirPathMode Clear ClearIOBuff ClearPath ClearRawBytes ClkReset ClkStart ClkStop Close CloseDir Comment ConfJ ConfL CONNECT CopyFile CopyRawBytes CorrClear CorrCon CorrDiscon CorrWrite
syn keyword rapidKeyword DeactEventBuffer DeactUnit Decr DitherAct DitherDeact DropWObj EOffsOff EOffsOn EOffsSet EraseModule ErrLog ErrRaise ErrWrite
syn keyword rapidKeyword GetDataVal GetSysData GetTrapData GripLoad HollowWristReset IDelete IDisable IEnable IError Incr IndAMove IndCMove IndDMove IndReset IndRMove InvertDO IOBusStart IOBusState IODisable IOEnable IPers IRMQMessage ISignalAI ISignalAO ISignalDI ISignalDO ISignalGI ISignalGO ISleep ITimer IVarValue IWatch
syn keyword rapidKeyword Load LoadId MakeDir ManLoadIdProc MechUnitLoad MotionSup MToolRotCalib MToolTCPCalib Open OpenDir
syn keyword rapidKeyword PackDNHeader PackRawBytes PathAccLim PathRecMoveBwd PathRecMoveFwd PathRecStart PathRecStop PathResol PDispOff PDispOn PDispSet ProcCall ProcerrRecovery PulseDO
syn keyword rapidKeyword RaiseToUser ReadAnyBin ReadBlock ReadCfgData ReadErrData ReadRawBytes RemoveDir RemoveFile RenameFile Reset ResetPPMoved ResetRetryCount RestoPath Rewind RMQEmptyQueue RMQFindSlot RMQGetMessage RMQGetMsgData RMQGetMsgHeader RMQReadWait RMQSendMessage RMQSendWait
syn keyword rapidKeyword Save SCWrite SenDevice Set SetAllDataVal SetAO SetDataSearch SetDataVal SetDO SetGO SetSysData SingArea SkipWarn SocketAccept SocketBind SocketClose SocketConnect SocketCreate SocketListen SocketReceive SocketSend SoftAct SoftDeact SpeedLimAxis SpeedLimCheckPoint SpeedRefresh SpyStart SpyStop StartLoad STCalib STClose StepBwdPath STIndGun STIndGunReset SToolRotCalib SToolTCPCalib STOpen StorePath STTune STTuneReset SyncMoveOff SyncMoveOn SyncMoveResume SyncMoveSuspend SyncMoveUndo SystemStopAction
syn keyword rapidKeyword TestSignDefine TestSignReset TextTabInstall TPErase TPReadDnum TPReadFK TPReadNum TPShow TPWrite TriggCheckIO TriggEquip TriggInt TriggIO TriggRampAO TriggSpeed TriggStopProc TryInt TuneReset TuneServo
syn keyword rapidKeyword UIMsgBox UIShow UnLoad UnpackRawBytes VelSet WaitAI WaitAO WaitDI WaitDO WaitGI WaitGO WaitLoad WaitRob WaitSyncTask WaitTestAndSet WaitTime WaitUntil WaitWObj WarmStart WITH WorldAccLim Write WriteAnyBin WriteBin WriteBlock WriteCfgData WriteRawBytes WriteStrBin WriteVar WZBoxDef WZCylDef WZDisable WZDOSet WZEnable WZFree WZHomeJointDef WZLimJointDef WZLimSup WZSphDef
highlight link rapidKeyword Keyword
" Exception
syn keyword rapidException Stop EXIT ExitCycle RAISE RETRY RETURN TRYNEXT
highlight link rapidException Exception
" ---

" special keyword for move command
syn keyword rapidMovement Break StopMove StopMoveReset
syn keyword rapidMovement StartMove StartMoveRetry
syn keyword rapidMovement DispL DispC DispJ
syn keyword rapidMovement SpotL SpotJ
syn keyword rapidMovement NutL NutJ
syn keyword rapidMovement MoveAbsJ MoveExtJ MoveJ MoveL MoveC
syn keyword rapidMovement MoveJDO MoveLDO MoveCDO MoveJSync MoveLSync MoveCSync
syn keyword rapidMovement SearchC SearchExtJ SearchL
syn keyword rapidMovement TriggC TriggJ TriggL TriggLIOs
if exists("g:rapidNoHighlight") && g:rapidNoHighlight==1
      \|| exists("g:rapidNoHighLink") && g:rapidNoHighLink==1
  highlight link rapidMovement Movement
else
  highlight link rapidMovement Special
endif
" ---

" Operator
syn keyword rapidOperator and or xor not Div Mod
syn match rapidOperator /[+-]\|\*\|\/\|\([<>:][>=]\)\|[<>=]/
highlight link rapidOperator Operator
" ---

" Delimiter
syn match rapidDelimiter /\\\||\|\[\|\]\|[(){}]\|[,;]/
highlight link rapidDelimiter Delimiter
" ---

syn match rapidNames /[a-zA-Z_][.a-zA-Z0-9_]*/ containedin=rapidCallByVar
highlight link rapidNames None
" Function
syn match rapidFunction contains=rapidBuildInFunction /[a-zA-Z_]\w* *(/me=e-1
highlight link rapidFunction Function
" call by var: %"product"+NumToStr(nProductNumber)%
syn region rapidCallByVar start=/%\ze[^%]/ end=/[^%]\zs%/ contains=ALL
highlight link rapidCallByVar Function
" ---

" nicht schoen, aber num muss nach rapidNames folgen
" TODO optimier das (nicht gefolgt von : und nicht vorneangestellter \
syn match rapidType /\c\<num\>\s\+\ze\w\+/ " avoid false highlighting if its a \num:= argument

" BuildInFunction
syn keyword rapidBuildInFunction contained Abs AbsDnum ACos AOutput ArgName ASin ATan ATan2
syn keyword rapidBuildInFunction contained BitAnd BitAndDnum BitCheck BitCheckDnum BitLSh BitLShDnum BitNeg BitNegDnum BitOr BitOrDnum BitRSh BitRShDnum BitXOr BitXOrDnum ByteToStr
syn keyword rapidBuildInFunction contained CalcJointT CalcRobT CalcRotAxFrameZ CalcRotAxisFrame CDate CJointT ClkRead CorrRead Cos CPos CRobT CSpeedOverride CTime CTool CWObj
syn keyword rapidBuildInFunction contained DecToHex DefAccFrame DefDFrame DefFrame Dim Distance DnumToNum DnumToStr DotProd DOutput DInput
syn keyword rapidBuildInFunction contained EulerZYX EventType ExecHandler ExecLevel Exp
syn keyword rapidBuildInFunction contained FileSize FileTime FSSize
syn keyword rapidBuildInFunction contained GetMecUnitName GetModalPayLoadMode GetNextMechUnit GetNextSym GetServiceInfo GetSysInfo GetTaskName GetTime GInput GInputDnum GOutput GOutputDnum
syn keyword rapidBuildInFunction contained HexToDec
syn keyword rapidBuildInFunction contained IndInpos IndSpeed IOUnitState IsFile IsMechUnitActive IsPers IsStopMoveAct IsStopStateEvent IsSyncMoveOn IsSysId IsVar
syn keyword rapidBuildInFunction contained MaxRobSpeed MirPos ModExist ModTime MotionPlannerNo
syn keyword rapidBuildInFunction contained NonMotionMode NOrient NumToDnum NumToStr
syn keyword rapidBuildInFunction contained Offs OpMode OrientZYX ORobT
syn keyword rapidBuildInFunction contained ParIdPosValid ParIdRobValid PathLevel PathRecValidBwd PathRecValidFwd PFRestart PoseInv PoseMult PoseVect Pow PowDnum PPMovedInManMode Present ProgMemFree
syn keyword rapidBuildInFunction contained RawBytesLen ReadBin ReadDir ReadMotor ReadNum ReadStr ReadStrBin ReadVar RelTool RemainingRetries RMQGetSlotName RobName RobOS Round RoundDnum RunMode
syn keyword rapidBuildInFunction contained Sin SocketGetStatus Sqrt SqrtDnum STCalcForce STCalcTorque STIsCalib STIsClosed STIsIndGun STIsOpen StrDigCalc StrDigCmp StrFind StrLen StrMap StrMatch StrMemb StrOrder StrPart StrToByte StrToVal
syn keyword rapidBuildInFunction contained Tan TaskRunMec TaskRunRob TasksInSync TestAndSet TestDI TestSignRead TextGet TextTabFreeToUse TextTabGet Trunc TruncDnum Type
syn keyword rapidBuildInFunction contained UIAlphaEntry UIClientExist UIDnumEntry UIDnumTune UIListView UIMessageBox UINumEntry UINumTune
syn keyword rapidBuildInFunction contained ValidIO ValToStr Vectmagn
if exists("g:rapidNoHighlight") && g:rapidNoHighlight==1
      \|| exists("g:rapidNoHighLink") && g:rapidNoHighLink==1
  highlight link rapidBuildInFunction BuildInFunction
else
  highlight link rapidBuildInFunction Function
endif
" ---

" Error
if exists("g:rapidShowError") && g:krlShowError==1
  " some more or less common typos
  "
  syn match krlError /\c\v^\s*\zs(esle>|endfi>|ednif>|ednwhile>|ednfor>)/
  "
  " WaitUntil a==b ok
  "            ||
  syn match krlError /\c\v(^\s*(return|waituntil)>[^!\\]+[^!<>])@<=(\=|:)\=/
  syn match krlError /\c\v(^\s*if>[^!\\]+[^!<>])@<=(\=|:)\=\ze[^!]*then/
  syn match krlError /\c\v(^\s*while>[^!\\]+[^!<>])@<=(\=|:)\=\ze[^!]*do/
  "
  " WaitUntil a=>b ok
  "            ||
  syn match krlError /\c\v(^\s*(return|waituntil|if|while)>[^!]+[^!<>])@<=\=[><]/
  "
  " wait for a><b ok
  "           ||
  syn match krlError /\c\v(^\s*(return|waituntil|if|while)[^!]+)@<=\>\s*\</
  "
  " if (a==5) (b==6) ok
  "         |||
  syn match krlError /\c\v(^\s*(return|wait\s+for|if|while)[^!]+[^!])@<=\)\s*\(/
  "
  " a == b + 1 ok
  "   ||
  syn match krlError /\c\v(^\s*((global\s+|task\s+|local\s+)?(var|pers|const)\s+\w+\s+)?\w+(\w|\{|\}|\+|\-|\*|\/|\.)*\s*)@<=\=/
  "
  " this one is tricky. Make sure this does not match trigger instructions
  " a = b and c or (int1=int2)
  "                     |
  " syn match krlError /\c\v(^\s*\$?[^=;]+\s*\=[^=;][^;]+[^;<>=])@<=\=[^=]/
  " syn match krlError /\c\v^\s*(trigger\swhen\s)@<!(\$?[^=;]+\s*\=[^=;][^;]+[^;<>=])@<=\=[^=]/
  "
  highlight link krlError Error
endif
" ---

let b:current_syntax = "rapid"

" vim:sw=2 sts=2 et
