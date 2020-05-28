# ezbuild
Simple makefile based build template

## Makefile cheat sheet
### Targets name
- **$@**: target filename
- **$* **: target filename without file extension
- **$<**: first prerequisite filename
- **$^**: filenames of all prerequisites, separated by spaces, discard duplicates
- **$+**: similar to *$^*, but includes duplicates
### Makefile commands
- **$(notdir names)**: extract all but the directory part of each file name in *names*.
