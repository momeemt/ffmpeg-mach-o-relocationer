import std/os
import std/strutils
import std/strformat

const
  UserLocalLib = "/usr/local/lib"
  AllVersionsFFmpegInHomebrew = "/opt/homebrew/Cellar/ffmpeg"

for dir in walkDir(AllVersionsFFmpegInHomebrew):
  for path in walkFiles(dir.path / "lib" / "*.dylib"):
    let name = path.split('/')[^1]
    if name.split('.')[1] != "dylib": continue
    discard tryRemoveFile(UserLocalLib / name)
    echo &"🗑 Delete: {UserLocalLib / name}"
    createSymlink(path, UserLocalLib / name)
    echo &"👍 Create Symbolic Link: {path} to {UserLocalLib / name}"

echo "🎉 Complete to relocate FFmpeg mach-o files!"