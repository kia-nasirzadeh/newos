$global:dashboardPath = "C:\Users\kia-nasirzadeh\Desktop\dashboard";
function kia-help () {
    echo "
    config -user
    cdt -das -des
    exp
    tit
    chr
    edi -typora -code
    key
    ";
}
function key () {
    $path = $HOME + "\Documents\keyboard.ahk";
    Start-Process $path;
}
function edi {
    param (
        [switch] $code,
        [string] $typora
    )
    if ($code) {
        code .;
    } elseif ($typora) {
        $path = $env:ProgramFiles + "\Typora\Typora.exe";
        Start-Process $typora | Out-Null;
    }
}
function exp () {
    explorer.exe .;
}
function cdt {
    param(
        [switch] $das,
        [switch] $des,
        [switch] $dow,
        [switch] $exp,
        [switch] $doc,
        [switch] $etc
    )
    if ($das) {
        cd $dashboardPath;
    } elseif ($des) {
        $path = $HOME + "\Desktop";
        cd $path;
    } elseif ($dow) {
        $path = $HOME + "\Downloads";
        cd $path;
    } elseif ($doc) {
        $path = $HOME + "\Documents";
        cd $path;
    } elseif ($etc) {
        cd "C:\Windows\System32\drivers\etc"
    }

    if ($exp) { exp; }
}
function kia-get-control ($path) {
    # for example $path="D:\Windows.old"
    $acl = Get-Acl $path

    # get sid of LOCAL SERVICE:
    # $sid = New-Object System.Security.Principal.SecurityIdentifier("S-1-5-19")
    # $localServiceName = ($sid.Translate([System.Security.Principal.NTAccount])).Value
    # $user = $localServiceName;

    # get osid of a user e.g. kia-nasirzadeh (which is kia-desktop\kia-nasirzadeh):
    # $username = 'kia-nasirzadeh';
    # $sid = New-Object System.Security.Principal.NTAccount($username)
    # $localServiceName = $sid.Translate([System.Security.Principal.SecurityIdentifier]);
    # $localServiceName = $localServiceName.Value;
    # $sid = $localServiceName;
    # $osid = New-Object System.Security.Principal.SecurityIdentifier($sid);
    # $user = $osid.Translate([System.Security.Principal.NTAccount]);
    # $user = $user.Value;

    # get osid of SYSTEM:
    # $sid = "SYSTEM";
    # $user = $sid;

    # get osid of Administrator:
    # $user = "Administrator";

    $permission = $user,"FullControl","ContainerInherit, ObjectInherit","None","Allow"
    $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($permission)
    try {
        $acl.SetAccessRule($accessRule)
    } catch {
        Write-Host "the error is $_"
    }
    $acl | Set-Acl $path
}
function tit {
    param (
        [string] $title
    )
    $Host.UI.RawUI.WindowTitle = $title;
}
function chr {
    param (
        [switch] $colife,
        [switch] $colifeApi,
        [switch] $colifeMeeting,
        [switch] $colifeJira
    )
    $chrome_exe = $env:ProgramFiles + "\Google\Chrome\Application\chrome.exe";
    $work_link_1 = "https://web.whatsapp.com/";
    $work_link_2 = "https://gitlab.testprojects.ir/root/colife-backend/-/tree/main";
    $work_link_3 = "https://colife-labs.atlassian.net/jira/software/projects/COL/boards/1";
    $work_link_4 = "https://www.figma.com/files/team/1026457890217412235/Co-Life?fuid=1043898222873738095"
    $work_link_5 = "http://app.colifelabs.net/";
    $work_link_6 = "https://api.colifelabs.net/";
    $work_link_7 = "https://meet.google.com/ouu-hbof-oyk";
    if ($colife) {
        Start-Process -FilePath $chrome_exe -ArgumentList "--new-window",$work_link_1,$work_link_2,$work_link_3,$work_link_4,$work_link_5;
    } elseif ($colifeApi) {
        Start-Process -FilePath $chrome_exe -ArgumentList "--new-window",$work_link_6;
    } elseif ($colifeMeeting) {
        Start-Process -FilePath $chrome_exe -ArgumentList "--new-window",$work_link_7;
    } elseif ($colifeJira) {
        Start-Process -FilePath $chrome_exe -ArgumentList "--new-window",$work_link_3;
    } else {
        Start-Process $chrome_exe;
    }
}
function todo {
    $path = $env:ProgramFiles + "\Typora\Typora.exe";
    $todoFile = $HOME + "\Documents\todo.md";
    Start-Process $path $todoFile | Out-Null;
}
function editProfile () {
    cd "C:\Users\kia-nasirzadeh\Documents\WindowsPowerShell";
    edi -code;
    Start-Process -FilePath 'C:\Program Files\Google\Chrome\Application\chrome.exe' -ArgumentList 'https://github.com/kia-nasirzadeh/newos';
}
