# 🎭 April_Fool.sh — Outsmart Your Pipeline, Save Your Disk

[![nf-core](https://img.shields.io/badge/nf--core-brightgreen?logo=nextflow)](https://nf-co.re/)
[![Nextflow](https://img.shields.io/badge/nextflow-%E2%9C%94-green?logo=nextflow)](https://www.nextflow.io/)
[![Bash Script](https://img.shields.io/badge/script-bash-blue?logo=gnu-bash)](https://www.gnu.org/software/bash/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Space Saved](https://img.shields.io/badge/space--saved-💾_GBs-critical)](https://nf-co.re/pipelines)

---

Ever run a heavy pipeline from `nf-core` only to have it crash halfway because your disk hit 100%? 😫
This cheeky little script helps you reclaim space *without* making the pipeline cry. Replace large output files with empty placeholders—or move them to an external drive—all while fooling your pipeline into thinking everything’s still there.

---

## Why April_Fool?

Sometimes, you don’t want to delete them just yet—but you **need your disk back** to keep things running.

Enter: `April_Fool.sh` 🎩

It either:
- ✅ Empties large files (preserves names, paths, and timestamps),
- ✅ Or moves them to external storage **and** leaves an empty file behind.

Your pipeline thinks it's business as usual. Meanwhile, you’re saving **gigabytes** of precious space.

---

## Features

- 🔁 Two modes: "Just Wipe" or "Move and Replace"
- 🎯 Preserves file structure
- 📂 Supports external HDD/SSD as destination
- 🎨 Fancy CLI output (for the aesthetic)
- 🛠️ Safe and easy to use

---

## Usage

```bash
./April_Fool.sh -i /path/to/output_dir [-d /path/to/external_HDD] [-m]
```

## Options
```
-i Input/output directory (where your pipeline writes files)
-d Destination directory (e.g., your external HDD)
-m Move files to destination before replacing with placeholders
-h Show help message
```

## Example

1. Wipe files in place (just replace them with 0-byte placeholders)

```bash
./April_Fool.sh -i /mnt/data/my_pipeline_output
```
2. Move files to external drive and replace with placeholders

```bash
./April_Fool.sh -i /mnt/data/my_pipeline_output -d /mnt/external_hdd/april_backup -m
```

## Disclaimer

This script does not compress or preserve original file content once removed from its location.
Be sure to back up any critical data before using!

## Credits

Developed by Abu Saadat aka the disk-saving ninja 🥷
Idea born out of desperation, tested under /mnt/panic.

Thanks to the fantastic nf-core and Nextflow communities for making pipelines awesome.

