## v0.5.06 - 2025-09-29

### Added
- Added 'isDeathmessage' flag to cutscene objects
- Added value_in_array script
- Added character system for dialogue
- Added new Death Message Manager

### Fixed
- Fixed UI scaling during init loading screen
- Fixed comment on array script
- Fixed text alignment bug during dialogue
- Fixed wrong file committed

### Changed
- Changed Deathmessages to be unskippable
- Slightly lowered the chance of having no death message
- Changed 'No Easy Weapon' modifier to inverse 'Easy Weapon'
- Redid get/show death message functions to allow tags
- Refactored /deathmsg command for new system
- Refactored gameover death message call for new system
- Refactored death message list for new system

## v0.5.05 - 2025-06-23

### Added
- Added discord bot status
- Added Discord bot to send changelog messages

### Changed
- Disabled input during reward menu fade in
- Version text fades out when not in main menu
- Adjusted version text size

## v0.5.04 - 2025-06-21

### Added
- Added /setweapon command
- Added axe weapon functionality

### Fixed
- Fixed changelog text scaling at different resolutions
- Fixed changelog prompt showing in other menus

## v0.5.03 - 2025-06-19

### Added
- Added changelog menu to main menu
- Added string_split_unicode function
- Added string_from_file function
- Added new fonts for changelog

## v0.5.02 - 2025-06-19

### Added
- Added github changelog

## v0.5.01 - 2025-06-18

### Added
- Added string_all utility function
- Added console output to reload command
- Added active modifier count to level select menu
- Added outlaw birthdays / Christmas holiday and logo

### Fixed
- Fixed stage time reset / fixed stage number display
- Fixed achievement menu UI scaling

### Removed
- Removed unnecessary CRT effect textures

### Changed
- Level tweaks / Room reordering
- Initial setup for credits sequence
- New Dracula portraits
- Real FPS tracking for average and 10% lows
- Candles show their set drop if any when hitboxes are shown
- Tweaked skeleton throwing frequency
- Pitch variations for AI hit / death sounds
- Zombies stop horizontal movement when falling
- Checkpoints increase stage number
- New default volumes
