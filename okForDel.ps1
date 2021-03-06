# set the input argument of the walkOnTotalItems equal to the path of the folder that you want to take ownership and set access of all files in it to the administrator
function getFileOwnership ($filePath) {
	takeown /F $filePath | out-null;
}

function grantACToAdministrator ($path) {
	$acl = Get-Acl $path
	$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("kia-desktop\Administrator","FullControl","Allow")
	$acl.SetAccessRule($AccessRule)
	$acl | Set-Acl $path
}

function walkOnTotalItems ([string]$path) {
	$totalItems = ls -Path $path;
	for ($i = 0; $i -lt $totalItems.Count; $i++) {
		$itemOrDirPath = $path + "\" + $totalItems[$i].Name;
		$target = Get-Item $itemOrDirPath;
		if ($target.PSIsContainer) {
			$newPath = $path + "\" + $totalItems[$i].Name;
			walkOnTotalItems($newPath);
		} else {
			getFileOwnership ($itemOrDirPath);
			grantACToAdministrator($itemOrDirPath);
		}
	}
}

walkOnTotalItems("C:\Program Files\WindowsApps");
