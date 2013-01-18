param($installPath, $toolsPath, $package, $project)

# move scripts/* content/js
# move content/less content/bootstrap
# move content/_less/* content/less
# delete content/_less

ForEach ($item in $project.ProjectItems) { 
	if ($item.Name -eq "Scripts"){
		Write-Host "Found Scripts"

		$scripts = $item
	}
	if ($item.Name -eq "Content"){
		Write-Host "Found Content"

		$content = $item

		ForEach ($subitem in $content.ProjectItems) {
			if ($subitem.Name -eq "js"){
				$js = $subitem
			}
			if ($subitem.Name -eq "bootstrap"){
				$bootstrap = $subitem
			}
			if ($subitem.Name -eq "less"){
				$less = $subitem
			}
			if ($subitem.Name -eq "_less"){
				$_less = $subitem
			}
		}
	}
}

ForEach ($item in $scripts.ProjectItems) {
	For ($i=0; $i -lt $item.FileCount; $i++)
	{
		Write-Host $item.FileNames($i)
		$js.ProjectItems.AddFromFileCopy($item.FileNames($i))
	}
}

$scripts.Delete()

ForEach ($item in $less.ProjectItems) {
	For ($i=0; $i -lt $item.FileCount; $i++)
	{
		Write-Host $item.FileNames($i)
		$bootstrap.ProjectItems.AddFromFileCopy($item.FileNames($i))
	}

	$item.Delete()
}

ForEach ($item in $_less.ProjectItems) {
	For ($i=0; $i -lt $item.FileCount; $i++)
	{
		Write-Host $item.FileNames($i)
		$less.ProjectItems.AddFromFileCopy($item.FileNames($i))
	}
}

$_less.Delete()