# webp-converter.plugin.zsh
# WebP Converter Plugin for Oh-My-Zsh
# Converts common image formats to WebP using cwebp (batch mode)

cwebpb() {
  local folder="${1:-.}"
  local cwebp_args=()

  # Parse arguments - everything after -- goes to cwebp
  local found_double_dash=false
  for arg in "$@"; do
    if [[ "$arg" == "--" ]]; then
      found_double_dash=true
      continue
    fi
    if [[ "$found_double_dash" == true ]]; then
      cwebp_args+=("$arg")
    fi
  done

  # Default quality if no cwebp args provided
  if [[ ${#cwebp_args[@]} -eq 0 ]]; then
    cwebp_args=("-q" "85")
  fi

  # Check if cwebp is available
  if ! command -v cwebp &> /dev/null; then
    echo "✗ Error: cwebp command not found. Please install WebP tools."
    echo "  macOS: brew install webp"
    echo "  Ubuntu/Debian: sudo apt install webp"
    echo "  Arch: sudo pacman -S libwebp"
    return 1
  fi

  # Check if folder exists
  if [[ ! -d "$folder" ]]; then
    echo "✗ Error: Directory '$folder' does not exist"
    return 1
  fi

  echo "🖼️  Converting images in: $folder"
  echo "⚙️  Using cwebp options: ${cwebp_args[*]}"
  echo ""

  local converted_count=0
  local skipped_count=0
  local failed_count=0

  # Process files in the specified folder
  for file in "$folder"/*.(#i)(jpg|jpeg|png|gif|bmp|tiff|tif); do
    if [[ -f "$file" ]]; then
      output="${file%.*}.webp"
      if [[ ! -f "$output" ]]; then
        if cwebp "${cwebp_args[@]}" "$file" -o "$output" 2>/dev/null; then
          echo "✓ Converted: $(basename "$file") → $(basename "$output")"
          ((converted_count++))
        else
          echo "✗ Failed to convert: $(basename "$file")"
          ((failed_count++))
        fi
      else
        echo "⚠ Skipped (already exists): $(basename "$output")"
        ((skipped_count++))
      fi
    fi
  done

  echo ""
  echo "📊 Summary: $converted_count converted, $skipped_count skipped, $failed_count failed"
}
