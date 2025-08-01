# Fiji Macros for Multi-Channel Image Processing

This repository contains Fiji/ImageJ macros for batch processing of microscopy images with 2, 3, or 4 fluorescent channels. These macros automate channel splitting, RGB merging, stacking, montage creation, and cleanup across folders of `.tif` or `.tiff` images.

## Overview

The macros support:
- **2-channel images**: Channel 2 mapped to red, Channel 1 to blue.
- **3-channel images**: Channel 3 mapped to red, Channel 2 to green, Channel 1 to blue.
- **4-channel images**: Same as 3-channel, with Channel 4 kept cyan or optional visualization.

For each image:
- Channels are split.
- A merged RGB composite is created with user-defined channel mappings.
- Channels are restacked into a single image for archiving.
- A montage is generated for easy viewing.
- Intermediate files are closed to reduce memory usage.

The macros are recursive, meaning they process all images in the selected directory and any subdirectories.
## Folder Structure

Each macro and a sample image demonstrating how the macro works is stored in its own folder:
Outputs include:
- `*_Stack.tif` — merged and stacked image
- `*_Montage.tif` — side-by-side montage for easy viewing

├── 2-color/
│ ├── 2color_macro.ijm
│ └── example/
│ └── 2channel.tif
│ └── 2channel_stack.tif
│ └── 2channel_Montage.tif

├── 3-color/
│ ├── 3color_macro.ijm
│ └── example/
│ └── 3channel.tif
│ └── 3channel_stack.tif
│ └── 3channel_Montage.tif

├── 4-color/
│ ├── 4color_macro.ijm
│ └── example/
│ └── 4channel.tif
│ └── 4channel_stack.tif
│ └── 4channel_Montage.tif

## Requirements

- [Fiji](https://fiji.sc/) (ImageJ distribution with built-in plugins)
- `.tif` or `.tiff` images with 2–4 fluorescent channels

## Usage

1. Open **Fiji/ImageJ**.
2. Run the desired macro:
   - `macro_2channel.ijm` for 2-channel images
   - `macro_3channel.ijm` for 3-channel images
   - `macro_4channel.ijm` for 4-channel images
3. Select the **parent folder** containing your image files.
4. The script will process `.tif` and `.tiff` files automatically and generate:
   - A stacked `.tif` image
   - A montage `.tif` image
   - RGB merged visualization (saved via stack/montage)

## Folder Structure

You can organize your files in nested folders. The macros will search recursively and process every valid `.tif`/`.tiff` image file they find.

## Customization

Channel mapping and color assignment can be changed easily within the macros if your imaging setup differs. Look for the `Merge Channels...` step in the code to customize.

## Author
Shreyas Sridhar – Researcher & aspiring bioinformatician


