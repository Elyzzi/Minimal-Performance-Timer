unit uTimer;

interface

uses
  Windows,
  SysUtils;

type
  Timer = class
  public
    class function GetElapsedSeconds: Extended;
    class function GetElapsedMilliseconds: Extended;
    class procedure PrintDelta(StartTime: Extended; FuncName: String);
  end;

var
  Timer_StartCount: Int64;
  Timer_Frequency: Int64;

implementation

class function Timer.GetElapsedSeconds: Extended;
var
  EndCount: Int64;
begin
  QueryPerformanceCounter(EndCount);
  Result := (EndCount - Timer_StartCount) / Timer_Frequency;
end;

class function Timer.GetElapsedMilliseconds: Extended;
var
  EndCount: Int64;
begin
  QueryPerformanceCounter(EndCount);
  Result := ((EndCount - Timer_StartCount) / Timer_Frequency) * 1000.0;
end;

class procedure Timer.PrintDelta(StartTime: Extended; FuncName: String);
begin
  WriteLn(FuncName + ' dur: ' + FloatToStr(GetElapsedMilliseconds - StartTime) + ' ms');
end;

initialization
  QueryPerformanceFrequency(Timer_Frequency);
  QueryPerformanceCounter(Timer_StartCount);
end.
