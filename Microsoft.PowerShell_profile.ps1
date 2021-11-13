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
        [switch] $doc
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
    $path = $env:ProgramFiles + "\Google\Chrome\Application\chrome.exe";
    Start-Process $path;
}