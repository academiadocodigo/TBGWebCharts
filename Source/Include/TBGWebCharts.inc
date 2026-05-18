{$DEFINE FULL}

{$IFNDEF FPC}
  {$IF Declared(FireMonkeyVersion) or Defined(FRAMEWORK_FMX) or Defined(LINUX64)}
    {$DEFINE HAS_FMX}
  {$IFEND}
{$ENDIF}

{$IF Defined(VER200) or (CompilerVersion >= 20)}
  {$DEFINE UNICODE}
{$ELSE}
  {$DEFINE ANSI}
{$IFEND}

(* IF CEF is installed, uncomment below*)

  { $DEFINE HAS_CHROMIUM}