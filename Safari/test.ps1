$title = "Install Safari for Windows"
$message = "Please note that Apple no longer supports or updates Safari for Windows, therefore there might be risks involved with installing it. Are you sure you want to continue installing Safari for Windows?"

$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", `
    "Installes Safari for Windows"

$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", `
    "Cancels the installation"

$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)

$result = $host.ui.PromptForChoice($title, $message, $options, 0) 

switch ($result)
    {
        0 {"You selected Yes."}
        1 {"You selected No."}
    }