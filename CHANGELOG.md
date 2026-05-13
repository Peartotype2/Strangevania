## v0.5.11 - 2026-05-13

### Added
- Added a check for if save file is missing
- Added menu.accept_held input
- Added First Time Setup menu on first launch
- Added new song (song_ocarina)
- Added draw_outline function
- Added new Achievement popup settings
- Added setting_get_desc function
- Added setting to disable whip skin sounds
- Added description box for settings menu
- Added description attribute to settings
- Added setting for low-res screenshots
- Added ESC key to exit on save issue screens
- Added alert sound effect to save issue screens
- Added percent_whole function
- Added Angry Dracula portrait
- Added Happy and Concerned Death portraits
- Added new death messages
- Added level grade to reward screen
- Added new level completion grades (S, A, B, C, D)
- Added new level completion rating system
- Added 'achievements_unlocked_list' to achievement manager
- Added 'Achievement Whore' achievement
- Added milestoneList function
- Added warning screen for save file errors
- Added forcequit console command
- Added new icons for kill count achievements
- Added check for save file mismatch from backup

### Fixed
- Fixed new stats not loading properly from save
- Fixed room fade transition sometimes never finishing
- Fixed intro fading in slow when skip intro is enabled
- Fixed hidden stats not always displaying when cheats are enabled
- Fixed syntax error in draw_object_sprite_flicker
- Fixed screenshot sound delay
- Fixed Konami code not always triggering
- Fixed milestone popups not triggering when not meeting exact value

### Removed
- Removed blank test achievements

### Changed
- Increased log file max size
- General code cleanup
- Changed order of settings
- Adjusted song name display when in settings
- Tweaked debug FPS menu and lag switch
- Cleaned up old player vertical collision script
- Tweaked default CRT effect values
- Changed date format for saved files and logs
- Tweaked random chance calculations
- Adjusted Death portrait
- Changed death messages to be initialized in character objects
- Changed score multipliers for modifiers to be lower
- Changed most kill count achievements to use milestoneLists
- Renamed 'Champion' achievement to 'Vanquisher'
- Changed Warlord achievement to 5000 kills

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
