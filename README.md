# cwebpb - Batch WebP Converter Plugin for Oh-My-Zsh

A convenient Oh-My-Zsh plugin that converts common image formats (JPG, PNG, GIF, BMP, TIFF) to WebP format using Google's `cwebp` tool in batch mode.

## Features

- 🖼️ Converts multiple image formats to WebP
- 📁 Process entire directories or current directory
- ⚙️ Flexible `cwebp` options support
- 🔒 Safe: skips existing WebP files to avoid overwriting
- 📊 Progress reporting with conversion summary
- 🎯 Case-insensitive file extension matching
- ✨ Clean, colorful output with status indicators

## Prerequisites

You need to have `cwebp` installed on your system:

**macOS:**

```bash
brew install webp
```

**Ubuntu/Debian:**

```bash
sudo apt install webp
```

**Arch Linux:**

```bash
sudo pacman -S libwebp
```

**Windows (WSL):**

```bash
sudo apt install webp
```

## Installation

### Method 1: Using Oh-My-Zsh custom plugins

1. Clone this repository into your custom plugins directory:

```bash
git clone https://github.com/adi-li/zsh-cwebpb.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-cwebpb
```

2. Add the plugin to your `~/.zshrc` file:

```bash
plugins=(... zsh-cwebpb)
```

3. Restart your terminal or run:

```bash
source ~/.zshrc
```

### Method 2: Using Antigen

Add this line to your `~/.zshrc`:

```bash
antigen bundle adi-li/zsh-cwebpb
```

### Method 3: Using Zinit

Add this line to your `~/.zshrc`:

```bash
zinit load "adi-li/zsh-cwebpb"
```

## Usage

### Basic Usage

```bash
# Convert all images in current directory (default quality: 85)
cwebpb

# Convert images in specific directory
cwebpb /path/to/images

# Convert with custom quality
cwebpb -- -q 90

# Convert specific directory with custom quality
cwebpb /path/to/images -- -q 90
```

### Advanced Usage

```bash
# High quality conversion
cwebpb -- -q 95 -m 6

# Lossless conversion
cwebpb -- -lossless

# Low quality for smaller files
cwebpb -- -q 60

# Multiple options
cwebpb /path/to/images -- -q 80 -alpha_q 85 -m 4
```

### Supported Image Formats

- JPEG/JPG
- PNG
- GIF
- BMP
- TIFF/TIF

All file extensions are matched case-insensitively (e.g., `.JPG`, `.png`, `.GiF` all work).

## Output Example

```
🖼️  Converting images in: ./photos
⚙️  Using cwebp options: -q 85

✓ Converted: IMG_001.jpg → IMG_001.webp
✓ Converted: photo.PNG → photo.webp
⚠ Skipped (already exists): existing.webp
✗ Failed to convert: corrupted.gif

📊 Summary: 2 converted, 1 skipped, 1 failed
```

## Commands

- `cwebpb` - Batch WebP conversion function (cwebp batch)

## License

MIT License - feel free to use and modify as needed.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Issues

If you encounter any problems or have suggestions, please open an issue on GitHub.
