# Package

version       = "0.1.0"
author        = "Mutsuha Asada"
description   = "A new awesome nimble package"
license       = "Apache-2.0"
srcDir        = "src"
binDir        = "bin"
namedBin      = { "ffmpeg_mach_o_relocationer": "ffmpeg-mach-o-relocationer" }.toTable

# Dependencies

requires "nim >= 1.6.10"
