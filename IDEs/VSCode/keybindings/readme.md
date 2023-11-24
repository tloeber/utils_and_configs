# VSCode Keybindings
- Goals:
  - intuitive/easy to memorize
  - avoid collision with global shortcuts
  - cross-platform compatibility, if possible
- See my general discussion of how these shortcuts fit into other important shortcuts, as well more on the goals and strategy [here]() (coming soon).
## Useful default shortcuts
- Settings: Ctrl + , (default)
- keyboard shortcuts: ctrl + K, ctrl + S (default)
## View
- **Toggle current view width** (to better view nested folder structure):  incr/decr view (Ctrl + Super + up/down)
  - sidebar: focus on it first (Ctrl + shift + B),
- Resize (left/right) panel: ctrl + shift + left/right  (Terminal, Problems, Debug Console, Jupyter VAriables, Git Lens, etc)
## Navigation
- Open (folder/workspace/file) in new window ("reuse"; default): code **-r** ./
- Open (folder/workspace/file) in existing window: code **-e** ./
- Open file: Ctrl +  *shift* + O
- ***Quick* open file: Ctrl + O**
- Reset editor group size (to default?:
- Focus **Problems** (static analysis and linting): Ctrl + P
- Focus **remotes**: Ctrl + shift + R
- Focus **WSL** targets: Ctrl + shift + W
- Focus Explorer (**files**): control + shift + E
- Focus **git**: control + shift + G
- **Command Palette**: Control + P
## Editor
- focus last editor: Ctrl + E
- **navigate previous tabs: (hold ctrl) + tab**
- ***previously active*/next (left/right) tab: alt left/right** (Try what difference is)
- ~~**left/right tab: ctrl + pg up/dwn (like in web browser)**~~
- **Focus previous/next** (left/right) tab ***group*: shift + pg up/dwn**
- **Focus above/below** tab ***group*: ctrl + shift + pg up/dwn**
- ***Move*** tab to left/right/above/below ***group*:  alt +**left/right/up/down
- Move tab to ***new* group**:  (Useful when collapsing terminal and wanting a *third* group) : Just use above (alt + left/right/up/down)
- **increase/decrease current view** (works for sidebar too): **ctrl + *super* + up/down** (windows specific - find better shortcut?)
- *Toggle* split editor in group (split/unsplit for given group): ?
- **- Toggle maximize terminal: Ctrl + M**
- Run *current* file: Ctrl + enter
- **Run file*selection*: Ctrl + shift + enter**
- Run *previously* run file: ? (Useful when editing modules and checking if main or a specific test works).
- (Run main/run configuration: ?)
- Run current *Notebook cell*: Ctrl + Enter
- **Rename** (refactor) variable: ctrl + R
- Refactor (opens menu):  ~~(Note that `ctrl + *shift* + R` is used for "replace across files", to keep consistency with "find across files", which by default is `ctrl + shift + F`).~~
- Replace in File:
- Find in File: ctrl + F (Would be more symmetrical with 'replace' to add shift, though, but since 'find' is more ingrained, decided against it.)
- Replace in File: ? (ctrl + R is taken by "rename", and alt + R is taken by Restarting debugger)
- Find/replace *across project*: ctrl + shift + F/R
- **Find filename: alt + shift+ F** (alt + F selects "Find" menu at the top left, Ctrl + F finds in current file, Ctrl + shift + F  finds in all files)
- Go to a function's/class's *definition*: Ctrl + Shift + D
- Find function's/class's *usages*: Ctrl + shift + U
## Debugger
- Run with debugger: ctrl + D ~~or alt + D~~
- Focus debug *console*: alt + D ~~or alt + 0 (Similar to "focus console").~~ Used to use ctrl + shift + D, but using that to go to function/class definition.
- Continue: alt + C
- Step into: alt + I
- Step out: alt + O
- Restart: alt + R
- Stop:  Alt + Q (if Python) or Alt + S (may be confusing with *step* in/out) or Ctrl* + C?
- Disconnect: alt + Q (if Jupyter/remote?)**
## Terminal
- Focus: ctrl + 0
- Hide: Ctrl + shift + 0 (On Windows, ctrl + 0 also unfocuses sidebar, but not on MacOS)
- Split Terminal horizontally:  (Same as Jupyter split cell?)
- Go up/down: T + left/right?
- Go left/right: (Same as next/prev. editor tab?)

## Jupyter
### Same as notebook in browser
- Split cell at cursor: ctrl + shift + "-"


## Custom