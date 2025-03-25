# Script to organize modding documentation files

# Define the file organization structure
$fileStructure = @{
    "Documentation" = @("modding_intro.md", "online_docs.md", "scopes.md", "effects.md", "triggers.md", "variables.md", "modifier_list.md", "scripting.md")
    "Scripting" = @("ai.md", "bookmarks.md", "characters.md", "commands.md", "council.md", "culture.md", "decisions.md", "dynasties.md", "event.md", "governments.md", "history.md", "holdings.md", "regiments.md", "religions.md", "script_values.md", "story_cycles.md", "struggle.md", "title.md", "trait.md")
    "Interface" = @("interface.md", "data_types.md", "localization.md", "customizable_localization.md", "flavorization.md")
    "Map" = @("map.md", "terrain.md")
    "Graphics" = @("3d_models.md", "coat_of_arms.md", "graphical_assets.md", "fonts.md")
    "Audio" = @("music.md", "sound.md")
    "Other" = @("mod_structure.md")
}

# Create directories if they don't exist
foreach ($dir in $fileStructure.Keys) {
    if (-not (Test-Path $dir)) {
        New-Item -Path $dir -ItemType Directory -Force | Out-Null
        Write-Host "Created directory: $dir"
    }
}

# Move files to their respective directories
foreach ($dir in $fileStructure.Keys) {
    foreach ($file in $fileStructure[$dir]) {
        if (Test-Path $file) {
            Move-Item -Path $file -Destination $dir -Force
            Write-Host "Moved $file to $dir"
        } else {
            Write-Host "File not found: $file"
        }
    }
}

Write-Host "File organization complete." 