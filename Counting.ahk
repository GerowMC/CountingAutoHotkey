#Requires AutoHotkey v2.0

^j::
{
    ; 1. Ask for the starting number
    StartInput := InputBox("Enter the starting number:", "Starting Number")
    if (StartInput.Result = "Cancel" || StartInput.Value = "")
        return

    ; 2. Ask for the number of loops
    LoopInput := InputBox("Enter the number of loops:", "Loop Count")
    if (LoopInput.Result = "Cancel" || LoopInput.Value = "")
        return

    ; 3. Ask for the delay in seconds
    DelayInput := InputBox("Enter the delay in seconds:", "Seconds Delay")
    if (DelayInput.Result = "Cancel" || DelayInput.Value = "")
        return

    ; Convert inputs to numbers
    StartNum := Number(StartInput.Value)
    LoopCount := Number(LoopInput.Value)
    ; Multiply by 1000 to convert seconds to milliseconds
    MsDelay := Number(DelayInput.Value) * 1000

    ; Type the first number
    Send(StartNum "{Enter}")
    Sleep(MsDelay)

    ; Loop for the rest
    Loop LoopCount + 1
    {
        StartNum += 1
        Send(StartNum "{Enter}")
        Sleep(MsDelay)
    }
}

; Press Escape to stop the script
Esc::ExitApp
