admin_pedswap

Admin-only, one-time ped swap utility for FiveM
Designed to work safely alongside illenium-appearance without persistence, metadata, or interference with normal character loading.

Overview

admin_pedswap allows server admins to:

- Temporarily change a player’s ped model one time

- Force a player to reload their illenium-appearance skin

Safely revert players back to their original appearance without saving anything

This script does nothing automatically.
It only acts when an admin runs a command.




---------Key Features-----------

✅ One-time ped swap (no persistence)

✅ Fully compatible with illenium-appearance

✅ Players revert naturally on /reloadskin

✅ Admins can force a target player to reload their skin

✅ No metadata, no database writes, no whitelists

✅ Supports me shorthand for self-targeting

Requirements

- FiveM server

- illenium-appearance (required for skin reload functionality)

- ox_lib (optional, used only for notifications)





----------Installation-----------

Place the resource in your server:

resources/[standalone]/admin_pedswap


Add to your server.cfg:

ensure admin_pedswap


Grant admin permission:

add_ace group.admin admin.pedswap allow





----------Commands (Admin Only)---------
/setped <id|me> <model>

Applies a one-time ped change to a player.

Examples:

/setped 12 a_c_chimp
/setped me a_c_chimp


The ped change is temporary

Nothing is saved

Player returns to normal after /reloadskin

/forcereloadskin <id|me>

Forces the target player to reload their illenium-appearance skin.




Examples:

/forcereloadskin 12
/forcereloadskin me


Same effect as the player running /reloadskin

Safely restores original character appearance

Behavior Notes (Important)

This script never:

Saves ped models

Alters character metadata

Runs on spawn or reconnect

Overrides illenium’s pipeline



If a player:

Runs /reloadskin → they revert automatically

Reconnects → nothing persists

Respawns → nothing persists




This makes the script ideal for:

Admin punishments

Events

Temporary RP effects

Testing ped models





Supported Ped Models

Any valid GTA V ped model can be used, for example:

a_c_chimp

a_c_chop

s_m_y_swat_01

ig_furry

⚠️ Tip: Avoid forcing broken or experimental models on players.
The script intentionally does not restrict models unless you add your own allowlist.




----------Permissions-----------

This script uses FiveM ACE permissions

Required ACE:

admin.pedswap


Console always has access.

Compatibility
Resource	Compatible
illenium-appearance	✅
qb-core / qbx	✅
esx	✅
ox_lib	✅ (optional)
txAdmin	✅


-------Troubleshooting--------

Player stays stuck as animal

Run /forcereloadskin <id>

Or ask player to run /reloadskin

Command doesn’t work

Verify ACE permission is set

Ensure resource is started

Ensure player ID is correct

Console usage

Console cannot use me

Use numeric player IDs only

License / Usage

Free to use and modify

Intended for server administration

No warranty implied