param($installPath, $toolsPath, $package, $project)

# move scripts/* content/js
# move content/less content/bootstrap
# move content/_less/* content/less
# delete content/_less


Write-Host "DOING A DANCE"

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

Write-Host "Moving Scripts"

ForEach ($item in $scripts.ProjectItems) {
	Write-Host $item.FileNames
	Write-Host $item.FileNames[0]
	Write-Host $item.FileNames(0)

	ForEach ($filename in $item.FileNames) {
		#Write-Host $filename, $item.Name
		#$js.ProjectItems.AddFromFileCopy($filename)
	}

	$item.Delete()
}

ForEach ($item in $less.ProjectItems) {
	ForEach ($filename in $item.FileNames) {
		Write-Host $filename
		#$bootstrap.ProjectItems.AddFromFileCopy($filename)
	}

	$item.Delete()
}

ForEach ($item in $_less.ProjectItems) {
	ForEach ($filename in $item.FileNames) {
		Write-Host $filename
		#$less.ProjectItems.AddFromFileCopy($filename)
	}

	$item.Delete()
}

$less.Delete()