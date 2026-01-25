# ClearMyMessages - Vencord Plugin

A powerful and reliable Vencord plugin to clear all your own messages in any Direct Message (DM).


### Manual Installation

1. Download the `clearMyMessages` folder.
2. Navigate to your Vencord installation directory:
   - Typically: `%AppData%\Vencord\src\plugins\`
   Or if you havn´t build it yet you can do it like this:
   1.`git clone https://github.com/Vencord/Vencord.git`
   2.`cd Vencord`
3. Copy the `clearMyMessages` folder into the `plugins` (vencord/src/plugins) directory.
4. Restart Discord or rebuild Vencord (`pnpm build` and after `pnpm inject`).
5. Enable the plugin in Vencord Settings -> Plugins.

## Usage

1. Open the channel where you want to delete your messages.
2. **Right-click your own name** (on a message or in the member list).
3. Click the **"Clear all"** button at the bottom of the menu.
4. Watch the progress in the toasts at the top of your screen.
5. To stop early, right-click yourself again and click **"Stop Clearing"**.
