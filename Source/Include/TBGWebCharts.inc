{$DEFINE FULL}

{$IFNDEF FPC}
  {$IF Declared(FireMonkeyVersion) or Defined(FRAMEWORK_FMX) or Defined(LINUX64)}
    {$DEFINE HAS_FMX}
  {$IFEND}
{$ENDIF}

(* IF CEF is installed, uncomment below*)

  {$DEFINE HAS_CHROMIUM}