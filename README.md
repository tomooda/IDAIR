# ABM for I-DAIR project

## Installation
You can install the I-DAIR ABM by either downloading the pre-built binary package or manually build on Pharo 9 system from the source repositories.
Unless you are a Pharo developer, pre-built binary package would be a handy approach.

#### Pre-built binary packages for Windows/macOS

You can download executable applications from [our release page](https://github.com/tomooda/IDAIR/releases/tag/v1.0)

#### Manual installation on the Pharo9 system

1. Download Pharo 9 from [the Pharo project](https://pharo.org/).
2. Install Cormas v0.5 from [The Cormas project](https://github.com/cormas/cormas) following their instructions.
3. The I-DAIR ABM requires Roassal3 v1.0 from [The Roassal3 project](https://github.com/ObjectProfile/Roassal3). Cormas v0.8 also installs Roassal3, but the installation process sometimes fails to install the correct version. Please reload Roassal3 v1.0 if it's not cleanly installed.
4. Add this repository to Iceberg and load the *Cormas-Model-IDAIR* package.
5. Don't forget to save the image.
6. Enjoy!

## How to use

This ABM is designed to be used in a RPG (Role-Playing Game) developed in the I-DAIR project.
Operations on UIs are described below.

1. Launch an ABM

   <img width="1088" alt="ABM-desktop" src="https://github.com/tomooda/IDAIR/assets/836308/05b69dc1-e746-4443-ac63-9318c19c0d1f">

   If you open the ABM application, a desktop window, like the above, will appear.
   To launch an ABM, click at the *I-DAIR* menu (pointed by the red arrow in the fig).

2. Setup a game

   <img width="500" alt="game-setup" src="https://github.com/tomooda/IDAIR/assets/836308/bec2390e-57be-44f0-a9f1-99668ab4f99b">

   Enter the names of citizen players in the RPG. If your citizen players are less than 6, leave the excessive fields blank.
   You can also change the numbers of initial mild/severe patients according to the RPG settings.
   Press the OK button if all is set.

3. Setup the gamemaster's view and the public view
   
   An window with two tabs will occupy the ABM desktop.
   One tab, chosed by default, is labeled *Game Master*, and another is *Public View*.
   The public view can be spawned to another window outside the ABM desktop by clicking at the window button <img width="103" alt="spawn-button" src="https://github.com/tomooda/IDAIR/assets/836308/a8855d1b-e225-4d07-9a86-d583d4808ecc"> at the right-bottom corner.
   If you use a large screen or a projector to share the ABM with the players, spawning the public view and show it in the screen would be a good idea.

4. Operate on the gamemaster's view

   <img width="1339" alt="gamemasters-view" src="https://github.com/tomooda/IDAIR/assets/836308/b63b3f25-a72e-4f94-86d3-47dbb9608f2d">

   The gamemaster's view consists of four columns: the citizen's action, the hospital manager's action, the policymaker's action, and graphs.
   In the RPG, each citizen player has well-being points (wbp), which increase or decrease depending on the action card that the player drew and whether the player do the action or not.
   The gamemaster selects a player in the upper list and the player's action card in the lower list.
   If the player choose to *do* the action, the gamemaster presses the YES button.
   If the player does not, the gamemaster presses the NO button.

   The second column shows the hospital manager's actions, and the third shows policymaker's action.
   The lower list of policymaker's column shows actions that the policymaker can take.
   Some actions are shown with hand icons, which means *a poll is required*.
   If a policymaker player choose an action that requires a poll, the action will be appended into the upper list.
   The gamemaster can enter the conformance rate for the policy at the next round.

   The fourth and the right-most column visualises the current status of the disease and hospital beds.
   The gamemaster advises players and moves marbles refering to the visualised data.

5. Operate on the public view

   <img width="1339" alt="public-view" src="https://github.com/tomooda/IDAIR/assets/836308/d020f0a9-d34a-4872-b122-2d8b84648abf">

   The public view overviews the current status of the RPG, including how the disease is spreading and how the citizen is living in the situation.
   The large graph labeled *Course of the situation* shows the trends of populations for each medical condition: susceptible, infected, recovered, and dead, as well as the numbers of the occupied regular beds and the occupied ICUs.
   The three graphs in the lower row shows the player's status and responses to the implemented policy.

6. Operate on the simulation control bar

   <img width="328" alt="simulation-control" src="https://github.com/tomooda/IDAIR/assets/836308/6f8bf33c-8ec9-4aab-b688-423210ecd446">

   In order to simulate the spread of disease, the ABM assigns 100 citizen agents for each citizen players and have them do the same actions that the citizen player.
   As a result, the more the risky actions the citizen players take, the more the disease spread in the ABM.

   The gamemaster can proceed the simulation with the citizen agents act as the citizen players' decisions by pressing the run button. 


