# Bash Text Editor

A text editor written in bash.
Cos why the fuck not

![screenshot](https://raw.github.com/Sidd-Dino/BTE/master/screenshot.png "screenshot")

## Requirements
```
bash 4+
```

## Progress..?

- [X] Loading file
- [X] Basic text navigation
- [ ] Complex text navigation
  - [X] `PGUP` and `PGDWN` nav
  - [X] `HOME` , `END` nav
  - [ ] `Ctrl+[arrow keys]` nav / Word based nav
- [X] Inserting characters
- [X] Removing characters
- [ ] Text manipulation
  - [ ] Selecting text
  - [ ] Copying selected text
  - [ ] Pasting selected text
  - [ ] Searching text
  - [ ] Replacing text
- [ ] Saving File
- [ ] Opening a file from an empty buffer
- [ ] Syntax Highlighting

## Keybindings
```
Arrow Keys  : For cursor movement
Pg Up       : To move up a page
Pg Dwn      : To move down a page

Meta+G      : Goto line/coord

Back Space  : To delete the character before the cursor
Delete      : To delete the character under the cursor

Meta+U      : Undo the most recent action
Meta+R      : Redo an undone action

Ctrl+W      : Search a pattern

Ctrl+O      : Save file
Ctrl+X      : Quit the editor
```